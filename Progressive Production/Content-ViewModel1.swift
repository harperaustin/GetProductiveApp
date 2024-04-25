//
//  Content-ViewModel1.swift
//  Progressive Production
//
//  Created by Harper Austin on 3/19/24.
//

import Foundation


extension Custom{
    final class ViewModel1: ObservableObject{
        @Published var isActive = false
        @Published var showingAlerts = false
        @Published var time: String = "5:00"
        @Published var setTime: Float = 5.0
        @Published var minutes: Float = 5.0 {
            didSet{
                self.time = "\(Int(minutes)):00"
            }
        }
        private var initTime = 0
        private var endDate = Date()
        
        func start(minutes: Float){
            notificationManager.instance.breakDoneNotif(endTime: (self.minutes*60) + 1)
            self.setTime = self.minutes
            self.initTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
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
            self.minutes = 5.0
            self.isActive = false
            self.time = "\(Int(minutes)):00"
        
        }
    }
}
