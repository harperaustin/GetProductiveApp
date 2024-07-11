//
//  ContentView.swift
//  Progressive Production
//
//  Created by Harper Austin on 3/17/24.
//

import SwiftUI
import UserNotifications
import StoreKit

class notificationManager{
    static let instance = notificationManager()
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("\(error)")
            } else{
                print("success")
            }
        }
    }
    
    
    
    func roundDoneNotifExit(timeLeft: Double){
        let roundDone = UNMutableNotificationContent()
        roundDone.title = "Round finished"
        roundDone.subtitle = "Time to start your break."
        roundDone.sound = .default
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeLeft, repeats: false)
        
        let requestRD = UNNotificationRequest(identifier: "roundDoneExitReq", content: roundDone, trigger: trigger)
        UNUserNotificationCenter.current().add(requestRD)
        
    }
    func restDoneNotifExit(timeLeft: Double){
        let roundDone = UNMutableNotificationContent()
        roundDone.title = "Rest finished"
        roundDone.subtitle = "Let's get productive."
        roundDone.sound = .default
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeLeft, repeats: false)
        
        let requestRD = UNNotificationRequest(identifier: "restDoneExitReq", content: roundDone, trigger: trigger)
        UNUserNotificationCenter.current().add(requestRD)
        
    }
    
    func seshDoneNotif(timeLeft: Double){
        let roundDone = UNMutableNotificationContent()
        roundDone.title = "Session Completed!"
        roundDone.subtitle = "Claim your rewards and view your session stats!"
        roundDone.sound = .default
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeLeft, repeats: false)
        
        let requestRD = UNNotificationRequest(identifier: "restDoneExitReq", content: roundDone, trigger: trigger)
        UNUserNotificationCenter.current().add(requestRD)
        
    }
    func progLostExitPaused(timeLeft: Double){
        let roundDone = UNMutableNotificationContent()
        roundDone.title = "Progress lost, don't get distracted."
        roundDone.subtitle = "You left the app for too long."
        roundDone.sound = .default
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeLeft, repeats: false)
        
        let requestRD = UNNotificationRequest(identifier: "progLostReq", content: roundDone, trigger: trigger)
        UNUserNotificationCenter.current().add(requestRD)
        
    }
    
    
}

struct ContentView: View {
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("newLoadingLogo").resizable().frame(width: 240, height: 180, alignment: .center).padding().navigationBarHidden(true)
                
                NavigationLink(destination: HomePage()){
                    Image("newGO").resizable().frame(width: 100, height: 40, alignment: .center).padding(.top, 100).navigationBarHidden(true)
                }.navigationBarHidden(true)
                    
                    
                }
                
            }
        }.onAppear(perform: notificationManager.instance.requestAuthorization)
    }
}


struct HomePage: View{
    @AppStorage("ONBOARDING1") var onboarding: Bool = true
    @State var showSheet: Bool = false
    
    var body: some View{
        let levelHelper = ProgPageHelp()
        let charHelper = CharacterHelper()
        
        NavigationView{
            
            
            VStack(alignment: .center){
                Spacer()
                Text("Choose a method").font(.custom("Jersey15-Regular", size: 40)).padding(.top, 30)
                
                NavigationLink(destination: testTimer( levelHelper: levelHelper, charHelper: charHelper)){
                Image("NewPomoButton").resizable().aspectRatio(contentMode: .fit).frame(width: 304, height: 130, alignment: .center)
            }
                NavigationLink(destination: testTimer5217(levelHelper: levelHelper, charHelper: charHelper)){
                    Image("new52Button").resizable().aspectRatio(contentMode: .fit).frame(width: 304, height: 130, alignment: .center)
                }
                NavigationLink(destination: testTimerHsWay(levelHelper: levelHelper, charHelper: charHelper)){
                    Image("hswayNewButton").resizable().aspectRatio(contentMode: .fit).frame(width: 304, height: 130, alignment: .center)
                }
                NavigationLink(destination: testTimerCustom(levelHelper: levelHelper, charHelper: charHelper)){
                    Image("customNewButton").resizable().aspectRatio(contentMode: .fit).frame(width: 304, height: 130, alignment: .center)
                }
                
                HStack(spacing: 10){
                    Spacer()
                    NavigationLink(destination: challengesPage(levelHelper: levelHelper, charHelper: charHelper)){
                        Image("targeticon").resizable().frame(width:40, height:40)
                    }
                    Spacer()
                    NavigationLink(destination: newProgPage(levelHelper: levelHelper, charHelper: charHelper)){
                        Image("newLevelButton").resizable().frame(width:40, height:40).padding(.leading, 6)
                    }
                    Spacer()
                    Button(action: {onboarding.toggle()
                    }, label: {Image("questionMarkNew").resizable().frame(width:25, height: 30)   }).sheet(isPresented: $onboarding, content: {helpPage()})
                    Spacer()
                    NavigationLink(destination: charPage(charHelper: charHelper, levelHelper: levelHelper)){
                        Image("headButton").resizable().frame(width: 40, height: 40)
                    }
                    Spacer()
                    NavigationLink(destination: statsPage(levelHelper: levelHelper)){
                        Image("newStatsButton").resizable().frame(width: 40, height: 40)
                    }
                    Spacer()
                    
                }.padding([.leading, .trailing], 30).padding(.bottom, 20)
               
            }.sheet(isPresented: $onboarding, content: {helpPage()}).padding(.bottom, 34)
        
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}


//Possible Error
/**
 I think that there may be an error when coming back to the app by opening a different app from the lock screen. Say you start the timer and turn off your phone. When you come back, you will be paused before the timer adjusts itself, and therefore its as if you did not pass anytime on the timer at all.
 */

struct testTimer: View{
    //1500, 300
    
    //TIME MUST BE CHANGED BACK
    //NO PAUSE BONUS MUST BE CHANGED BACK TOO
    @State private var initialTime1: TimeInterval = 1500
    
    
    @State private var initialTime2: TimeInterval = 300
    
    
    
    @State private var timeRemaining: TimeInterval = 1500
    
    @State private var timeRemaining2: TimeInterval = 300
    
    
    @State private var pausedTime: TimeInterval = 30
    @State private var finished: Bool = false
    @State private var timer: Timer?
    @State private var pausedTimer: Timer?
    @State private var isRunning: Bool = false
    @State private var isRunning2: Bool = false
    @State private var seshDone: Bool = false
    @State private var roundsGoal: Int = 1
    @State private var roundsCompleted: Int = 0
    @State private var paused: Bool = false
    @State private var justReset: Bool = false
    @State private var noPause: Bool = true
    
    @State private var justWentBackground: Bool = false
    @State private var justWentInactive: Bool = false
    @State private var exitTime: Date = Date()
    @State private var enterTime: Date = Date()
   
    @ObservedObject var levelHelper : ProgPageHelp
    @ObservedObject var charHelper : CharacterHelper
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View{
        
        
        ZStack{
            if seshDone{
                ZStack{
                    Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                    Rectangle().frame(width:300, height: 300).foregroundColor(.white).background().shadow(radius: 10).border(Color.green, width: 10)
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {resetTimer()}, label: {
                                Image("xButton").resizable().frame(width: 25, height: 25)
                            }).padding(.trailing, 70).disabled(noPause)
                        }
                        let totalTime = (Double(roundsGoal) * initialTime1) / 60
                        let hours = Int(totalTime/60)
                        let minutes = Int(totalTime) % 60
                        Text("Session completed!").font(.custom("Jersey15-Regular", size: 30)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091)).padding(.top, 50)
                        Text("You were productive for ").font(.custom("Jersey15-Regular", size: 28)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091))
                        Text("\(hours)hrs \(minutes)mins").font(.custom("Jersey15-Regular", size: 40)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091)).padding(.bottom, 60)
                    }
                    
                    
                }.zIndex(1)
                
                
                if noPause{
                    ZStack{
                        Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                        Rectangle().frame(width:300, height: 150).foregroundColor(.white).background().shadow(radius: 10).border(Color.yellow, width: 10)
                        VStack{
                            HStack{
                                Spacer()
                                Button(action: {noPause = false}, label: {
                                    Image("xButton").resizable().frame(width: 25, height: 25)
                                }).padding(.trailing, 70)
                            }.padding(.top, 10)
                            
                            Text("No Pause Bonus!!").font(.custom("Jersey15-Regular", size: 30))
                            HStack(spacing: 5){
                                Text("You earned an extra 50").font(.custom("Jersey15-Regular", size: 28))
                                Image("coin1").resizable().frame(width: 20, height: 20)
                            }.padding(.bottom, 20)
                        }
                        
                        
                    }.zIndex(1)
                    
                }
            
            }
            if paused && !finished && !seshDone && !justReset{
                ZStack{
                    Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                    Rectangle().frame(width:300, height: 300).foregroundColor(.white).background().shadow(radius: 10).border(Color.red, width: 10)
                    VStack(spacing:0){
                        
                       
                        Text("Paused").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(.red).padding(.top, 30)
                        Text("Timer resets in ").font(.custom("Jersey15-Regular", size: 28)).foregroundColor(.red)
                        Text(String(Int(pausedTime))).font(.custom("Jersey15-Regular", size: 110)).foregroundColor(.red).padding(.top, 10).padding(.bottom, 10)
                        
                       
                        Button(action: {
                            paused = false
                            startTimer()
                            pausedTimer?.invalidate()
                            pausedTime = 30
                        }, label: {
                            Image("resumeButton").resizable().frame(width: 90, height: 30).padding(.bottom, 15)
                        })
                        Text("1 minute will be added back to your timer. ").font(.custom("Jersey15-Regular", size: 17)).foregroundColor(.red).padding(.bottom, 30)
                       
                    }
                    
                    
                }.zIndex(1)
            
            }
            
            
            
        
            VStack{
                //** Change this for each strategy
                Text("Pomodoro").font(.custom("Jersey15-Regular", size: 60)).padding(.top, 75).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                //** Change this for each strategy
                Text("25 minutes on, 5 minutes off").font(.custom("Jersey15-Regular", size: 30)).padding(.bottom, 20).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                
                
                
                Spacer()
                //** Change this for each strategy (The color of all the text)
                Text(formattedTime(type: 1)).font(.custom("Jersey15-Regular", size: 125)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                Text(formattedTime(type: 2)).font(.custom("Jersey15-Regular", size: 75)).foregroundColor(Color(red: 0.919, green: 0.044, blue: 0.202))
                Text("Rounds: \(roundsCompleted)/\(roundsGoal)" ).font(.custom("Jersey15-Regular", size: 50)).padding(.bottom, 20).foregroundColor(Color(red: 0.919, green: 0.044, blue: 0.202))
                Spacer()
                
                
                
                if isRunning2 || isRunning{
                    Button(action: {pauseTimer()}, label: {
                        Image("pauseButt").resizable().frame(width: 72.5, height: 42.5)
                    })
                    
                }else{
                    Button(action: {startTimer()}, label: {
                        Image("startButt").resizable().frame(width: 72.5, height: 42.5)
                    }).disabled(roundsCompleted>=roundsGoal).disabled(paused)
                }
                if isRunning{
                    Text("Currently working...").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                } else if isRunning2{
                    Text("You're on break!").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                } else if finished && !isRunning2{
                    if initialTime2 == timeRemaining2{
                        Text("Start break").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    } else{
                        Text("Resume break").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    }
                }else if !isRunning && !finished{
                    if initialTime1 == timeRemaining{
                        if roundsCompleted>=roundsGoal{
                            Text("Press reset to work again").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                        } else{
                            //Added the && not reset part
                            if paused && !justReset{
                                Text("_").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(.white)
                            }else{
                                Text("Begin working").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                            }
                        }
                    } else {
                        Text("_").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(.white)
                    }
                }
                Spacer()
                
                
                HStack{
                    Text("Rounds").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    Spacer()
                    
                    Button(action: {decRounds()}, label: {
                        Image("minusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                    Button(action: {incRounds()}, label: {
                        Image("plusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                }.padding([.trailing,.leading], 90).padding(.bottom,30)
                
                Button(action: {resetTimer()}, label: {
                    Image("resetButton").resizable().frame(width: 90, height: 30)
                }).padding(.bottom, 100).disabled((paused && !finished) || seshDone)
                //15 //45
                
            }
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                //Only call the catch-up function if we go all the way to the background, do not do this if we only go inactive.
                if justWentBackground && (isRunning || paused || isRunning2){
                    enterBack()
                }
                justWentInactive = false
                justWentBackground = false
                print("active")
                 break
                
            case .background:
                if justWentInactive{
                    if !paused && !isRunning2 && isRunning{
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        //ADDED THIS
                        let timeRN = Date()
                        let tempTime = timeRemaining - timeRN.timeIntervalSince(exitTime)
                        if tempTime <= 0{
                            timeRemaining = 0
                        } else{
                            timeRemaining = tempTime
                        }
                        //
                        pauseTimer()
                    }
                }
                justWentBackground = true
                exitStop()
                print("background")
                break
                
            case .inactive:
                print("inactive")
                
                
                //When turning phone back on, we hit an inactive case very briefly. We only want to pause the timer if we hit the inactive case going from active to inactive, not background to inactive.
                
                if !justWentBackground{
                    if !paused && !isRunning2 && isRunning{
                        
                        pauseTimer()
                    }
                }
                justWentInactive = true
                
            @unknown default:
                break
                
            }
            
        }.onAppear(perform: {
            levelHelper.resetTodayStats()
        }).onDisappear(perform: {
            timer?.invalidate()
            pausedTimer?.invalidate()
        })
    }
        
        
    
    
    
    private func formattedTime(type: Int) -> String{
        if type == 1{
            let minutes = Int(timeRemaining) / 60
            let seconds = Int(timeRemaining) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        } else {
            let minutes = Int(timeRemaining2) / 60
            let seconds = Int(timeRemaining2) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    private func incRounds(){
        if roundsGoal <= 14{
            roundsGoal += 1
        }
    }
    
    private func decRounds(){
        if roundsGoal >= 2{
            roundsGoal -= 1
        }
    }
    private func resetTimer(){
        paused = false
        noPause = true
        justReset = true
        roundsGoal = 1
        roundsCompleted = 0
        pausedTimer?.invalidate()
        timer?.invalidate()
        timeRemaining = initialTime1
        timeRemaining2 = initialTime2
        finished = false
        isRunning = false
        isRunning2 = false
        seshDone = false
        
        pausedTime = 30
    }
    
    private func startTimer(){
        timer?.invalidate()
        paused = false //added this line
        justReset = false
        if !finished{
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if timeRemaining > 0{
                    timeRemaining -= 1
                } else {
                    stopTimer()
                }
            }
        } else{
            isRunning2 = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if timeRemaining2 > 0{
                    timeRemaining2 -= 1
                } else {
                    stopTimer()
                }
            }
        }
    }
    
    private func exitStop(){
        if !paused{
            if isRunning{
                if roundsCompleted + 1 == roundsGoal{
                    notificationManager.instance.seshDoneNotif(timeLeft: timeRemaining)
                } else{
                    notificationManager.instance.roundDoneNotifExit(timeLeft: timeRemaining)
                }
                
            }else if isRunning2{
                notificationManager.instance.restDoneNotifExit(timeLeft: timeRemaining2)
            }
            timer?.invalidate()
        } else{
            notificationManager.instance.progLostExitPaused(timeLeft: pausedTime)
            pausedTimer?.invalidate()
        }
        exitTime = Date()
        
        //Needs to deal with both cases if the timer is meant to keep going or if the paused timer is meant to and also needs to deal with the case that we are on break.
    }
    
    private func enterBack(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        enterTime = Date()
        if !paused{
            if isRunning{
                let tempTime = timeRemaining - enterTime.timeIntervalSince(exitTime)
                if tempTime <= 0{
                    timeRemaining = 0
                } else{
                    timeRemaining = tempTime
                }
            } else if isRunning2{
                let tempTime = timeRemaining2 - enterTime.timeIntervalSince(exitTime)
                if tempTime <= 0{
                    timeRemaining2 = 0
                } else{
                    timeRemaining2 = tempTime
                }
            }
            startTimer()
                
        } else{
            pausedTime -= enterTime.timeIntervalSince(exitTime)
            if pausedTime <= 0{
                pausedTime = 0
            }
            startPause()
        }
        
    }
    
    //ADDED THIS
    private func catchUpTime(){
        let enterTime1 = Date()
        let tempTime = timeRemaining - enterTime1.timeIntervalSince(exitTime)
        if tempTime <= 0{
            timeRemaining = 0
        } else{
            timeRemaining = tempTime
        }
    }
    
    private func startPause(){
        pausedTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            if pausedTime > 0{
                pausedTime -= 1
            } else{
                
                resetTimer()
            }
        }
    }
    
    private func stopTimer(){
        if !finished{
            finished = true
            isRunning = false
            timer?.invalidate()
            
            levelHelper.incHoursWorked(worked: Int(25))
            levelHelper.newUpdateLevel(color: "redTile")
            charHelper.updateMoney(numTiles: levelHelper.newUpdateMoney())
            roundsCompleted += 1
            if roundsCompleted >= roundsGoal{
                seshDone = true
                if noPause{
                    levelHelper.noPauses += 1
                    charHelper.updateMoney(numTiles: 50)
                }
            }
        } else {
            isRunning2 = false
            finished = false
            timer?.invalidate()
            timeRemaining = initialTime1
            timeRemaining2 = initialTime2
            
        }
    }
    
    private func pauseTimer(){
        noPause = false
        paused = true
        if isRunning{
            if Int(timeRemaining) + 60 >= Int(initialTime1){
                timeRemaining = initialTime1
            } else{
                timeRemaining += 60
            }
            startPause()
        }
        if isRunning{
            isRunning = false
        } else if isRunning2{
            isRunning2 = false
        }
        timer?.invalidate()
        
    
    }
    
}



struct testTimer5217: View{
    
    //3120, 1020
    //** Change this for each strategy
    @State private var initialTime1: TimeInterval = 3120
    //** Change this for each strategy
    @State private var initialTime2: TimeInterval = 1020
    //** Change this for each strategy
    @State private var timeRemaining: TimeInterval = 3120
    //** Change this for each strategy
    @State private var timeRemaining2: TimeInterval = 1020
    
    @State private var pausedTime: TimeInterval = 30
    @State private var finished: Bool = false
    @State private var timer: Timer?
    @State private var pausedTimer: Timer?
    @State private var isRunning: Bool = false
    @State private var isRunning2: Bool = false
    @State private var seshDone: Bool = false
    @State private var roundsGoal: Int = 1
    @State private var roundsCompleted: Int = 0
    @State private var paused: Bool = false
    @State private var justReset: Bool = false
    @State private var noPause: Bool = true
    
    @State private var justWentBackground: Bool = false
    @State private var justWentInactive: Bool = false
    @State private var exitTime: Date = Date()
    @State private var enterTime: Date = Date()
   
    @ObservedObject var levelHelper : ProgPageHelp
    @ObservedObject var charHelper : CharacterHelper
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View{
        
        
        ZStack{
            if seshDone{
                ZStack{
                    Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                    Rectangle().frame(width:300, height: 300).foregroundColor(.white).background().shadow(radius: 10).border(Color.green, width: 10)
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {resetTimer()}, label: {
                                Image("xButton").resizable().frame(width: 25, height: 25)
                            }).padding(.trailing, 70).disabled(noPause)
                        }
                        let totalTime = (Double(roundsGoal) * initialTime1) / 60
                        let hours = Int(totalTime/60)
                        let minutes = Int(totalTime) % 60
                        Text("Session completed!").font(.custom("Jersey15-Regular", size: 30)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091)).padding(.top, 50)
                        Text("You were productive for ").font(.custom("Jersey15-Regular", size: 28)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091))
                        Text("\(hours)hrs \(minutes)mins").font(.custom("Jersey15-Regular", size: 40)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091)).padding(.bottom, 60)
                    }
                    
                    
                }.zIndex(1)
                
                
                if noPause{
                    ZStack{
                        Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                        Rectangle().frame(width:300, height: 150).foregroundColor(.white).background().shadow(radius: 10).border(Color.yellow, width: 10)
                        VStack{
                            HStack{
                                Spacer()
                                Button(action: {noPause = false}, label: {
                                    Image("xButton").resizable().frame(width: 25, height: 25)
                                }).padding(.trailing, 70)
                            }.padding(.top, 10)
                            
                            Text("No Pause Bonus!!").font(.custom("Jersey15-Regular", size: 30))
                            HStack(spacing: 5){
                                Text("You earned an extra 50").font(.custom("Jersey15-Regular", size: 28))
                                Image("coin1").resizable().frame(width: 20, height: 20)
                            }.padding(.bottom, 20)
                        }
                        
                        
                    }.zIndex(1)
                    
                }
            
            }
            if paused && !finished && !seshDone && !justReset{
                ZStack{
                    Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                    Rectangle().frame(width:300, height: 300).foregroundColor(.white).background().shadow(radius: 10).border(Color.red, width: 10)
                    VStack(spacing:0){
                        
                       
                        Text("Paused").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(.red).padding(.top, 30)
                        Text("Timer resets in ").font(.custom("Jersey15-Regular", size: 28)).foregroundColor(.red)
                        Text(String(Int(pausedTime))).font(.custom("Jersey15-Regular", size: 110)).foregroundColor(.red).padding(.top, 10).padding(.bottom, 10)
                        
                       
                        Button(action: {
                            paused = false
                            startTimer()
                            pausedTimer?.invalidate()
                            pausedTime = 30
                        }, label: {
                            Image("resumeButton").resizable().frame(width: 90, height: 30).padding(.bottom, 15)
                        })
                        Text("1 minute will be added back to your timer. ").font(.custom("Jersey15-Regular", size: 17)).foregroundColor(.red).padding(.bottom, 30)
                       
                    }
                    
                    
                }.zIndex(1)
            
            }
            
            
            
        
            VStack{
                //** Change this for each strategy
                Text("52-17").font(.custom("Jersey15-Regular", size: 60)).padding(.top, 75).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                //** Change this for each strategy
                Text("52 minutes on, 17 minutes off").font(.custom("Jersey15-Regular", size: 30)).padding(.bottom, 20).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                
                
                
                Spacer()
                //** Change this for each strategy (The color of all the text)
                Text(formattedTime(type: 1)).font(.custom("Jersey15-Regular", size: 125)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                Text(formattedTime(type: 2)).font(.custom("Jersey15-Regular", size: 75)).foregroundColor(Color(hue: 0.144, saturation: 0.89, brightness: 1.0))
                Text("Rounds: \(roundsCompleted)/\(roundsGoal)" ).font(.custom("Jersey15-Regular", size: 50)).padding(.bottom, 20).foregroundColor(Color(hue: 0.144, saturation: 0.89, brightness: 1.0))
                Spacer()
                
                
                
                if isRunning2 || isRunning{
                    Button(action: {pauseTimer()}, label: {
                        Image("pauseButt").resizable().frame(width: 72.5, height: 42.5)
                    })
                    
                }else{
                    Button(action: {startTimer()}, label: {
                        Image("startButt").resizable().frame(width: 72.5, height: 42.5)
                    }).disabled(roundsCompleted>=roundsGoal).disabled(paused)
                }
                if isRunning{
                    Text("Currently working...").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                } else if isRunning2{
                    Text("You're on break!").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                } else if finished && !isRunning2{
                    if initialTime2 == timeRemaining2{
                        Text("Start break").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    } else{
                        Text("Resume break").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    }
                }else if !isRunning && !finished{
                    if initialTime1 == timeRemaining{
                        if roundsCompleted>=roundsGoal{
                            Text("Press reset to work again").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                        } else{
                            //Added the && not reset part
                            if paused && !justReset{
                                Text("_").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(.white)
                            }else{
                                Text("Begin working").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                            }
                        }
                    } else {
                        Text("_").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(.white)
                    }
                }
                Spacer()
                
                
                HStack{
                    Text("Rounds").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    Spacer()
                    
                    Button(action: {decRounds()}, label: {
                        Image("minusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                    Button(action: {incRounds()}, label: {
                        Image("plusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                }.padding([.trailing,.leading], 90).padding(.bottom,30)
                
                Button(action: {resetTimer()}, label: {
                    Image("resetButton").resizable().frame(width: 90, height: 30)
                }).padding(.bottom, 100).disabled((paused && !finished) || seshDone)
                //15 //45
                
            }
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                //Only call the catch-up function if we go all the way to the background, do not do this if we only go inactive.
                if justWentBackground && (isRunning || paused || isRunning2){
                    enterBack()
                }
                justWentInactive = false
                justWentBackground = false
                print("active")
                 break
                
            case .background:
                if justWentInactive{
                    if !paused && !isRunning2 && isRunning{
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        //ADDED THIS
                        let timeRN = Date()
                        let tempTime = timeRemaining - timeRN.timeIntervalSince(exitTime)
                        if tempTime <= 0{
                            timeRemaining = 0
                        } else{
                            timeRemaining = tempTime
                        }
                        //
                        pauseTimer()
                    }
                }
                justWentBackground = true
                exitStop()
                print("background")
                break
                
            case .inactive:
                print("inactive")
                
                
                //When turning phone back on, we hit an inactive case very briefly. We only want to pause the timer if we hit the inactive case going from active to inactive, not background to inactive.
                
                if !justWentBackground{
                    if !paused && !isRunning2 && isRunning{
                        pauseTimer()
                    }
                }
                justWentInactive = true
                
            @unknown default:
                break
                
            }
            
        }.onAppear(perform: {
            levelHelper.resetTodayStats()
        }).onDisappear(perform: {
            timer?.invalidate()
            pausedTimer?.invalidate()
        })
    }
        
        
    
    
    
    private func formattedTime(type: Int) -> String{
        if type == 1{
            let minutes = Int(timeRemaining) / 60
            let seconds = Int(timeRemaining) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        } else {
            let minutes = Int(timeRemaining2) / 60
            let seconds = Int(timeRemaining2) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    private func incRounds(){
        if roundsGoal <= 14{
            roundsGoal += 1
        }
    }
    
    private func decRounds(){
        if roundsGoal >= 2{
            roundsGoal -= 1
        }
    }
    private func resetTimer(){
        paused = false
        noPause = true
        justReset = true
        roundsGoal = 1
        roundsCompleted = 0
        pausedTimer?.invalidate()
        timer?.invalidate()
        timeRemaining = initialTime1
        timeRemaining2 = initialTime2
        finished = false
        isRunning = false
        isRunning2 = false
        seshDone = false
        
        pausedTime = 30
    }
    
    private func startTimer(){
        timer?.invalidate()
        paused = false //added this line
        justReset = false
        if !finished{
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if timeRemaining > 0{
                    timeRemaining -= 1
                } else {
                    stopTimer()
                }
            }
        } else{
            isRunning2 = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if timeRemaining2 > 0{
                    timeRemaining2 -= 1
                } else {
                    stopTimer()
                }
            }
        }
    }
    
    private func exitStop(){
        if !paused{
            if isRunning{
                if roundsCompleted + 1 == roundsGoal{
                    notificationManager.instance.seshDoneNotif(timeLeft: timeRemaining)
                } else{
                    notificationManager.instance.roundDoneNotifExit(timeLeft: timeRemaining)
                }
                
            }else if isRunning2{
                notificationManager.instance.restDoneNotifExit(timeLeft: timeRemaining2)
            }
            timer?.invalidate()
        } else{
            notificationManager.instance.progLostExitPaused(timeLeft: pausedTime)
            pausedTimer?.invalidate()
        }
        exitTime = Date()
        
        //Needs to deal with both cases if the timer is meant to keep going or if the paused timer is meant to and also needs to deal with the case that we are on break.
    }
    
    private func enterBack(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        enterTime = Date()
        if !paused{
            if isRunning{
                let tempTime = timeRemaining - enterTime.timeIntervalSince(exitTime)
                if tempTime <= 0{
                    timeRemaining = 0
                } else{
                    timeRemaining = tempTime
                }
            } else if isRunning2{
                let tempTime = timeRemaining2 - enterTime.timeIntervalSince(exitTime)
                if tempTime <= 0{
                    timeRemaining2 = 0
                } else{
                    timeRemaining2 = tempTime
                }
            }
            startTimer()
                
        } else{
            pausedTime -= enterTime.timeIntervalSince(exitTime)
            if pausedTime <= 0{
                pausedTime = 0
            }
            startPause()
        }
        //must change time accordingly
    }
    
    private func startPause(){
        pausedTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            if pausedTime > 0{
                pausedTime -= 1
            } else{
                
                resetTimer()
            }
        }
    }
    
    private func stopTimer(){
        if !finished{
            finished = true
            isRunning = false
            timer?.invalidate()
            
            //** Change this for each strategy
            levelHelper.incHoursWorked(worked: Int(52))
            //** Change this for each strategy
            levelHelper.newUpdateLevel(color: "yellowTile")
            charHelper.updateMoney(numTiles: levelHelper.newUpdateMoney())
            roundsCompleted += 1
            if roundsCompleted >= roundsGoal{
                seshDone = true
                if noPause{
                    levelHelper.noPauses += 1
                    charHelper.updateMoney(numTiles: 50)
                }
            }
        } else {
            isRunning2 = false
            finished = false
            timer?.invalidate()
            timeRemaining = initialTime1
            timeRemaining2 = initialTime2
            
            
        }
    }
    
    private func pauseTimer(){
        noPause = false
        paused = true
        if isRunning{
            if Int(timeRemaining) + 60 >= Int(initialTime1){
                timeRemaining = initialTime1
            } else{
                timeRemaining += 60
            }
            startPause()
        }
        if isRunning{
            isRunning = false
        } else if isRunning2{
            isRunning2 = false
        }
        timer?.invalidate()
        
    
    }
    
}

struct testTimerHsWay: View{
    
    //2400, 280
    //** Change this for each strategy
    @State private var initialTime1: TimeInterval = 2400
    //** Change this for each strategy
    @State private var initialTime2: TimeInterval = 480
    //** Change this for each strategy
    @State private var timeRemaining: TimeInterval = 2400
    //** Change this for each strategy
    @State private var timeRemaining2: TimeInterval = 480
    
    @State private var pausedTime: TimeInterval = 30
    @State private var finished: Bool = false
    @State private var timer: Timer?
    @State private var pausedTimer: Timer?
    @State private var isRunning: Bool = false
    @State private var isRunning2: Bool = false
    @State private var seshDone: Bool = false
    @State private var roundsGoal: Int = 1
    @State private var roundsCompleted: Int = 0
    @State private var paused: Bool = false
    @State private var justReset: Bool = false
    @State private var noPause: Bool = true
    
    @State private var justWentBackground: Bool = false
    @State private var justWentInactive: Bool = false
    @State private var exitTime: Date = Date()
    @State private var enterTime: Date = Date()
   
    @ObservedObject var levelHelper : ProgPageHelp
    @ObservedObject var charHelper : CharacterHelper
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View{
        
        
        ZStack{
            if seshDone{
                ZStack{
                    Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                    Rectangle().frame(width:300, height: 300).foregroundColor(.white).background().shadow(radius: 10).border(Color.green, width: 10)
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {resetTimer()}, label: {
                                Image("xButton").resizable().frame(width: 25, height: 25)
                            }).padding(.trailing, 70).disabled(noPause)
                        }
                        let totalTime = (Double(roundsGoal) * initialTime1) / 60
                        let hours = Int(totalTime/60)
                        let minutes = Int(totalTime) % 60
                        Text("Session completed!").font(.custom("Jersey15-Regular", size: 30)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091)).padding(.top, 50)
                        Text("You were productive for ").font(.custom("Jersey15-Regular", size: 28)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091))
                        Text("\(hours)hrs \(minutes)mins").font(.custom("Jersey15-Regular", size: 40)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091)).padding(.bottom, 60)
                    }
                    
                    
                }.zIndex(1)
                
                
                if noPause{
                    ZStack{
                        Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                        Rectangle().frame(width:300, height: 150).foregroundColor(.white).background().shadow(radius: 10).border(Color.yellow, width: 10)
                        VStack{
                            HStack{
                                Spacer()
                                Button(action: {noPause = false}, label: {
                                    Image("xButton").resizable().frame(width: 25, height: 25)
                                }).padding(.trailing, 70)
                            }.padding(.top, 10)
                            
                            Text("No Pause Bonus!!").font(.custom("Jersey15-Regular", size: 30))
                            HStack(spacing: 5){
                                Text("You earned an extra 50").font(.custom("Jersey15-Regular", size: 28))
                                Image("coin1").resizable().frame(width: 20, height: 20)
                            }.padding(.bottom, 20)
                        }
                        
                        
                    }.zIndex(1)
                    
                }
            
            }
            if paused && !finished && !seshDone && !justReset{
                ZStack{
                    Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                    Rectangle().frame(width:300, height: 300).foregroundColor(.white).background().shadow(radius: 10).border(Color.red, width: 10)
                    VStack(spacing:0){
                        
                       
                        Text("Paused").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(.red).padding(.top, 30)
                        Text("Timer resets in ").font(.custom("Jersey15-Regular", size: 28)).foregroundColor(.red)
                        Text(String(Int(pausedTime))).font(.custom("Jersey15-Regular", size: 110)).foregroundColor(.red).padding(.top, 10).padding(.bottom, 10)
                        
                       
                        Button(action: {
                            
                            //REORDERED HERE
                            pausedTimer?.invalidate()
                            pausedTime = 30
                            startTimer()
                            paused=false
                        }, label: {
                            Image("resumeButton").resizable().frame(width: 90, height: 30).padding(.bottom, 15)
                        })
                        Text("1 minute will be added back to your timer. ").font(.custom("Jersey15-Regular", size: 17)).foregroundColor(.red).padding(.bottom, 30)
                       
                    }
                    
                    
                }.zIndex(1)
            
            }
            
            
            
        
            VStack{
                //** Change this for each strategy
                Text("H's Way").font(.custom("Jersey15-Regular", size: 60)).padding(.top, 75).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                //** Change this for each strategy
                Text("40 minutes on, 8 minutes off").font(.custom("Jersey15-Regular", size: 30)).padding(.bottom, 20).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                
                
                
                Spacer()
                //** Change this for each strategy (The color of all the text)
                Text(formattedTime(type: 1)).font(.custom("Jersey15-Regular", size: 125)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                Text(formattedTime(type: 2)).font(.custom("Jersey15-Regular", size: 75)).foregroundColor(Color(hue: 0.572, saturation: 0.84, brightness: 1.0))
                Text("Rounds: \(roundsCompleted)/\(roundsGoal)" ).font(.custom("Jersey15-Regular", size: 50)).padding(.bottom, 20).foregroundColor(Color(hue: 0.572, saturation: 0.84, brightness: 1.0))
                Spacer()
                
                
                
                if isRunning2 || isRunning{
                    Button(action: {pauseTimer()}, label: {
                        Image("pauseButt").resizable().frame(width: 72.5, height: 42.5)
                    }).disabled(roundsCompleted>=roundsGoal).disabled(paused)
                    
                }else{
                    Button(action: {startTimer()}, label: {
                        Image("startButt").resizable().frame(width: 72.5, height: 42.5)
                    }).disabled(roundsCompleted>=roundsGoal).disabled(paused)
                }
                if isRunning{
                    Text("Currently working...").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                } else if isRunning2{
                    Text("You're on break!").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                } else if finished && !isRunning2{
                    if initialTime2 == timeRemaining2{
                        Text("Start break").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    } else{
                        Text("Resume break").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    }
                }else if !isRunning && !finished{
                    if initialTime1 == timeRemaining{
                        if roundsCompleted>=roundsGoal{
                            Text("Press reset to work again").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                        } else{
                            //Added the && not reset part
                            if paused && !justReset{
                                Text("_").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(.white)
                            }else{
                                Text("Begin working").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                            }
                        }
                    } else {
                        Text("_").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 30).foregroundColor(.white)
                    }
                }
                Spacer()
                
                
                HStack{
                    Text("Rounds").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    Spacer()
                    
                    Button(action: {decRounds()}, label: {
                        Image("minusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                    Button(action: {incRounds()}, label: {
                        Image("plusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                }.padding([.trailing,.leading], 90).padding(.bottom,30)
                
                Button(action: {resetTimer()}, label: {
                    Image("resetButton").resizable().frame(width: 90, height: 30)
                }).padding(.bottom, 100).disabled((paused && !finished) || seshDone)
                //15 //45
                
            }
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                //Only call the catch-up function if we go all the way to the background, do not do this if we only go inactive.
                if justWentBackground && (isRunning || paused || isRunning2){
                    enterBack()
                }
                justWentInactive = false
                justWentBackground = false
                print("active")
                 break
                
            case .background:
                if justWentInactive{
                    if !paused && !isRunning2 && isRunning{
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        //ADDED THIS
                        let timeRN = Date()
                        let tempTime = timeRemaining - timeRN.timeIntervalSince(exitTime)
                        if tempTime <= 0{
                            timeRemaining = 0
                        } else{
                            timeRemaining = tempTime
                        }
                        //
                        pauseTimer()
                    }
                }
                justWentBackground = true
                exitStop()
                print("background")
                break
                
            case .inactive:
                print("inactive")
                
                
                //When turning phone back on, we hit an inactive case very briefly. We only want to pause the timer if we hit the inactive case going from active to inactive, not background to inactive.
                
                if !justWentBackground{
                    if !paused && !isRunning2 && isRunning{
                        pauseTimer()
                    }
                }
                justWentInactive = true
                
            @unknown default:
                break
                
            }
            
        }.onAppear(perform: {
            levelHelper.resetTodayStats()
        }).onDisappear(perform: {
            timer?.invalidate()
            pausedTimer?.invalidate()
        })
    }
        
        
    
    
    
    private func formattedTime(type: Int) -> String{
        if type == 1{
            let minutes = Int(timeRemaining) / 60
            let seconds = Int(timeRemaining) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        } else {
            let minutes = Int(timeRemaining2) / 60
            let seconds = Int(timeRemaining2) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    private func incRounds(){
        if roundsGoal <= 14{
            roundsGoal += 1
        }
    }
    
    private func decRounds(){
        if roundsGoal >= 2{
            roundsGoal -= 1
        }
    }
    private func resetTimer(){
        paused = false
        noPause = true
        justReset = true
        roundsGoal = 1
        roundsCompleted = 0
        pausedTimer?.invalidate()
        timer?.invalidate()
        timeRemaining = initialTime1
        timeRemaining2 = initialTime2
        finished = false
        isRunning = false
        isRunning2 = false
        seshDone = false
        
        pausedTime = 30
    }
    
    private func startTimer(){
        timer?.invalidate()
        paused = false //added this line
        justReset = false
        if !finished{
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if timeRemaining > 0{
                    timeRemaining -= 1
                } else {
                    stopTimer()
                }
            }
        } else{
            isRunning2 = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if timeRemaining2 > 0{
                    timeRemaining2 -= 1
                } else {
                    stopTimer()
                }
            }
        }
    }
    
    private func exitStop(){
        if !paused{
            if isRunning{
                if roundsCompleted + 1 == roundsGoal{
                    notificationManager.instance.seshDoneNotif(timeLeft: timeRemaining)
                } else{
                    notificationManager.instance.roundDoneNotifExit(timeLeft: timeRemaining)
                }
                
            }else if isRunning2{
                notificationManager.instance.restDoneNotifExit(timeLeft: timeRemaining2)
            }
            timer?.invalidate()
        } else{
            notificationManager.instance.progLostExitPaused(timeLeft: pausedTime)
            pausedTimer?.invalidate()
        }
        exitTime = Date()
        
        //Needs to deal with both cases if the timer is meant to keep going or if the paused timer is meant to and also needs to deal with the case that we are on break.
    }
    
    private func enterBack(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        enterTime = Date()
        if !paused{
            if isRunning{
                let tempTime = timeRemaining - enterTime.timeIntervalSince(exitTime)
                if tempTime <= 0{
                    timeRemaining = 0
                } else{
                    timeRemaining = tempTime
                }
            } else if isRunning2{
                let tempTime = timeRemaining2 - enterTime.timeIntervalSince(exitTime)
                if tempTime <= 0{
                    timeRemaining2 = 0
                } else{
                    timeRemaining2 = tempTime
                }
            }
            startTimer()
                
        } else{
            pausedTime -= enterTime.timeIntervalSince(exitTime)
            if pausedTime <= 0{
                pausedTime = 0
            }
            startPause()
        }
        //must change time accordingly
    }
    
    private func startPause(){
        pausedTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            if pausedTime > 0{
                pausedTime -= 1
            } else{
                
                resetTimer()
            }
        }
    }
    
    private func stopTimer(){
        if !finished{
            finished = true
            isRunning = false
            timer?.invalidate()
            
            //** Change this for each strategy
            levelHelper.incHoursWorked(worked: Int(40))
            //** Change this for each strategy
            levelHelper.newUpdateLevel(color: "blueTile")
            charHelper.updateMoney(numTiles: levelHelper.newUpdateMoney())
            roundsCompleted += 1
            if roundsCompleted >= roundsGoal{
                seshDone = true
                if noPause{
                    levelHelper.noPauses += 1
                    charHelper.updateMoney(numTiles: 50)
                }
                
            }
        } else {
            isRunning2 = false
            finished = false
            timer?.invalidate()
            timeRemaining = initialTime1
            timeRemaining2 = initialTime2
            
            
        }
    }
    
    private func pauseTimer(){
        timer?.invalidate()
        noPause = false
        paused = true
        if isRunning{
            if Int(timeRemaining) + 60 >= Int(initialTime1){
                timeRemaining = initialTime1
            } else{
                timeRemaining += 60
            }
            startPause()
        }
        if isRunning{
            isRunning = false
        } else if isRunning2{
            isRunning2 = false
        }
        
        
    }
    
}

struct testTimerCustom: View{
    //** Change this for each strategy
    
    //1800, 360
    @State private var initialTime1: TimeInterval = 1800
    //** Change this for each strategy
    @State private var initialTime2: TimeInterval = 360
    //** Change this for each strategy
    @State private var timeRemaining: TimeInterval = 1800
    //** Change this for each strategy
    @State private var timeRemaining2: TimeInterval = 360
    
    @State private var pausedTime: TimeInterval = 30
    @State private var finished: Bool = false
    @State private var timer: Timer?
    @State private var pausedTimer: Timer?
    @State private var isRunning: Bool = false
    @State private var isRunning2: Bool = false
    @State private var seshDone: Bool = false
    @State private var roundsGoal: Int = 1
    @State private var roundsCompleted: Int = 0
    @State private var paused: Bool = false
    @State private var justReset: Bool = false
    @State private var noPause: Bool = true
    
    @State private var justWentBackground: Bool = false
    @State private var justWentInactive: Bool = false
    @State private var exitTime: Date = Date()
    @State private var enterTime: Date = Date()
   
    @ObservedObject var levelHelper : ProgPageHelp
    @ObservedObject var charHelper : CharacterHelper
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View{
        
        
        ZStack{
            if seshDone{
                ZStack{
                    Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                    Rectangle().frame(width:300, height: 300).foregroundColor(.white).background().shadow(radius: 10).border(Color.green, width: 10)
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {resetTimer()}, label: {
                                Image("xButton").resizable().frame(width: 25, height: 25)
                            }).padding(.trailing, 70).disabled(noPause)
                        }
                        let totalTime = (Double(roundsGoal) * initialTime1) / 60
                        let hours = Int(totalTime/60)
                        let minutes = Int(totalTime) % 60
                        Text("Session completed!").font(.custom("Jersey15-Regular", size: 30)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091)).padding(.top, 50)
                        Text("You were productive for ").font(.custom("Jersey15-Regular", size: 28)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091))
                        Text("\(hours)hrs \(minutes)mins").font(.custom("Jersey15-Regular", size: 40)).foregroundColor(Color(red: 0.076, green: 0.553, blue: 0.091)).padding(.bottom, 60)
                    }
                    
                    
                }.zIndex(1)
                
                
                if noPause{
                    ZStack{
                        Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                        Rectangle().frame(width:300, height: 150).foregroundColor(.white).background().shadow(radius: 10).border(Color.yellow, width: 10)
                        VStack{
                            HStack{
                                Spacer()
                                Button(action: {noPause = false}, label: {
                                    Image("xButton").resizable().frame(width: 25, height: 25)
                                }).padding(.trailing, 70)
                            }.padding(.top, 10)
                            
                            Text("No Pause Bonus!!").font(.custom("Jersey15-Regular", size: 30))
                            HStack(spacing: 5){
                                Text("You earned an extra 50").font(.custom("Jersey15-Regular", size: 28))
                                Image("coin1").resizable().frame(width: 20, height: 20)
                            }.padding(.bottom, 20)
                        }
                        
                        
                    }.zIndex(1)
                    
                }
            
            }
            if paused && !finished && !seshDone && !justReset{
                ZStack{
                    Rectangle().ignoresSafeArea().foregroundColor(.gray).opacity(0.3).blur(radius: 50.0)
                    Rectangle().frame(width:300, height: 300).foregroundColor(.white).background().shadow(radius: 10).border(Color.red, width: 10)
                    VStack(spacing:0){
                        
                       
                        Text("Paused").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(.red).padding(.top, 30)
                        Text("Timer resets in ").font(.custom("Jersey15-Regular", size: 28)).foregroundColor(.red)
                        Text(String(Int(pausedTime))).font(.custom("Jersey15-Regular", size: 110)).foregroundColor(.red).padding(.top, 10).padding(.bottom, 10)
                        
                       
                        Button(action: {
                            paused = false
                            startTimer()
                            pausedTimer?.invalidate()
                            pausedTime = 30
                        }, label: {
                            Image("resumeButton").resizable().frame(width: 90, height: 30).padding(.bottom, 15)
                        })
                        Text("1 minute will be added back to your timer. ").font(.custom("Jersey15-Regular", size: 17)).foregroundColor(.red).padding(.bottom, 30)
                       
                    }
                    
                    
                }.zIndex(1)
            
            }
            
            
            
        
            VStack{
                //** Change this for each strategy
                Text("Custom").font(.custom("Jersey15-Regular", size: 60)).padding(.top, 75).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                //** Change this for each strategy
                Text("Select settings").font(.custom("Jersey15-Regular", size: 30)).padding(.bottom, 10).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                
                
                
                Spacer()
                //** Change this for each strategy (The color of all the text)
                Text(formattedTime(type: 1)).font(.custom("Jersey15-Regular", size: 100)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                Text(formattedTime(type: 2)).font(.custom("Jersey15-Regular", size: 75)).foregroundColor(Color(red: 0.129, green: 0.8, blue: 0.156))
                Text("Rounds: \(roundsCompleted)/\(roundsGoal)" ).font(.custom("Jersey15-Regular", size: 50)).padding(.bottom, 10).foregroundColor(Color(red: 0.129, green: 0.8, blue: 0.156))
                Spacer()
                
                
                
                if isRunning2 || isRunning{
                    Button(action: {pauseTimer()}, label: {
                        Image("pauseButt").resizable().frame(width: 72.5, height: 42.5)
                    })
                    
                }else{
                    Button(action: {startTimer()}, label: {
                        Image("startButt").resizable().frame(width: 72.5, height: 42.5)
                    }).disabled(roundsCompleted>=roundsGoal).disabled(paused)
                }
                if isRunning{
                    Text("Currently working...").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 10).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                } else if isRunning2{
                    Text("You're on break!").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 10).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                } else if finished && !isRunning2{
                    if initialTime2 == timeRemaining2{
                        Text("Start break").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 10).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    } else{
                        Text("Resume break").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 10).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    }
                }else if !isRunning && !finished{
                    if initialTime1 == timeRemaining{
                        if roundsCompleted>=roundsGoal{
                            Text("Press reset to work again").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 10).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                        } else{
                            //Added the && not reset part
                            if paused && !justReset{
                                Text("_").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 10).foregroundColor(.white)
                            }else{
                                Text("Begin working").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 10).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                            }
                        }
                    } else {
                        Text("_").font(.custom("Jersey15-Regular", size: 25)).padding(.bottom, 10).foregroundColor(.white)
                    }
                }
                Spacer()
                
                
                HStack{
                    Text("Rounds").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    Spacer()
                    
                    Button(action: {decRounds()}, label: {
                        Image("minusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                    Button(action: {incRounds()}, label: {
                        Image("plusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                }.padding([.trailing,.leading], 50).padding(.bottom,10)
                
                HStack{
                    Text("Working Time").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    Spacer()
                    
                    Button(action: {decWorkTime()}, label: {
                        Image("minusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                    Button(action: {incWorkTime()}, label: {
                        Image("plusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                }.padding([.trailing,.leading], 50).padding(.bottom,10)
                HStack{
                    Text("Resting Time").font(.custom("Jersey15-Regular", size: 35)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303))
                    Spacer()
                    
                    Button(action: {decRestTime()}, label: {
                        Image("minusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                    Button(action: {incRestTime()}, label: {
                        Image("plusButton").resizable().frame(width: 32, height: 32)
                    }).disabled(isRunning).disabled(isRunning2).disabled(finished).disabled(seshDone).disabled(initialTime1 != timeRemaining).disabled(roundsCompleted != 0).disabled(paused)
                }.padding([.trailing,.leading], 50).padding(.bottom,30)
                
                Button(action: {resetTimer()}, label: {
                    Image("resetButton").resizable().frame(width: 90, height: 30)
                }).padding(.bottom, 135).disabled((paused && !finished) || seshDone)
                //15 //45
                
            }
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
                //Only call the catch-up function if we go all the way to the background, do not do this if we only go inactive.
                if justWentBackground && (isRunning || paused || isRunning2){
                    enterBack()
                }
                justWentInactive = false
                justWentBackground = false
                print("active")
                 break
                
            case .background:
                if justWentInactive{
                    if !paused && !isRunning2 && isRunning{
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                        //ADDED THIS
                        let timeRN = Date()
                        let tempTime = timeRemaining - timeRN.timeIntervalSince(exitTime)
                        if tempTime <= 0{
                            timeRemaining = 0
                        } else{
                            timeRemaining = tempTime
                        }
                        //
                        pauseTimer()
                    }
                }
                justWentBackground = true
                exitStop()
                print("background")
                break
                
            case .inactive:
                print("inactive")
                
                
                //When turning phone back on, we hit an inactive case very briefly. We only want to pause the timer if we hit the inactive case going from active to inactive, not background to inactive.
                
                if !justWentBackground{
                    if !paused && !isRunning2 && isRunning{
                        pauseTimer()
                    }
                }
                justWentInactive = true
                
            @unknown default:
                break
                
            }
            
        }.onAppear(perform: {
            levelHelper.resetTodayStats()
        }).onDisappear(perform: {
            timer?.invalidate()
            pausedTimer?.invalidate()
        })
    }
        
        
    
    
    
    private func formattedTime(type: Int) -> String{
        if type == 1{
            let hours = Int(timeRemaining) / 3600
            let minutes = Int(Int(timeRemaining) % 3600) / 60
            let seconds = Int(timeRemaining) % 60
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            let minutes = Int(timeRemaining2) / 60
            let seconds = Int(timeRemaining2) % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    private func incRounds(){
        if roundsGoal <= 14{
            roundsGoal += 1
        }
    }
    private func incWorkTime(){
        if initialTime1 < 86340{
            initialTime1 += 60
            timeRemaining += 60
        }
    }
    private func decWorkTime(){
        if initialTime1 >= 660{
            initialTime1 -= 60
            timeRemaining -= 60
        }
    }
    private func incRestTime(){
        if initialTime2 < 3540 {
            initialTime2 += 60
            timeRemaining2 += 60
        }
    }
    
    private func decRestTime(){
        if initialTime2 >= 120{
            initialTime2 -= 60
            timeRemaining2 -= 60
        }
    }
    
    private func decRounds(){
        if roundsGoal >= 2{
            roundsGoal -= 1
        }
    }
    private func resetTimer(){
        paused = false
        noPause = true
        justReset = true
        roundsGoal = 1
        roundsCompleted = 0
        pausedTimer?.invalidate()
        timer?.invalidate()
        timeRemaining = initialTime1
        timeRemaining2 = initialTime2
        finished = false
        isRunning = false
        isRunning2 = false
        seshDone = false
        
        pausedTime = 30
    }
    
    private func startTimer(){
        timer?.invalidate()
        paused = false //added this line
        justReset = false
        if !finished{
            isRunning = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if timeRemaining > 0{
                    timeRemaining -= 1
                } else {
                    stopTimer()
                }
            }
        } else{
            isRunning2 = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
                if timeRemaining2 > 0{
                    timeRemaining2 -= 1
                } else {
                    stopTimer()
                }
            }
        }
    }
    
    private func exitStop(){
        if !paused{
            if isRunning{
                if roundsCompleted + 1 == roundsGoal{
                    notificationManager.instance.seshDoneNotif(timeLeft: timeRemaining)
                } else{
                    notificationManager.instance.roundDoneNotifExit(timeLeft: timeRemaining)
                }
                
            }else if isRunning2{
                notificationManager.instance.restDoneNotifExit(timeLeft: timeRemaining2)
            }
            timer?.invalidate()
        } else{
            notificationManager.instance.progLostExitPaused(timeLeft: pausedTime)
            pausedTimer?.invalidate()
        }
        exitTime = Date()
        
        //Needs to deal with both cases if the timer is meant to keep going or if the paused timer is meant to and also needs to deal with the case that we are on break.
    }
    
    private func enterBack(){
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        enterTime = Date()
        if !paused{
            if isRunning{
                let tempTime = timeRemaining - enterTime.timeIntervalSince(exitTime)
                if tempTime <= 0{
                    timeRemaining = 0
                } else{
                    timeRemaining = tempTime
                }
            } else if isRunning2{
                let tempTime = timeRemaining2 - enterTime.timeIntervalSince(exitTime)
                if tempTime <= 0{
                    timeRemaining2 = 0
                } else{
                    timeRemaining2 = tempTime
                }
            }
            startTimer()
                
        } else{
            pausedTime -= enterTime.timeIntervalSince(exitTime)
            if pausedTime <= 0{
                pausedTime = 0
            }
            startPause()
        }
        //must change time accordingly
    }
    
    private func startPause(){
        pausedTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ _ in
            if pausedTime > 0{
                pausedTime -= 1
            } else{
                
                resetTimer()
            }
        }
    }
    
    private func stopTimer(){
        if !finished{
            finished = true
            isRunning = false
            timer?.invalidate()
            
            //** Change this for each strategy
            levelHelper.incHoursWorked(worked: Int(initialTime1)/60)
            //** Change this for each strategy
            levelHelper.newUpdateLevel(color: "greenTile")
            charHelper.updateMoney(numTiles: levelHelper.newUpdateMoney())
            roundsCompleted += 1
            if roundsCompleted >= roundsGoal{
                seshDone = true
                if noPause{
                    levelHelper.noPauses += 1
                    charHelper.updateMoney(numTiles: 50)
                }
                
            }
        } else {
            isRunning2 = false
            finished = false
            timer?.invalidate()
            timeRemaining = initialTime1
            timeRemaining2 = initialTime2
            
            
        }
    }
    
    private func pauseTimer(){
        noPause = false
        paused = true
        if isRunning{
            if Int(timeRemaining) + 60 >= Int(initialTime1){
                timeRemaining = initialTime1
            } else{
                timeRemaining += 60
            }
            startPause()
        }
        if isRunning{
            isRunning = false
        } else if isRunning2{
            isRunning2 = false
        }
        timer?.invalidate()
        
    
    }
    
    
    
}


struct testCharPage: View{
    
    //DIMENSIONS:
    //PETS: 48W 97H
    //HATS: 31W 30H
    //HEAD/HAIR: 19W 24H
    //TORSO: 35W 40H
    //PANTS: 25W 55H
    //SHOES: 25W 2H
    var body: some View{
        ZStack{
            
            Image("uPet2").resizable().frame(width:48*2, height:97*2).zIndex(1.0).padding(.top,80)
            VStack(spacing: 0){
                VStack(spacing: -13){
                    ZStack{
                        Image("uHead7").resizable().frame(width:19*2, height:24*2)
                        
                        Image("uHair16").resizable().frame(width:19*2, height:24*2)
                        Image("uHat0").resizable().frame(width:31*2, height:30*2)
                    }
                    
                    VStack(spacing:-9*2){
                        ZStack{
                            Image("uBody1").resizable().frame(width:35*2, height: 40*2)
                            Image("uTorso40").resizable().frame(width:35*2, height: 40*2)
                        }.zIndex(1)
                        
                        ZStack{
                            Image("uLegs1").resizable().frame(width: 25*2, height:55*2)
                            Image("uPants6").resizable().frame(width: 25*2, height:55*2)
                        }
                    }
                }
                Image("uShoes7").resizable().frame(width:25*2, height: 4*2)
            }
            
            
        }
    }
}
struct charPage: View{
    @State var showSheet: Bool = false
    @State var showSheet1: Bool = false
    
    @ObservedObject var charHelper : CharacterHelper
    
    @ObservedObject var levelHelper: ProgPageHelp
    
    
    var body: some View{
        ZStack{
            Image(charHelper.currentBackground).resizable().ignoresSafeArea()
            Rectangle().ignoresSafeArea().foregroundColor(.white).opacity(0.2)
            //Rectangle().ignoresSafeArea().foregroundColor(Color(hue: 0.565, saturation: 0.074, brightness: 0.87))
            
        VStack{
            ZStack{
                
                Image(charHelper.currentPet).resizable().frame(width:48*4, height:97*4).zIndex(1.0).padding(.top,145)
                
                VStack(spacing: 0){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10.0).frame(width: 190, height: 60).opacity(0.4).foregroundStyle(.white)
                        VStack(spacing:0){
                            Text("Total Time Worked: ").font(.custom("Jersey15-Regular", size: 25)).multilineTextAlignment(.center)
                            Text(levelHelper.hoursWorkedString).font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center)
                        }
                    }
                    
                    VStack(spacing: -13){
                        ZStack{
                            Image(charHelper.currentHead).resizable().frame(width:19*4, height:24*4)
                            
                            Image(charHelper.currentHair).resizable().frame(width:19*4, height:24*4)
                            Image(charHelper.currentHat).resizable().frame(width:31*4, height:30*4)
                            
                        }
                        
                        VStack(spacing:-9*4){
                            ZStack{
                                Image(charHelper.currentBody).resizable().frame(width:35*4, height: 40*4)
                                Image(charHelper.currentShirt).resizable().frame(width:35*4, height: 40*4)
                            }.zIndex(1)
                            
                            ZStack{
                                Image(charHelper.currentLegs).resizable().frame(width: 25*4, height:55*4)
                                Image(charHelper.currentPants).resizable().frame(width: 25*4, height:55*4)
                            }
                        }
                    }
                    Image(charHelper.currentShoes).resizable().frame(width:25*4, height: 4*4)
                }
                
                
                
            }
            HStack{
                Spacer()
                NavigationLink(destination: closetPage(charHelper: charHelper)){
                    Image("charP").resizable().frame(width: 50, height: 40)
                }
                Spacer()
                NavigationLink(destination: shopPage(charHelper: charHelper)){
                    Image("coin1").resizable().frame(width: 40, height: 40)
                }
                Spacer()
            }
        }.padding(.bottom, 60)
    }
        }
}
struct statsPage: View{
    @ObservedObject var levelHelper: ProgPageHelp
    var body: some View{
        ScrollView{
            VStack(spacing: 7){
                Text("Stats").font(.custom("Jersey15-Regular", size: 60)).multilineTextAlignment(.center)
                
                Text("Time Worked Today:").font(.custom("Jersey15-Regular", size: 30)).foregroundColor(Color(hue: 1.0, saturation: 0.026, brightness: 0.311)).multilineTextAlignment(.center).padding(.top, 15).foregroundStyle(.gray)
                
                Text(levelHelper.todayWorkedString).font(.custom("Jersey15-Regular", size: 53)).multilineTextAlignment(.center)
                Text("Total Time Worked:").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding(.top, 15).foregroundColor(Color(hue: 1.0, saturation: 0.026, brightness: 0.311))
                
                Text(levelHelper.hoursWorkedString).font(.custom("Jersey15-Regular", size: 53)).multilineTextAlignment(.center)
                
                Text("Current Streak:").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding(.top, 15).foregroundColor(Color(hue: 1.0, saturation: 0.026, brightness: 0.311))
                
                Text("\(levelHelper.currentStreak)").font(.custom("Jersey15-Regular", size: 53)).multilineTextAlignment(.center)
                Text("Best Streak:").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding(.top, 15).foregroundColor(Color(hue: 1.0, saturation: 0.026, brightness: 0.311))
                
                Text("\(levelHelper.maxStreak)").font(.custom("Jersey15-Regular", size: 53)).multilineTextAlignment(.center)
                Text("Most Productive Day:").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding(.top, 15).foregroundColor(Color(hue: 1.0, saturation: 0.026, brightness: 0.311))
                Text("\(levelHelper.todayWorkedRecordDate)").font(.custom("Jersey15-Regular", size: 53)).multilineTextAlignment(.center)
                Text(levelHelper.todayWorkedRecordString).font(.custom("Jersey15-Regular", size: 53)).multilineTextAlignment(.center)
            }
        }.onAppear(perform: {
            levelHelper.resetTodayStats()
        })
    }
}

struct challengesPage: View{
    @ObservedObject var levelHelper: ProgPageHelp
    @ObservedObject var charHelper: CharacterHelper
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View{
        ScrollView{
            VStack{
                Text("Challenges").font(.custom("Jersey15-Regular", size: 59)).multilineTextAlignment(.center).padding(.top, 20)
                Text("Click the title of the completed challenge to claim your rewards.").font(.custom("Jersey15-Regular", size: 23)).multilineTextAlignment(.center).padding([.trailing,.leading], 23)
                ///
                Text("Hours").font(.custom("Jersey15-Regular", size: 30)).padding(.top, 20).multilineTextAlignment(.leading)
                VStack{
                    VStack(spacing:0){
                        HStack{
                            Spacer()
                            if levelHelper.minsWorked/60 >= levelHelper.timeGoal{
                                
                                Button{
                                    charHelper.updateMoney(numTiles: (levelHelper.timeGoal) * 20)
                                    levelHelper.updateTimeGoal()
                                }label:{
                                    Spacer()
                                    Text("Complete " + String(levelHelper.timeGoal) + " hour(s) of work").font(.custom("Jersey15-Regular", size: 20)).foregroundColor(.green).opacity(levelHelper.isAnimatingTime ? 1 : 0)
                                        .onAppear {
                                            withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                                levelHelper.isAnimatingTime.toggle()
                                            }
                                        }
                                    Spacer()
                                    Text(String(levelHelper.minsWorked/60) + "/" + String(levelHelper.timeGoal)).font(.custom("Jersey15-Regular", size: 20)).foregroundStyle(.black)
                                    Spacer()
                                }.multilineTextAlignment(.center)
                            } else {
                                
                                Text("Complete " + String(levelHelper.timeGoal) + " hours of work").font(.custom("Jersey15-Regular", size: 20))
                                Spacer()
                                Text(String(levelHelper.minsWorked/60) + "/" + String(levelHelper.timeGoal)).font(.custom("Jersey15-Regular", size: 20))
                                Spacer()
                            }
                        }
                        
                    }
                    HStack{
                        ZStack(alignment: .leading){
                            
                            Rectangle().frame(width: 240, height: 20).foregroundStyle(.black).opacity(0.1).multilineTextAlignment(.leading)
                            if (levelHelper.minsWorked/60)/levelHelper.timeGoal >= 1  {
                                Rectangle().frame(width: 240, height: 20).foregroundStyle(.red).opacity(0.8)
                            } else {
                                
                                Rectangle().frame(width: CGFloat(((CGFloat(levelHelper.minsWorked)/CGFloat(levelHelper.timeGoal*60))) * 240), height: 20).foregroundStyle(.red).opacity(0.8)
                                
                            }
                        }
                        
                        HStack(spacing: 4){
                            Image("coin1").resizable().frame(width: 15, height: 15)
                            Text(String(levelHelper.timeGoal * 20)).font(.custom("Jersey15-Regular", size: 25))
                        }.padding(.leading, 5)
                        
                    }.padding(.bottom, 10)
                    
                }
                ///
                
                
                
                Text("Streaks").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.leading)
                VStack{
                    VStack(spacing:0){
                        HStack{
                            Spacer()
                            if levelHelper.maxStreak >= levelHelper.streakGoal{
                                
                                Button{
                                    charHelper.updateMoney(numTiles: (levelHelper.streakGoal) * 40)
                                    levelHelper.updateStreakGoal()
                                }label:{
                                    Spacer()
                                    Text("Work " + String(levelHelper.streakGoal) + " days in a row").font(.custom("Jersey15-Regular", size: 20)).foregroundColor(.green).opacity(levelHelper.isAnimatingStreak ? 1 : 0)
                                        .onAppear {
                                            withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                                levelHelper.isAnimatingStreak.toggle()
                                            }
                                        }
                                    Spacer()
                                    Text(String(levelHelper.maxStreak) + "/" + String(levelHelper.streakGoal)).font(.custom("Jersey15-Regular", size: 20)).foregroundStyle(.black)
                                    Spacer()
                                }.multilineTextAlignment(.center)
                            } else {
                                
                                Text("Work " + String(levelHelper.streakGoal) + " days in a row").font(.custom("Jersey15-Regular", size: 20))
                                Spacer()
                                Text(String(levelHelper.maxStreak) + "/" + String(levelHelper.streakGoal)).font(.custom("Jersey15-Regular", size: 20))
                                Spacer()
                            }
                        }
                        
                    }
                    HStack{
                        ZStack(alignment: .leading){
                            
                            Rectangle().frame(width: 240, height: 20).foregroundStyle(.black).opacity(0.1).multilineTextAlignment(.leading)
                            if (levelHelper.maxStreak)/levelHelper.streakGoal >= 1  {
                                Rectangle().frame(width: 240, height: 20).foregroundStyle(.blue).opacity(0.8)
                            } else {
                                
                                Rectangle().frame(width: CGFloat(((CGFloat(levelHelper.maxStreak)/CGFloat(levelHelper.streakGoal))) * 240), height: 20).foregroundStyle(.blue).opacity(0.8)
                                
                            }
                        }
                        
                        HStack(spacing: 4){
                            Image("coin1").resizable().frame(width: 15, height: 15)
                            Text(String(levelHelper.streakGoal * 40)).font(.custom("Jersey15-Regular", size: 25))
                        }.padding(.leading, 5)
                        
                    }.padding(.bottom, 10)
                    
                }
                
                
                Text("No Pauses").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.leading)
                VStack{
                    VStack(spacing:0){
                        HStack{
                            Spacer()
                            if levelHelper.noPauses >= levelHelper.noPauseGoal{
                                
                                Button{
                                    charHelper.updateMoney(numTiles: (levelHelper.noPauseGoal) * 60)
                                    levelHelper.updateNoPauseGoal()
                                }label:{
                                    Spacer()
                                    Text("Finish " + String(levelHelper.noPauseGoal) + " session(s) without pausing").font(.custom("Jersey15-Regular", size: 20)).foregroundColor(.green).opacity(levelHelper.isAnimatingPause ? 1 : 0)
                                        .onAppear {
                                            withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                                levelHelper.isAnimatingPause.toggle()
                                            }
                                        }
                                    
                                    Text(String(levelHelper.noPauses) + "/" + String(levelHelper.noPauseGoal)).font(.custom("Jersey15-Regular", size: 20)).foregroundStyle(.black)
                                    Spacer()
                                }.multilineTextAlignment(.center)
                            } else {
                                
                                Text("Finish " + String(levelHelper.noPauseGoal) + " session(s) without pausing").font(.custom("Jersey15-Regular", size: 20))
                                
                                Text(String(levelHelper.noPauses) + "/" + String(levelHelper.noPauseGoal)).font(.custom("Jersey15-Regular", size: 20))
                                Spacer()
                            }
                        }
                        
                    }
                    HStack{
                        ZStack(alignment: .leading){
                            
                            Rectangle().frame(width: 240, height: 20).foregroundStyle(.black).opacity(0.1).multilineTextAlignment(.leading)
                            if (levelHelper.noPauses)/levelHelper.noPauseGoal >= 1  {
                                Rectangle().frame(width: 240, height: 20).foregroundStyle(.pink).opacity(0.8)
                            } else {
                                
                                Rectangle().frame(width: CGFloat(((CGFloat(levelHelper.noPauses)/CGFloat(levelHelper.noPauseGoal))) * 240), height: 20).foregroundStyle(.pink).opacity(0.8)
                                
                            }
                        }
                        
                        HStack(spacing: 4){
                            Image("coin1").resizable().frame(width: 15, height: 15)
                            Text(String(levelHelper.noPauseGoal * 60)).font(.custom("Jersey15-Regular", size: 25))
                        }.padding(.leading, 5)
                        
                    }.padding(.bottom, 10)
                    
                }
                
                
                VStack{
                    Text("Daily Hours").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.leading)
                    VStack(spacing:0){
                        HStack{
                            Spacer()
                            if levelHelper.todayMinsWorked/60 >= levelHelper.dailyHourGoal && !levelHelper.todayHourGoalMet{
                                
                                Button{
                                    charHelper.updateMoney(numTiles: (levelHelper.todayMinsWorked/60) * 30)
                                    levelHelper.updateDailyHourGoal()
                                    
                                }label:{
                                    Spacer()
                                    Text("Work for " + String(levelHelper.dailyHourGoal) + " hour(s) today").font(.custom("Jersey15-Regular", size: 20)).foregroundColor(.green).opacity(levelHelper.isAnimatingDailyTime ? 1 : 0)
                                        .onAppear {
                                            withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                                levelHelper.isAnimatingDailyTime.toggle()
                                            }
                                        }
                                    Spacer()
                                    Text(String(levelHelper.todayMinsWorked/60) + "/" + String(levelHelper.dailyHourGoal)).font(.custom("Jersey15-Regular", size: 20)).foregroundStyle(.black)
                                    Spacer()
                                }.multilineTextAlignment(.center)
                            } else {
                                
                                Text("Work for " + String(levelHelper.dailyHourGoal) + " hour(s) today").font(.custom("Jersey15-Regular", size: 20))
                                Spacer()
                                Text(String(levelHelper.todayMinsWorked/60) + "/" + String(levelHelper.dailyHourGoal)).font(.custom("Jersey15-Regular", size: 20))
                                Spacer()
                            }
                        }
                        
                    }
                    HStack{
                        ZStack(alignment: .leading){
                            
                            Rectangle().frame(width: 240, height: 20).foregroundStyle(.black).opacity(0.1).multilineTextAlignment(.leading)
                            if (levelHelper.todayMinsWorked/60)/levelHelper.dailyHourGoal >= 1  {
                                Rectangle().frame(width: 240, height: 20).foregroundStyle(.green).opacity(0.8)
                            } else {
                                
                                Rectangle().frame(width: CGFloat(((CGFloat(CGFloat(levelHelper.todayMinsWorked)/CGFloat(60))/CGFloat(levelHelper.dailyHourGoal))) * 240), height: 20).foregroundStyle(.green).opacity(0.8)
                                
                            }
                        }
                        
                        HStack(spacing: 4){
                            Image("coin1").resizable().frame(width: 15, height: 15)
                            Text(String(levelHelper.dailyHourGoal * 30)).font(.custom("Jersey15-Regular", size: 25))
                        }.padding(.leading, 5)
                        
                    }.padding(.bottom, 10)
                    
                    
                    
                    
                }.onAppear{
                    levelHelper.resetTodayStats()
                }
                
                
                VStack{
                    Text("Daily Rounds").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.leading)
                    VStack(spacing:0){
                        HStack{
                            Spacer()
                            if levelHelper.roundsToday >= levelHelper.roundsGoal && !levelHelper.todayRoundGoalMet{
                                
                                Button{
                                    charHelper.updateMoney(numTiles: (levelHelper.roundsGoal) * 20)
                                    levelHelper.updateRoundsGoal()
                                }label:{
                                    Spacer()
                                    Text("Complete " + String(levelHelper.roundsGoal) + " round(s) today").font(.custom("Jersey15-Regular", size: 20)).foregroundColor(.green).opacity(levelHelper.isAnimatingRound ? 1 : 0)
                                        .onAppear {
                                            withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                                levelHelper.isAnimatingRound.toggle()
                                            }
                                        }
                                    Spacer()
                                    Text(String(levelHelper.roundsToday) + "/" + String(levelHelper.roundsGoal)).font(.custom("Jersey15-Regular", size: 20)).foregroundStyle(.black)
                                    Spacer()
                                }.multilineTextAlignment(.center)
                            } else {
                                
                                Text("Complete " + String(levelHelper.roundsGoal) + " round(s) today").font(.custom("Jersey15-Regular", size: 20))
                                Spacer()
                                Text(String(levelHelper.roundsToday) + "/" + String(levelHelper.roundsGoal)).font(.custom("Jersey15-Regular", size: 20))
                                Spacer()
                            }
                        }
                        
                    }
                    HStack{
                        ZStack(alignment: .leading){
                            
                            Rectangle().frame(width: 240, height: 20).foregroundStyle(.black).opacity(0.1).multilineTextAlignment(.leading)
                            if (levelHelper.roundsToday)/levelHelper.roundsGoal >= 1  {
                                Rectangle().frame(width: 240, height: 20).foregroundStyle(.purple).opacity(0.8)
                            } else {
                                
                                Rectangle().frame(width: CGFloat(((CGFloat(CGFloat(levelHelper.roundsToday)/CGFloat(levelHelper.roundsGoal))) * 240)), height: 20).foregroundStyle(.purple).opacity(0.8)
                                
                            }
                        }
                        
                        HStack(spacing: 4){
                            Image("coin1").resizable().frame(width: 15, height: 15)
                            Text(String(levelHelper.roundsGoal * 20)).font(.custom("Jersey15-Regular", size: 25))
                        }.padding(.leading, 5)
                        
                    }.padding(.bottom, 10)
                }
                
                
                
                
                ///
                Spacer()
            }
        }
    }
}

struct helpPage: View{
    @Environment(\.dismiss) var dismiss
    var body: some View{
        
        ScrollView{
            VStack(spacing: 20){
                VStack(spacing: 0){
                    HStack{
                        Spacer()
                        Button(action: {
                            dismiss()
                        }, label:{
                            Image("xButton").resizable().frame(width: 25, height: 25)
                        }).padding()
                    }
                    Text("What's \nGet Productive!?").font(.custom("Jersey15-Regular", size: 53)).multilineTextAlignment(.center)
                }
                VStack{
                    Text("! READ THIS !").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).foregroundStyle(.red)
                    Text("Here's how the timers work:").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding(.horizontal)
                    Text("- Once the timer has started, it will automatically be paused if you exit the app. Keep the app open or turn your phone off from the timer screen to keep it running.").font(.custom("Jersey15-Regular", size: 25)).multilineTextAlignment(.center).padding(.horizontal)
                    Text("- You'll earn extra coins if you go through your whole timer without pausing, so stay focused!").font(.custom("Jersey15-Regular", size: 25)).multilineTextAlignment(.center).padding(.horizontal)
                    Text("! READ THIS !").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).foregroundStyle(.red)
                    Text("*If you have run into any issues, bugs,have some suggestions or comments, please email harperdevs@gmail.com. This app is very much a work in progress and I am dedicated to creating the best user experience possible for you all.").font(.custom("Jersey15-Regular", size: 16)).multilineTextAlignment(.center).padding()
                }
                Text("Get Productive was created to reduce screen time, minimize distractions, and boost productivity.").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding()
                Text("Choose from 4 different productivity techniques and earn coins when you work!").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding()
                Text("Visualize your past work on the progress page, which resembles the grid shown below:").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding()
                VStack(spacing:0){
                    HStack(spacing:0){
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                    }
                    HStack(spacing:0){
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                        Image("coinTile10").resizable().frame(width: 80, height: 80)
                    }
                }
                
                Text("\n Add 1 tile to the grid every time you finish a full interval of work. Reach the golden tiles to earn coins! ").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding()
                VStack(spacing:0){
                    HStack(spacing:0){
                        Image("redTile").resizable().frame(width: 80, height: 80)
                        Image("blueTile").resizable().frame(width: 80, height: 80)
                    }
                    HStack(spacing:0){
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                        Image("coinTile10").resizable().frame(width: 80, height: 80)
                    }
                }
            }
            Text(" \n Earn additional coins by completing challenges!").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center)
            Text(" \n Use your coins to purchase items for your character. There are over 12 BILLION outfits to choose from.").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding()
            HStack{
                ZStack{
                    Image("uPet2").resizable().frame(width:48*2, height:97*2).zIndex(1.0).padding(.top,60)
                    VStack(spacing: 0){
                        VStack(spacing: -7){
                            ZStack{
                                Image("uHead7").resizable().frame(width:19*2, height:24*2)
                                
                                Image("uHair16").resizable().frame(width:19*2, height:24*2)
                                Image("uHat53").resizable().frame(width:31*2, height:30*2)
                            }
                            
                            VStack(spacing:-9*2){
                                ZStack{
                                    Image("uBody1").resizable().frame(width:35*2, height: 40*2)
                                    Image("uTorso41").resizable().frame(width:35*2, height: 40*2)
                                }.zIndex(1)
                                
                                ZStack{
                                    Image("uLegs1").resizable().frame(width: 25*2, height:55*2)
                                    Image("uPants6").resizable().frame(width: 25*2, height:55*2)
                                }
                            }
                        }
                        Image("uShoes7").resizable().frame(width:25*2, height: 4*2)
                    }
                    
                    
                }
                ZStack{
                    Image("uPet").resizable().frame(width:48*2, height:97*2).zIndex(1.0).padding(.top,60)
                    VStack(spacing: 0){
                        VStack(spacing: -7){
                            ZStack{
                                Image("uHead3").resizable().frame(width:19*2, height:24*2)
                                
                                Image("uHair11").resizable().frame(width:19*2, height:24*2)
                                Image("uHat0").resizable().frame(width:31*2, height:30*2)
                            }
                            
                            VStack(spacing:-9*2){
                                ZStack{
                                    Image("uBody9").resizable().frame(width:35*2, height: 40*2)
                                    Image("uTorso4").resizable().frame(width:35*2, height: 40*2)
                                }.zIndex(1)
                                
                                ZStack{
                                    Image("uLegs1").resizable().frame(width: 25*2, height:55*2)
                                    Image("uPants4").resizable().frame(width: 25*2, height:55*2)
                                }
                            }
                        }
                        Image("uShoes5").resizable().frame(width:25*2, height: 4*2)
                    }
                    
                    
                }
                ZStack{
                    Image("uPet8").resizable().frame(width:48*2, height:97*2).zIndex(1.0).padding(.top,60)
                    VStack(spacing: 0){
                        VStack(spacing: -7){
                            ZStack{
                                Image("uHead6").resizable().frame(width:19*2, height:24*2)
                                
                                Image("uHair1").resizable().frame(width:19*2, height:24*2)
                                Image("uHat0").resizable().frame(width:31*2, height:30*2)
                            }
                            
                            VStack(spacing:-9*2){
                                ZStack{
                                    Image("uBody12").resizable().frame(width:35*2, height: 40*2)
                                    Image("uTorso82").resizable().frame(width:35*2, height: 40*2)
                                }.zIndex(1)
                                
                                ZStack{
                                    Image("uLegs6").resizable().frame(width: 25*2, height:55*2)
                                    Image("uPants28").resizable().frame(width: 25*2, height:55*2)
                                }
                            }
                        }
                        Image("uShoes6").resizable().frame(width:25*2, height: 4*2)
                    }
                    
                    
                }
            }
            HStack{
                ZStack{
                    Image("uPet").resizable().frame(width:48*2, height:97*2).zIndex(1.0).padding(.top,60)
                    VStack(spacing: 0){
                        VStack(spacing: -7){
                            ZStack{
                                Image("uHead10").resizable().frame(width:19*2, height:24*2)
                                
                                Image("uHair23").resizable().frame(width:19*2, height:24*2)
                                Image("uHat").resizable().frame(width:31*2, height:30*2)
                            }
                            
                            VStack(spacing:-9*2){
                                ZStack{
                                    Image("uBody4").resizable().frame(width:35*2, height: 40*2)
                                    Image("uTorso102").resizable().frame(width:35*2, height: 40*2)
                                }.zIndex(1)
                                
                                ZStack{
                                    Image("uLegs1").resizable().frame(width: 25*2, height:55*2)
                                    Image("uPants60").resizable().frame(width: 25*2, height:55*2)
                                }
                            }
                        }
                        Image("uShoes1").resizable().frame(width:25*2, height: 4*2)
                    }
                    
                    
                }
                ZStack{
                    Image("uPet").resizable().frame(width:48*2, height:97*2).zIndex(1.0).padding(.top,60)
                    VStack(spacing: 0){
                        VStack(spacing: -7){
                            ZStack{
                                Image("uHead4").resizable().frame(width:19*2, height:24*2)
                                
                                Image("uHair40").resizable().frame(width:19*2, height:24*2)
                                Image("uHat33").resizable().frame(width:31*2, height:30*2)
                            }
                            
                            VStack(spacing:-9*2){
                                ZStack{
                                    Image("uBody10").resizable().frame(width:35*2, height: 40*2)
                                    Image("uTorso109").resizable().frame(width:35*2, height: 40*2)
                                }.zIndex(1)
                                
                                ZStack{
                                    Image("uLegs1").resizable().frame(width: 25*2, height:55*2)
                                    Image("uPants2").resizable().frame(width: 25*2, height:55*2)
                                }
                            }
                        }
                        Image("uShoes8").resizable().frame(width:25*2, height: 4*2)
                    }
                    
                    
                }
                ZStack{
                    Image("uPet").resizable().frame(width:48*2, height:97*2).zIndex(1.0).padding(.top,60)
                    VStack(spacing: 0){
                        VStack(spacing: -7){
                            ZStack{
                                Image("uHead2").resizable().frame(width:19*2, height:24*2)
                                
                                Image("uHair9").resizable().frame(width:19*2, height:24*2)
                                Image("uHat").resizable().frame(width:31*2, height:30*2)
                            }
                            
                            VStack(spacing:-9*2){
                                ZStack{
                                    Image("uBody2").resizable().frame(width:35*2, height: 40*2)
                                    Image("uTorso128").resizable().frame(width:35*2, height: 40*2)
                                }.zIndex(1)
                                
                                ZStack{
                                    Image("uLegs2").resizable().frame(width: 25*2, height:55*2)
                                    Image("uPants23").resizable().frame(width: 25*2, height:55*2)
                                }
                            }
                        }
                        Image("uShoes9").resizable().frame(width:25*2, height: 4*2)
                    }
                    
                    
                }
            }
            Text("\n Access your purchased items and the item shop by clicking on the face icon.").font(.custom("Jersey15-Regular", size: 30)).multilineTextAlignment(.center).padding(.horizontal, 14)
        }.padding(.top, 40)
    }
}

struct coinItemView: View{
    let item: Product?
    @EnvironmentObject private var store: CoinStore
    
    
    var body: some View{
        VStack{
            if item?.displayName == "175 Coins"{
                Text("Handful of Coins").font(.custom("Jersey15-Regular", size: 25))
            } else if item?.displayName == "1000 Coins"{
                Text("Pile of Coins").font(.custom("Jersey15-Regular", size: 25))
            } else if item?.displayName == "5000 Coins"{
                Text("Mountain of Coins").font(.custom("Jersey15-Regular", size: 25))
            }
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0)).frame(width: 300, height: 150).foregroundColor(.gray).opacity(0.2)
                HStack{
                    VStack{
                        if item?.displayName == "175 Coins"{
                            Image("coinStack1").resizable().frame(width: 110, height: 110)
                        } else if item?.displayName == "1000 Coins"{
                            Image("coinStack2").resizable().frame(width: 110, height: 110)
                        } else if item?.displayName == "5000 Coins"{
                            Image("coinStack3").resizable().frame(width: 100, height: 100)
                        }
                        Text(item?.displayName ?? "-").font(.custom("Jersey15-Regular", size: 25))
                        
                    }.padding(.bottom, 10)
                    Spacer()
                    VStack{
                        Button(action: {
                            if let item = item{
                                Task{
                                    await store.purchase(item)
                                }
                            }
                            
                        }, label: {
                            Image("buyButton").resizable().frame(width: 68, height: 42)
                        })
                        Text(item?.displayPrice ?? "-").font(.custom("Jersey15-Regular", size: 25))
                    }.padding(.top, 60)
                }.padding([.leading, .trailing], 70)
                
                
            }.padding(.bottom, 30)
        }
        
    }
}


struct newPurchasingPage: View{
    @EnvironmentObject private var store: CoinStore
    @State private var showDone = false
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var charHelper : CharacterHelper
    
    var body: some View{
        VStack{
            
            Text("Buy Coins!").font(.custom("Jersey15-Regular", size: 50))
            ForEach(store.items){item in
                coinItemView(item: item)
            }
        }.onChange(of: store.action){ action in
            if action == .successful {
                if store.recentBuy == "175 Coins"{
                    charHelper.updateMoney(numTiles: 175)
                } else if store.recentBuy == "1000 Coins"{
                    charHelper.updateMoney(numTiles: 1000)
                } else if store.recentBuy == "5000 Coins"{
                    charHelper.updateMoney(numTiles: 5000)
                }
                dismiss()
                store.reset()
                store.recentBuy = ""
            }
            
        }.alert(isPresented: $store.hasError, error: store.error){
            
        }
    }
    
    
}


struct purchasingPage: View{
    @State private var myProduct1: Product?
    @StateObject private var store = CoinStore()
    
    var body: some View{
        //34 by 21
        VStack{
            Text("Buy coins!").font(.custom("Jersey15-Regular", size: 50))
            Text("Handful of Coins").font(.custom("Jersey15-Regular", size: 25))
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0)).frame(width: 300, height: 150).foregroundColor(.gray).opacity(0.2)
                HStack{
                    VStack{
                        Image("coinStack1").resizable().frame(width: 110, height: 110)
                        Text("175 coins").font(.custom("Jersey15-Regular", size: 25))
                        
                    }.padding(.bottom, 10)
                    Spacer()
                    VStack{
                        Button(action: {
                            if let item = myProduct1{
                                Task{
                                    await store.purchase(item)
                                }
                            }
                        }, label: {
                            Image("buyButton").resizable().frame(width: 68, height: 42)
                        })
                        Text("$0.99").font(.custom("Jersey15-Regular", size: 25))
                    }.padding(.top, 60)
                }.padding([.leading, .trailing], 70).task{
                    myProduct1 = try? await Product.products(for: ["com.getproductive.175"]).first
                }
            }.padding(.bottom, 30)
            
            Text("Pile of Coins").font(.custom("Jersey15-Regular", size: 25))
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0)).frame(width: 300, height: 150).foregroundColor(.gray).opacity(0.2)
                HStack{
                    VStack{
                        Image("coinStack2").resizable().frame(width: 110, height: 110)
                        Text("1000 coins").font(.custom("Jersey15-Regular", size: 25))
                    }.padding(.bottom, 10)
                    Spacer()
                    VStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("buyButton").resizable().frame(width: 68, height: 42)
                        })
                        Text("$4.99").font(.custom("Jersey15-Regular", size: 25))
                    }.padding(.top, 60)
                }.padding([.leading, .trailing], 70)
                
            }.padding(.bottom, 30)
            Text("Mountain of Coins").font(.custom("Jersey15-Regular", size: 25))
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0)).frame(width: 300, height: 150).foregroundColor(.gray).opacity(0.2)
                HStack{
                    VStack{
                        Image("coinStack3").resizable().frame(width: 110, height: 110)
                        Text("5000 coins").font(.custom("Jersey15-Regular", size: 25))
                    }
                    Spacer()
                    VStack{
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("buyButton").resizable().frame(width: 68, height: 42)
                        })
                        Text("$9.99").font(.custom("Jersey15-Regular", size: 25))
                    }.padding(.top, 60)
                }.padding([.leading, .trailing], 70)
                
            }
        }
        
    }
}

struct shopPage: View{
    @ObservedObject var charHelper : CharacterHelper
    @EnvironmentObject private var store : CoinStore
    
    
    var body: some View{
        ZStack{
            VStack{
                
                HStack{
                    Text("Shop").font(.custom("Jersey15-Regular", size: 35)).padding([.leading, .bottom], 10)
                    Spacer()
                    
                        HStack(spacing:0){
                            Text("Coins: ").font(.custom("Jersey15-Regular", size: 35))
                            Image("coin1").resizable().frame(width: 15, height: 15)
                            Text("\(charHelper.money)").font(.custom("Jersey15-Regular", size: 35)).padding(.leading,3)
                        }.padding(.trailing, 10)
                        
                        
                        
                        
                    
                }
                charHelper.setUpShopItems()
            }
            
        }
    }
}

struct closetPage: View{
    @ObservedObject var charHelper : CharacterHelper
    
    var body: some View{
        Text("Your Items").font(.custom("Jersey15-Regular", size: 40)).padding(.bottom, 10)
        ScrollView{
            VStack(spacing: 0){
                
                charHelper.setUpOwnedItems()
            }.padding(.top, 15)
        }
    }
}

struct newProgPage: View{
    @ObservedObject var levelHelper : ProgPageHelp
    @ObservedObject var charHelper : CharacterHelper
    
    var body: some View{
        Text("Progress").font(.custom("Jersey15-Regular", size: 50))
        ScrollView{
            Text("Complete a round of work to add a tile to the board. Reach the golden tiles to gain coins. ").font(.custom("Jersey15-Regular", size: 25)).multilineTextAlignment(.center).padding([.leading, .trailing], 20)
            levelHelper.setUpNewGrid()
        }
    }
}

struct ProgPage: View{
    
    @ObservedObject var levelHelper : ProgPageHelp
    @ObservedObject var charHelper : CharacterHelper
    @State var isTextVisible = true
    
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
 
    
    var body: some View{
        
        ZStack{
            
            ScrollView{
                
                VStack{
                    
                    Spacer()
                    
                    if(!levelHelper.completed){
                        Text("Level \(levelHelper.level)").font(.custom("Jersey15-Regular", size: 45))
                    }else if(levelHelper.completed){
                        Text("Level \(levelHelper.level) completed!").foregroundColor(Color(red: 0.12, green: 0.796, blue: 0.158)).font(.custom("Jersey15-Regular", size: 40))
                        Spacer()
                        Button {
                            charHelper.updateMoney(numTiles: levelHelper.numTiles)
                            levelHelper.nextLevel()
                            
                            
                            
                            
                            
                            
                        } label: {
                            Text("Advance to level \(levelHelper.level + 1)").foregroundColor(Color(red: 0.002, green: 0.036, blue: 0.303)).font(.custom("Jersey15-Regular", size: 40)).padding(.top, 30).opacity(isTextVisible ? 1 : 0)
                                .onAppear {
                                    
                                    withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                        self.isTextVisible.toggle()
                                    }
                                }
                            
                            
                            
                        }
                        
                        
                        Spacer()
                    }
                    HStack{
                        Text("Earn").font(.custom("Jersey15-Regular", size: 40))
                        Image("coin1").resizable().frame(width: 16, height: 16)
                        Text("\(levelHelper.numTiles)").font(.custom("Jersey15-Regular", size: 40))
                    }.padding(.top)
                    
                    Text("Progress: \(levelHelper.currTilesAdded)/\(levelHelper.numTiles)").font(.custom("Jersey15-Regular", size: 40)).padding()
                    Spacer()
                    levelHelper.setUpGrid()
                }.padding(.top, 40)
            }.onAppear(perform: levelHelper.setCols)
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let levelHelper = ProgPageHelp()
        let charHelper = CharacterHelper()
        
        return Group {
            charPage(charHelper: charHelper, levelHelper: levelHelper)
            testTimer(levelHelper: levelHelper, charHelper: charHelper)
            ContentView()
            HomePage()
            closetPage(charHelper: charHelper)
            shopPage(charHelper: charHelper)
            helpPage()
            ProgPage(levelHelper: levelHelper, charHelper: charHelper)
            
            statsPage(levelHelper: levelHelper)
            challengesPage(levelHelper: levelHelper, charHelper: charHelper)
            newProgPage(levelHelper: levelHelper, charHelper: charHelper)
            testCharPage()
        
        }
    }
}
