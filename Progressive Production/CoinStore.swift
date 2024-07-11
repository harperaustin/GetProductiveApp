//
//  CoinStore.swift
//  Progressive Production
//
//  Created by Harper Austin on 5/29/24.
//

import Foundation
import StoreKit

enum CoinsError: LocalizedError{
    case failedVerification
    case system(Error)
    
    var errorDescription: String? {
        switch self{
        case .failedVerification:
            return "User transaction verification failed"
        case .system(let err):
            return err.localizedDescription
        }
    }
}

enum CoinsAction : Equatable {
    case successful
    case failed(CoinsError)
    
    static func == (lhs: CoinsAction, rhs: CoinsAction) -> Bool{
        switch(lhs, rhs) {
        case (.successful, .successful):
            return true
        case (let .failed(lhsErr), let .failed(rhsErr)):
            return lhsErr.localizedDescription == rhsErr.localizedDescription
        default:
            return false
        }
    }
}

typealias PurchaseResult = Product.PurchaseResult
typealias TransactionListener = Task<Void, Error>

@MainActor
final class CoinStore: ObservableObject {
    @Published private(set) var items = [Product]()
    @Published private(set) var action: CoinsAction? {
        didSet{
            switch action{
            case .failed:
                hasError = true
            default:
                hasError = false
            }
        }
    }
    @Published var recentBuy = ""
    @Published var hasError = false
    
    var error: CoinsError? {
        switch action{
        case .failed(let err):
            return err
        default:
            return nil
        }
    }
    
    private var transactionListener: TransactionListener?
    
    
    init(){
        transactionListener = configureTransactionListener()
        
        Task{ [weak self] in
            await self?.retrieveProducts()
        }
    }
    
    deinit {
        transactionListener?.cancel()
    }
    
    func purchase(_ item: Product) async{
        do{
            await MainActor.run{
                recentBuy = item.displayName
            }
                let result = try await item.purchase()
                try await handlePurchase(from: result)
            
            
        } catch{
            action = .failed(.system(error))
            
            print("error!")
        }
    }
    
    func reset(){
        DispatchQueue.main.async{
            self.action = nil
        }
    }
    
}

private extension CoinStore{
    
    func configureTransactionListener() -> TransactionListener{
        Task.detached(priority: .background){ @MainActor [weak self] in
            do{
                for await result in Transaction.updates{
                    let transaction = try self?.checkVerified(result)
                    
                    self?.action = .successful
                    await transaction?.finish()
                }
            } catch{
                self?.action = .failed(.system(error))
            }
        }
    }
    
    func retrieveProducts() async {
        do{
            let products = try await Product.products(for: myProductIdentifiers).sorted(by: {$0.price < $1.price})
            await MainActor.run {
                items = products
            }
        } catch{
            action = .failed(.system(error))
            print("error")
        }
        
    }
    
    func handlePurchase(from result: PurchaseResult) async throws {
        switch result{
        case .success(let verification):
            print("Purchase was a success, now need to verifiy")
            
            let transaction = try checkVerified(verification)
            
            await MainActor.run{
                action = .successful
            }
            //Update UI
            
            await transaction.finish()
        case .pending:
            print("User needs to complete some action")
        case .userCancelled:
            print("The user hit cancel")
        default:
            break
            
        }
    }
    
    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T{
        switch result{
        case .unverified:
            print("The verification of the user failed.")
            throw CoinsError.failedVerification
        case.verified(let safe):
            return safe
        }
    }
}

