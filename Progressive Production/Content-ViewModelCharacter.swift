//
//  Content-ViewModelCharacter.swift
//  Progressive Production
//
//  Created by Harper Austin on 3/25/24.
//

import Foundation
import SwiftUI

final class CharacterHelper: ObservableObject{
    @AppStorage("CURRENT_HAT") var currentHat : String = "starterHat"
    @AppStorage("CURRENT_HEAD") var currentHead : String = "starterHead1"
    @AppStorage("CURRENT_SHIRT") var currentShirt : String = "starterShirt"
    @AppStorage("CURRENT_PANTS") var currentPants : String = "pants6"
    @AppStorage("CURRENT_SHOES") var currentShoes : String = "startershoes"
    @Published var shoesPrice: Int = 5
    @Published var pantsPrice: Int = 8
    @Published var shirtPrice: Int = 14
    @Published var headPrice: Int = 25
    @Published var hatPrice: Int = 18
    @AppStorage("MONEY_KEY") var money: Int = 5
    
    //@AppStorage("OWNED_HATS") var ownedHats : [String] = ["starterHat"]
    @AppStorage("OWNED_HATS") var storedOwnedHats : String = "starterHat"
    
    var ownedHats: [String] {
        get{
            return storedOwnedHats.components(separatedBy: ",")
        }
        set{
            storedOwnedHats = newValue.joined(separator: ",")
        }
    }
    
    
    
    @AppStorage("OWNED_HEADS") var storedOwnedHeads : String = "starterHead1,head0,head1,head2,head3,head4,head5,head6,head7,head8,head9,head10,head11,head12,head13,head14,head15,head16,head17,head18,head19,head20,head21,head22,head23,head24,head25,head26,head27,head28,head29,head30,head31,head32,head33,head34,head35,head36,head37,head38,head39,head40,head41,head42,head43,head44,head45,head46,head47,head48,head49,head50,head51,head52,head53,head54,head55,head56,head57,head58,head59,head60,head61,head62,head63"
    var ownedHeads: [String] {
        get{
            return storedOwnedHeads.components(separatedBy: ",")
        }
        set{
            storedOwnedHeads = newValue.joined(separator: ",")
        }
    }
    
    @AppStorage("OWNED_SHIRTS") var storedOwnedShirts: String = "starterShirt"
    var ownedShirts : [String] {
        get{
            return storedOwnedShirts.components(separatedBy: ",")
        }
        set{
            storedOwnedShirts = newValue.joined(separator: ",")
        }
    }
    
    @AppStorage("OWNED_PANTS") var storedOwnedPants : String = "pants6"
    var ownedPants : [String]{
        get{
            return storedOwnedPants.components(separatedBy: ",")
    }
        set{
            storedOwnedPants = newValue.joined(separator: ",")
        }
    }
    @AppStorage("OWNED_SHOES") var storedOwnedShoes : String = "startershoes,shoes1"
    var ownedShoes : [String]{
        get{
            return storedOwnedShoes.components(separatedBy: ",")
        }
        set{
            storedOwnedShoes = newValue.joined(separator: ",")
        }
    }
    
    @Published var shopHats: [String] = ["hat1","hat2","hat3","hat4","hat5","hat6","hat7","hat8","hat9","hat10","hat11","hat12","hat13","hat14","hat15","hat16","hat17","hat18" ,"hat19","hat20","hat21","hat22","hat23","hat24"]
    
    @Published var shopHeads: [String] = ["head64","head65","head66","head67","head68","head69","head70","head71","head72","head73","head74","head75","head76","head77","head78","head79","head80","head81","head82", "head83", "head84","head86"]
    
    @Published var shopShirts: [String] = ["shirt1","shirt2","shirt3","shirt4","shirt5","shirt6","shirt7","shirt8","shirt9","shirt11","shirt12","shirt13","shirt15","shirt16","shirt17","shirt18","shirt19","shirt20","shirt21","shirt22","shirt23","shirt24","shirt25","shirt26","shirt27","shirt28", "shirt29", "shirt30", "shirt31", "shirt32", "shirt33", "shirt34", "shirt35", "shirt36", "shirt37", "shirt38", "shirt39"]
    
    @Published var shopPants: [String] = ["pants1","pants2","pants4","pants5","pants7","pants8","pants9","pants10","pants11","pants12","pants13","pants14","pants15","pants16","pants17","pants18","pants19","pants20","pants21","pants22","pants23","pants24","pants25","pants26","pants27","pants28","pants29","pants30","pants31","pants32","pants33","pants34","pants35","pants36","pants37","pants38","pants39","pants40"]
    
    @Published var shopShoes: [String] = ["shoes2", "shoes3", "shoes4", "shoes5", "shoes6", "shoes7", "shoes8"]
    
    
    
    
    
    
    
    func setUpOwnedHats() -> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<ownedHats.count, id: \.self){ index in
                    ZStack{
                        if(self.ownedHats[index] == self.currentHat){
                                Rectangle().frame(width: 113, height: 87, alignment: .trailing).foregroundColor(.yellow)
                        }
                        if(self.ownedHats[index] == "starterHat"){
                            Button{
                                self.chooseCurrHat(hat: self.ownedHats[index])
                            } label:{
                                Text("No Hat").font(.custom("PressStart2P-Regular", size: 13)).padding(.leading, 15)
                            }
                        }
                        else {
                            Button{
                                self.chooseCurrHat(hat: self.ownedHats[index])
                            } label:{
                                Image("\(self.ownedHats[index])").resizable().frame(width: 93, height: 67)
                        }
                        }
                        
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpOwnedHeads() -> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<ownedHeads.count, id: \.self){ index in
                    ZStack{
                        if(self.ownedHeads[index] == self.currentHead){
                                Rectangle().frame(width: 113, height: 107, alignment: .trailing).foregroundColor(.yellow)
                        }
                        Button{
                            self.chooseCurrHead(head: self.ownedHeads[index])
                        } label:{
                            Image("\(self.ownedHeads[index])").resizable().frame(width: 93, height: 87)
                        }
                    }
                }
                    
            }.padding(.leading, 20)
        }
            
    }
    func setUpOwnedShirts() -> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<ownedShirts.count, id: \.self){ index in
                    ZStack{
                        if(self.ownedShirts[index] == self.currentShirt){
                                Rectangle().frame(width: 117, height: 73, alignment: .trailing).foregroundColor(.yellow)
                        }
                        Button{
                            self.chooseCurrShirt(shirt: self.ownedShirts[index])
                        } label:{
                            Image("\(self.ownedShirts[index])").resizable().frame(width: 87, height: 53)
                        }
                    }
                }
                    
            }.padding(.leading, 20)
        }
            
    }
    func setUpOwnedPants() -> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<ownedPants.count, id: \.self){ index in
                    ZStack{
                        if(self.ownedPants[index] == self.currentPants){
                                Rectangle().frame(width: 87, height: 100, alignment: .trailing).foregroundColor(.yellow)
                        }
                        Button{
                            self.chooseCurrPants(pants: self.ownedPants[index])
                        } label:{
                            Image("\(self.ownedPants[index])").resizable().frame(width: 67, height: 80)
                        }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    func setUpOwnedShoes() -> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<ownedShoes.count, id: \.self){ index in
                    ZStack{
                    if(self.ownedShoes[index] == self.currentShoes){
                            Rectangle().frame(width: 87, height: 33, alignment: .trailing).foregroundColor(.yellow)
                    }
                        if(self.ownedShoes[index] == "shoes1"){
                            Button{
                            self.chooseCurrShoes(shoes: self.ownedShoes[index])
                            } label:{
                                Text("None").font(.custom("PressStart2P-Regular", size: 13)).padding(.leading, 20)
                            }
                            
                        } else{
                            Button{
                            self.chooseCurrShoes(shoes: self.ownedShoes[index])
                            } label:{
                            Image("\(self.ownedShoes[index])").resizable().frame(width: 67, height: 13)
                            }
                        }
                    
                    }
                }
                    //67, 13
            }.padding(.leading, 15)
        }
            
    }
    
    func setUpOwnedItems() -> some View{
        VStack(spacing: 20){
            VStack(alignment: .leading,spacing: 20){
            Text("Hats: ").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
            self.setUpOwnedHats()
            }
            VStack(alignment: .leading,spacing: 20){
            Text("Heads").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
            self.setUpOwnedHeads()
            }
            VStack(alignment: .leading,spacing: 20){
            Text("Shirts").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
            self.setUpOwnedShirts()
            }
            VStack(alignment: .leading, spacing: 20){
                Text("Pants").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
            self.setUpOwnedPants()
            }
            VStack(alignment: .leading,spacing: 20){
            Text("Shoes").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
            self.setUpOwnedShoes()
            }
            
        }
    }
    

    
    func chooseCurrHat(hat: String){
        self.currentHat = hat
    }
    
    func chooseCurrHead(head: String){
        self.currentHead = head
    }
    
    func chooseCurrShirt(shirt: String){
        self.currentShirt = shirt
    }
    
    func chooseCurrPants(pants: String){
        self.currentPants = pants
    }
    
    func chooseCurrShoes(shoes: String){
        self.currentShoes = shoes
    }
    
    
    func setUpShopHats() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 0){
                ForEach(0..<shopHats.count, id: \.self){ index in
                    if(self.ownedHats.contains(self.shopHats[index])){
                        ZStack{
                            Rectangle().frame(width: 100, height: 82).foregroundColor(.green)
                            Image("\(self.shopHats[index])").resizable().frame(width: 93, height: 67)
                        }
                    } else {
                    ZStack{
                        Rectangle().frame(width: 100, height: 82).foregroundColor(.white)
                        Button{
                            self.purchaseHat(hat: self.shopHats[index])
                            } label:{
                                
                                Image("\(self.shopHats[index])").resizable().frame(width: 93, height: 67)
                        }
                        
                        
                        }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    func setUpShopHeads() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(0..<shopHeads.count, id: \.self){ index in
                    if(self.ownedHeads.contains(self.shopHeads[index])){
                        ZStack{
                        Rectangle().frame(width: 100, height: 102).foregroundColor(.green)
                        Image("\(self.shopHeads[index])").resizable().frame(width: 93, height: 87)
                        }
                    } else {
                    ZStack{
                        Rectangle().frame(width: 100, height: 102).foregroundColor(.white)
                        Button{
                            self.purchaseHead(head: self.shopHeads[index])
                            } label:{
                                
                            Image("\(self.shopHeads[index])").resizable().frame(width: 93, height: 87)
                        }
                    }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopShirts() -> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<shopShirts.count, id: \.self){ index in
                    if(self.ownedShirts.contains(self.shopShirts[index])){
                        ZStack{
                            Rectangle().frame(width: 107, height: 78).foregroundColor(.green)
                            Image("\(self.shopShirts[index])").resizable().frame(width: 87, height: 53)
                        }
                    } else{
                        ZStack{
                            Rectangle().frame(width: 107, height: 78).foregroundColor(.white)
                            Button{
                                self.purchaseShirt(shirt: self.shopShirts[index])
                            } label:{
                                Image("\(self.shopShirts[index])").resizable().frame(width: 87, height: 53)
                        }
                        
                    
                        }
                    }
                
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopPants() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 20){
                ForEach(0..<shopPants.count, id: \.self){ index in
                    if(self.ownedPants.contains(self.shopPants[index])){
                        ZStack{
                        Rectangle().frame(width: 77, height: 95).foregroundColor(.green)
                        Image("\(self.shopPants[index])").resizable().frame(width: 67, height: 80)
                        }
                    }
                    else{
                    ZStack{
                        Rectangle().frame(width: 77, height: 95).foregroundColor(.white)
                        Button{
                            self.purchasePants(pants: self.shopPants[index])
                            } label:{
                                
                            Image("\(self.shopPants[index])").resizable().frame(width: 67, height: 80)
                        }
                        
                        
                    }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopShoes() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 20){
                ForEach(0..<shopShoes.count, id: \.self){ index in
                    if(self.ownedShoes.contains(self.shopShoes[index])){
                        ZStack{
                            Rectangle().frame(width: 87, height: 28).foregroundColor(.green)
                            
                            Image("\(self.shopShoes[index])").resizable().frame(width: 67, height: 13)
                        }
                    }
                    else {
                        ZStack{
                            Rectangle().frame(width: 87, height: 28).foregroundColor(.white)
                        Button{
                            self.purchaseShoes(shoes: self.shopShoes[index])
                            } label:{
                                    
                                Image("\(self.shopShoes[index])").resizable().frame(width: 67, height: 13)
                        }
                        
                        
                    }
                }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopItems() -> some View{
        VStack(spacing: 25){
            VStack(alignment: .leading,spacing: 10){
                HStack(spacing: 0){
                    Text("Hats:").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
                    Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                    Text("\(self.hatPrice) each").font(.custom("PressStart2P-Regular", size: 15))
                }
                self.setUpShopHats()
                
            }
            VStack(alignment: .leading,spacing: 10){
                HStack(spacing: 0){
                    Text("Heads:").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
                    Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                    Text("\(self.headPrice) each").font(.custom("PressStart2P-Regular", size: 15))
                }
            self.setUpShopHeads()
            }
            VStack(alignment: .leading,spacing: 10){
                HStack(spacing: 0){
                    Text("Shirts:").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
                    Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                    Text("\(self.shirtPrice) each").font(.custom("PressStart2P-Regular", size: 15))
                }
            self.setUpShopShirts()
            }
            VStack(alignment: .leading, spacing: 10){
                HStack(spacing: 0){
                    Text("Pants:").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
                    Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                    Text("\(self.pantsPrice) each").font(.custom("PressStart2P-Regular", size: 15))
                }
            self.setUpShopPants()
            }
            VStack(alignment: .leading,spacing: 10){
                HStack(spacing: 0){
                    Text("Shoes:").font(.custom("PressStart2P-Regular", size: 15)).padding(.leading, 20)
                    Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                    Text("\(self.shoesPrice) each").font(.custom("PressStart2P-Regular", size: 15))
                }
            self.setUpShopShoes()
            }
            
        }
    }
    
    func updateMoney(numTiles: Int){
        money = money + numTiles
    }
    
    func purchaseHat(hat: String){
        if(self.money >= self.hatPrice){
            money = money - hatPrice
            self.ownedHats += [hat]
        }
    }
    func purchaseHead(head: String){
        if(self.money >= self.headPrice){
            money = money - headPrice
            self.ownedHeads += [head]
        }
    }
    func purchaseShirt(shirt: String){
        if(self.money >= self.shirtPrice){
            money = money - shirtPrice
            self.ownedShirts += [shirt]
        }
    }
    func purchasePants(pants: String){
        if(self.money >= self.pantsPrice){
            money = money - pantsPrice
            self.ownedPants += [pants]
        }
    }
    func purchaseShoes(shoes: String){
        if(self.money >= self.shoesPrice){
            money = money - shoesPrice
            self.ownedShoes += [shoes]
        }
    }
    
    
}
