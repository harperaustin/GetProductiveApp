//
//  Content-ViewModelGP.swift
//  Progressive Production
//
//  Created by Harper Austin on 3/20/24.
//

import Foundation

extension GPSpecial{
    final class ViewModelGP: ObservableObject{
        @Published var isActive = false
        @Published var showingAlerts = false
        @Published var rounds = 1
        @Published var currRound = 0
        @Published var time: String = "40:00"
        @Published var setTime: Float = 40.0 
        @Published var minutes: Float = 40.0 {
            didSet{
                self.time = "\(Int(minutes)):00"
            }
        }
        private var initTime = 0
        private var endDate = Date()
        
        func start(minutes: Float){
            self.setTime = self.minutes
            notificationManager.instance.roundDoneNotif(endTime: (self.minutes*60) + 1)
            self.initTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
            self.currRound+=1
        }
        
        func updateCountdown(){
            guard isActive else {return }
            
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            if diff <= 0 {
                self.isActive = false
                self.time = "0:00"
                self.showingAlerts = true
                
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.second, from: date)
            
            self.minutes = Float(minutes)
            self.time = String(format: "%d:%02d", minutes, seconds)
            
        }
        
        func reset(){
            self.minutes = self.setTime
            self.isActive = false
            self.time = "\(Int(minutes)):00"
        
        }
        
        func totalReset(){
            self.minutes = 40.0
            self.isActive = false
            self.time = "\(Int(minutes)):00"
            self.rounds = 1
            self.currRound = 0
        
        }
    }
}

