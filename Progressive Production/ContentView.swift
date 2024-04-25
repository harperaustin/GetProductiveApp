//
//  ContentView.swift
//  Progressive Production
//
//  Created by Harper Austin on 3/17/24.
//

import SwiftUI
import UserNotifications

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
    func roundDoneNotif(endTime: Float){
        let roundDone = UNMutableNotificationContent()
        roundDone.title = "Round completed!"
        roundDone.subtitle = "Excellent work."
        roundDone.sound = .default
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(endTime), repeats: false)
        
        let requestRD = UNNotificationRequest(identifier: "roundDoneReq", content: roundDone, trigger: trigger)
        UNUserNotificationCenter.current().add(requestRD)
        
    }
    
    func breakDoneNotif(endTime: Float){
        let breakDone = UNMutableNotificationContent()
        breakDone.title = "Time's up!"
        breakDone.subtitle = "Let's get productive."
        breakDone.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: Double(endTime), repeats: false)
        
        let requestRD = UNNotificationRequest(identifier: "roundDoneReq", content: breakDone, trigger: trigger)
        UNUserNotificationCenter.current().add(requestRD)
    }
}

struct ContentView: View {
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("intLogo").resizable().frame(width: 250, height: 140, alignment: .center).padding().navigationBarHidden(true)
                
                NavigationLink(destination: HomePage()){
                    Image("GO").resizable().frame(width: 100, height: 40, alignment: .center).padding(.top, 100).navigationBarHidden(true)
                }.navigationBarHidden(true)
                    
                    
                }
                
            }
        }.onAppear(perform: notificationManager.instance.requestAuthorization)
    }
}


struct HomePage: View{
    @AppStorage("ONBOARDING") var onboarding: Bool = true
    @State var showSheet: Bool = false
    
    var body: some View{
        let levelHelper = ProgPageHelp()
        let charHelper = CharacterHelper()
        
        NavigationView{
            
                
            VStack(alignment: .center){
                
                Text("Choose a method").font(.custom("PressStart2P-Regular", size: 20)).padding(.bottom, 10)
                
                NavigationLink(destination: Pomodoro(levelHelper: levelHelper)){
                Image("pomoButton").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height: 150, alignment: .center)
            }
                NavigationLink(destination: FiftyTwo(levelHelper: levelHelper)){
                    Image("5217Button").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height: 150, alignment: .center)
                }
                NavigationLink(destination: GPSpecial(levelHelper: levelHelper)){
                    Image("HWay").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height: 150, alignment: .center)
                }
                NavigationLink(destination: Custom(levelHelper: levelHelper)){
                    Image("custButton").resizable().aspectRatio(contentMode: .fit).frame(width: 350, height: 150, alignment: .center)
                }
                
                HStack{
                    
                    NavigationLink(destination: ProgPage(levelHelper: levelHelper, charHelper: charHelper)){
                        Image("levelP4")
                    }
                    Spacer()
                    Button(action: {onboarding.toggle()
                    }, label: {Text("?").font(.custom("PressStart2P-Regular", size: 25))    }).sheet(isPresented: $onboarding, content: {helpPage()})
                    Spacer()
                    NavigationLink(destination: charPage(charHelper: charHelper, levelHelper: levelHelper)){
                        Image("charP5").resizable().frame(width: 40, height: 40)
                    }
                }.padding([.leading, .bottom, .trailing], 70)
               
            }.sheet(isPresented: $onboarding, content: {helpPage()})
        
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}



struct charPage: View{
    @State var showSheet: Bool = false
    @State var showSheet1: Bool = false
    
    @ObservedObject var charHelper : CharacterHelper
    
    @ObservedObject var levelHelper: ProgPageHelp
    
    
    var body: some View{
        ZStack{
            Image("background2").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
        VStack(spacing: 0){
            
            VStack(spacing: 10){
            Text("Time Worked:").font(.custom("PressStart2P-Regular", size: 16)).foregroundColor(.white)
            Text("\(levelHelper.hoursWorkedString)").font(.custom("PressStart2P-Regular", size: 20)).foregroundColor(.white)
            }
            VStack(spacing: -20){
        
                Image("\(charHelper.currentHat)").resizable().frame(width: 140, height: 100).zIndex(1)

                Image("\(charHelper.currentHead)").resizable().frame(width: 140, height: 130)
            }

                Image("\(charHelper.currentShirt)").resizable().frame(width: 130, height: 80)

                Image("\(charHelper.currentPants)").resizable().frame(width: 100, height: 120)

                Image("\(charHelper.currentShoes)").resizable().frame(width: 100, height: 20)
            
            HStack(){
            Button(action: {showSheet.toggle()
            }, label: {Image("charP").resizable().frame(width: 85, height: 70).padding([.top, .trailing], 50)
            }).sheet(isPresented: $showSheet, content: {closetPage(charHelper: charHelper)})
                
            Button(action: {showSheet1.toggle()
            }, label: {Image("coin1").resizable().frame(width: 70, height: 70).padding([.top, .leading], 50)
            }).sheet(isPresented: $showSheet1, content: {shopPage(charHelper: charHelper)})
        }
        }.padding(.bottom, 20)
        
        }
    }
}

struct helpPage: View{
    var body: some View{
        ScrollView{
            VStack(spacing: 20){
                Text("What's Get Productive!?").font(.custom("PressStart2P-Regular", size: 23))
                Text("Get Productive is a project intended to 'gamify' productivity.").font(.custom("PressStart2P-Regular", size: 15)).multilineTextAlignment(.center).padding()
                Text("Choose from 4 different work-rest productivity techniques and beat levels as you work.").font(.custom("PressStart2P-Regular", size: 15)).multilineTextAlignment(.center).padding()
                Text("Each level you must complete an entire grid as shown below:").font(.custom("PressStart2P-Regular", size: 15)).multilineTextAlignment(.center).padding()
                VStack(spacing:0){
                    HStack(spacing:0){
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                    }
                    HStack(spacing:0){
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                    }
                }
                
                Text("Add 1 tile to the grid every time you complete an interval of work. Once you start the timer, you can't leave the page without losing your progress, so stay focused!").font(.custom("PressStart2P-Regular", size: 15)).multilineTextAlignment(.center).padding()
                VStack(spacing:0){
                    HStack(spacing:0){
                        Image("redTile").resizable().frame(width: 80, height: 80)
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                    }
                    HStack(spacing:0){
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                        Image("emptyTile").resizable().frame(width: 80, height: 80)
                    }
                }
                Text("Check your progress by clicking the arrow icon on the home page.").font(.custom("PressStart2P-Regular", size: 13)).multilineTextAlignment(.center).padding()
                Text("Beat each level and earn coins by filling up the entire grid!").font(.custom("PressStart2P-Regular", size: 15)).multilineTextAlignment(.center).padding()
                VStack(spacing:0){
                    HStack(spacing:0){
                        Image("redTile").resizable().frame(width: 80, height: 80)
                        Image("blueTile").resizable().frame(width: 80, height: 80)
                    }
                    HStack(spacing:0){
                        Image("yellowTile").resizable().frame(width: 80, height: 80)
                        Image("greenTile").resizable().frame(width: 80, height: 80)
                    }
                }
                
            }
            Text("Use your coins to purchase items and customize your character. Choose from over 26 million combinations!").font(.custom("PressStart2P-Regular", size: 16)).multilineTextAlignment(.center).padding(.horizontal, 14)
            HStack{
                VStack(spacing:0){
                    VStack(spacing: -20){
                
                        Image("starterHat").resizable().frame(width: 70, height: 50).zIndex(1)

                        Image("starterHead1").resizable().frame(width: 70, height: 65)
                    }

                        Image("starterShirt").resizable().frame(width: 65, height: 40)

                        Image("pants6").resizable().frame(width: 50, height: 60)

                        Image("startershoes").resizable().frame(width: 50, height: 10)
                
                }
                VStack(spacing:0){
                    VStack(spacing: -12){
                
                        Image("hat8").resizable().frame(width: 70, height: 50).zIndex(1)

                        Image("head9").resizable().frame(width: 70, height: 65)
                    }

                        Image("shirt28").resizable().frame(width: 65, height: 40)

                        Image("pants8").resizable().frame(width: 50, height: 60)

                        Image("shoes5").resizable().frame(width: 50, height: 10)
                
                }
                VStack(spacing:0){
                    VStack(spacing: -10){
                
                        Image("hat2").resizable().frame(width: 70, height: 50).zIndex(1)

                        Image("head26").resizable().frame(width: 70, height: 65)
                    }

                        Image("shirt23").resizable().frame(width: 65, height: 40)

                        Image("pants9").resizable().frame(width: 50, height: 60)

                        Image("shoes8").resizable().frame(width: 50, height: 10)
                
                }
            }
            HStack{
                VStack(spacing:0){
                    VStack(spacing: -20){
                
                        Image("starterHat").resizable().frame(width: 70, height: 50).zIndex(1)

                        Image("head70").resizable().frame(width: 70, height: 65)
                    }

                        Image("shirt19").resizable().frame(width: 65, height: 40)

                        Image("pants22").resizable().frame(width: 50, height: 60)

                        Image("startershoes").resizable().frame(width: 50, height: 10)
                
                }
                VStack(spacing:0){
                    VStack(spacing: -12){
                
                        Image("hat18").resizable().frame(width: 70, height: 50).zIndex(1)

                        Image("head77").resizable().frame(width: 70, height: 65)
                    }

                        Image("shirt21").resizable().frame(width: 65, height: 40)

                        Image("pants17").resizable().frame(width: 50, height: 60)

                        Image("shoes5").resizable().frame(width: 50, height: 10)
                
                }
                
                VStack(spacing:0){
                    VStack(spacing: -10){
                
                        Image("starterHat").resizable().frame(width: 70, height: 50).zIndex(1)

                        Image("head67").resizable().frame(width: 70, height: 65)
                    }

                        Image("shirt13").resizable().frame(width: 65, height: 40)

                        Image("pants19").resizable().frame(width: 50, height: 60)

                        Image("shoes1").resizable().frame(width: 50, height: 10)
                
                
                }
            }
            Text("Access your purchased items and the item shop by clicking on the face icon.").font(.custom("PressStart2P-Regular", size: 15)).multilineTextAlignment(.center).padding(.horizontal, 14)
        }.padding(.top, 40)
    }
}

struct shopPage: View{
    @ObservedObject var charHelper : CharacterHelper
    
    var body: some View{
        VStack{
            HStack{
                Text("Shop").font(.custom("PressStart2P-Regular", size: 18)).padding([.leading, .bottom], 10)
                Spacer()
                HStack(spacing:0){
                Text("Coins:").font(.custom("PressStart2P-Regular", size: 18))
                Image("coin1").resizable().frame(width: 15, height: 15)
                    Text("\(charHelper.money)").font(.custom("PressStart2P-Regular", size: 18)).padding(.leading,3)
                }.padding([.bottom, .trailing], 10)
            }
            charHelper.setUpShopItems()
        }
    }
}

struct closetPage: View{
    @ObservedObject var charHelper : CharacterHelper
    
    var body: some View{
        VStack{
            Text("Your Items").font(.custom("PressStart2P-Regular", size: 18)).padding(.bottom, 10)
            charHelper.setUpOwnedItems()
        }.padding(.top, 30)
    }
}


struct ProgPage: View{
    
    @ObservedObject var levelHelper : ProgPageHelp
    @ObservedObject var charHelper : CharacterHelper
    @State var isTextVisible = true
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
 
    
    var body: some View{
        
    
        ScrollView{
            
            VStack{
            
                Spacer()
                
                if(!levelHelper.completed){
                Text("Level \(levelHelper.level)").foregroundColor(Color.gray).font(.custom("PressStart2P-Regular", size: 20))
                }else if(levelHelper.completed){
                    Text("Level \(levelHelper.level) completed!").foregroundColor(Color(red: 0.12, green: 0.796, blue: 0.158)).font(.custom("PressStart2P-Regular", size: 20))
                    Spacer()
                    Button {
                        charHelper.updateMoney(numTiles: levelHelper.numTiles)
                        levelHelper.nextLevel()
                        
                    } label: {
                        Text("Advance to level \(levelHelper.level + 1)").foregroundColor(Color(red: 0.002, green: 0.036, blue: 0.303)).font(.custom("PressStart2P-Regular", size: 17)).padding(.top, 30).opacity(isTextVisible ? 1 : 0)
                            .onAppear {
                                
                                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                    self.isTextVisible.toggle()
                                }
                            }
                        
                        
                        
                    }
                    
                    
                    Spacer()
                }
                HStack{
                    Text("Earn").foregroundColor(Color.gray).font(.custom("PressStart2P-Regular", size: 20))
                    Image("coin1").resizable().frame(width: 16, height: 16)
                    Text("\(levelHelper.numTiles)").foregroundColor(Color.gray).font(.custom("PressStart2P-Regular", size: 20))
                }.padding(.top)
                
                Text("Progress: \(levelHelper.currTilesAdded)/\(levelHelper.numTiles)").foregroundColor(Color.gray).font(.custom("PressStart2P-Regular", size: 20)).padding()
                Spacer()
                levelHelper.setUpGrid()
            }.padding(.top, 40)
        }.onAppear(perform: levelHelper.setCols)
    }
}

struct Pomodoro: View{
    
    @StateObject private var vm = ViewModelPom()
    @StateObject private var vm1 = ViewModelPom1()
    
    @ObservedObject var levelHelper : ProgPageHelp
    
    
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View{
        
        ZStack{
            ZStack{
            //Maybe Background
            VStack{
                
                Text("Pomodoro Technique").foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).font(.custom("PressStart2P-Regular", size: 20)).padding(.top, 50)
                
                Text("25 minutes on, 5 minutes off.").foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).font(.custom("PressStart2P-Regular", size: 12)).padding(.top, 5)
                    
                Spacer()
                
                Text("\(vm.time)").font(.custom("PressStart2P-Regular", size: 60)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).multilineTextAlignment(.center).alert("Round \(vm.currRound) Finished", isPresented: $vm.showingAlerts){
                    if(vm.currRound == vm.rounds){
                        Button("Great Work!"){
                            vm.totalReset()
                            vm1.totalReset()
                            levelHelper.updateLevel(color: "redTile")
                                levelHelper.incHoursWorked(worked: 25)
                            
                            
                        }
                    } else {
                        Button("Start Break") {
                            vm.reset()
                            vm1.start(minutes: vm1.minutes)
                            levelHelper.updateLevel(color: "redTile")
                            levelHelper.incHoursWorked(worked: 25)
                            }
                        
                        }
                    }
                
                Text("\(vm1.time)").font(.custom("PressStart2P-Regular", size: 40)).foregroundColor(Color(red: 0.915, green: 0.047, blue: 0.203)).multilineTextAlignment(.center).alert("Break Finished", isPresented: $vm1.showingAlerts){
                    Button("Start Work") {
                        vm1.reset()
                        vm.start(minutes: vm.minutes)
                    }
                }
                
                Text("Round \(vm.currRound)/\(vm.rounds)").font(.custom("PressStart2P-Regular", size: 30)).multilineTextAlignment(.center).padding(.bottom, 70).foregroundColor(Color(red: 0.919, green: 0.044, blue: 0.202))
                    
                Button(){
                    vm.start(minutes: vm.minutes)
                } label: {
                    Image("realStart").resizable().frame(width: 120, height: 45, alignment: .center)
                }.padding(.bottom, 150).disabled(vm.isActive).disabled(vm1.isActive)
                
                Stepper("Rounds", value: $vm.rounds, in: 1...10).padding(.bottom, 150).frame(width: 250.0).font(.custom("PressStart2P-Regular", size: 24)).foregroundColor(.gray).disabled(vm.isActive).disabled(vm1.isActive).frame(width: 300, height: 50, alignment: .center).padding()
                
                }.onReceive(timer){ _ in
                vm.updateCountdown()
                }
            
            }.onReceive(timer){ _ in
            vm1.updateCountdown()
            }
        }.navigationBarBackButtonHidden(vm.isActive || vm1.isActive)
        
    }
}

struct FiftyTwo: View{
    @StateObject private var vm = ViewModel52()
    @StateObject private var vm1 = ViewModel521()
    
    @ObservedObject var levelHelper : ProgPageHelp
    
    
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View{
        ZStack{
            ZStack{
            //Maybe Background
            VStack{
                
                Text("52-17 Strategy").foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).font(.custom("PressStart2P-Regular", size: 20)).padding(.top, 50)
                
                Text("52 minutes on, 17 minutes off.").foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).font(.custom("PressStart2P-Regular", size: 12)).padding(.top, 5)
                    
                Spacer()
                
                Text("\(vm.time)").font(.custom("PressStart2P-Regular", size: 60)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).multilineTextAlignment(.center).alert("Round \(vm.currRound) Finished", isPresented: $vm.showingAlerts){
                    if(vm.currRound == vm.rounds){
                        Button("Great Work!"){
                            vm.totalReset()
                            vm1.totalReset()
                            levelHelper.updateLevel(color: "yellowTile")
                            levelHelper.incHoursWorked(worked: 52)
                            
                        }
                    } else {
                        Button("Start Break") {
                            vm.reset()
                            vm1.start(minutes: vm1.minutes)
                            levelHelper.updateLevel(color: "yellowTile")
                            levelHelper.incHoursWorked(worked: 52)
                            
                            }
                        
                        }
                    }
                
                Text("\(vm1.time)").font(.custom("PressStart2P-Regular", size: 40)).foregroundColor(Color(red: 0.928, green: 0.869, blue: 0.202)).multilineTextAlignment(.center).alert("Break Finished", isPresented: $vm1.showingAlerts){
                    Button("Start Work") {
                        vm1.reset()
                        vm.start(minutes: vm.minutes)
                    }
                }
                
                Text("Round \(vm.currRound)/\(vm.rounds)").font(.custom("PressStart2P-Regular", size: 30)).multilineTextAlignment(.center).padding(.bottom, 70).foregroundColor(Color(red: 0.928, green: 0.869, blue: 0.202))
                    
                Button(){
                    vm.start(minutes: vm.minutes)
                } label: {
                    Image("yellowStart").resizable().frame(width: 120, height: 50, alignment: .center)
                }.padding(.bottom, 150).disabled(vm.isActive).disabled(vm1.isActive)
                
                Stepper("Rounds", value: $vm.rounds, in: 1...10).padding(.bottom, 150).frame(width: 250.0).font(.custom("PressStart2P-Regular", size: 24)).foregroundColor(.gray).disabled(vm.isActive).disabled(vm1.isActive).frame(width: 300, height: 50, alignment: .center).padding()
                
                }.onReceive(timer){ _ in
                vm.updateCountdown()
                }
            
            }.onReceive(timer){ _ in
            vm1.updateCountdown()
            }
        }.navigationBarBackButtonHidden(vm.isActive || vm1.isActive)
            
    }
}

struct Custom: View{
    
    @StateObject private var vm = ViewModel()
    @StateObject private var vm1 = ViewModel1()
    
    
    @ObservedObject var levelHelper : ProgPageHelp
    
    
    @State var minsWorked = 0
    
    
   
    
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    
    
    var body: some View{
        
        
        
        ZStack{
                
            
                
            VStack{
                VStack{
                Text("Custom").foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).font(.custom("PressStart2P-Regular", size: 20))
                
                Text("Select Settings").foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).font(.custom("PressStart2P-Regular", size: 12)).padding(.top, 5)
                    
                Spacer()
                
                Text("\(vm.time)").font(.custom("PressStart2P-Regular", size: 60)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).multilineTextAlignment(.center).alert("Round \(vm.currRound) Finished", isPresented: $vm.showingAlerts){
                    if(vm.currRound == vm.rounds){
                        Button("Great Work!"){
                            vm.totalReset()
                            vm1.totalReset()
                            levelHelper.updateLevel(color: "greenTile")
                            levelHelper.incHoursWorked(worked: minsWorked)
                            
                        }
                    } else {
                        Button("Start Break") {
                            vm.reset()
                            vm1.start(minutes: vm1.minutes)
                            levelHelper.updateLevel(color: "greenTile")
                            levelHelper.incHoursWorked(worked: minsWorked)
                            
                            
                            }
                        
                        }
                    
                    }
                
                Text("\(vm1.time)").font(.custom("PressStart2P-Regular", size: 40)).foregroundColor(Color(red: 0.12, green: 0.796, blue: 0.158)).multilineTextAlignment(.center).alert("Break Finished", isPresented: $vm1.showingAlerts){
                    Button("Start Work") {
                        vm1.reset()
                        vm.start(minutes: vm.minutes)
                    }
                }
                
                Text("Round \(vm.currRound)/\(vm.rounds)").font(.custom("PressStart2P-Regular", size: 30)).multilineTextAlignment(.center).padding(.bottom, 70).foregroundColor(Color(red: 0.12, green: 0.796, blue: 0.158))
                    
                Button(){
                    minsWorked = Int(vm.minutes)
                    vm.start(minutes: vm.minutes)
                        
                
                    
                } label: {
                    Image("greenStart").resizable().frame(width: 120, height: 50, alignment: .center)
                }.padding(.bottom, 150).disabled(vm.isActive).disabled(vm1.isActive)
                    
                Stepper("Working Time", value: $vm.minutes, in: 20...90).padding().frame(width: 350.0).font(.custom("PressStart2P-Regular", size: 17)).foregroundColor(.gray).disabled(vm.isActive).disabled(vm1.isActive).frame(width: 300, height: 50, alignment: .center)
                    
                Stepper("Resting Time", value: $vm1.minutes, in: 1...20).padding().frame(width: 350.0).font(.custom("PressStart2P-Regular", size: 17)).foregroundColor(.gray).disabled(vm.isActive).disabled(vm1.isActive).frame(width: 300, height: 50, alignment: .center)
                    
                    Stepper("Rounds", value: $vm.rounds, in: 1...20).padding().frame(width: 350.0).font(.custom("PressStart2P-Regular", size: 17)).foregroundColor(.gray).disabled(vm.isActive).disabled(vm1.isActive).frame(width: 300, height: 50, alignment: .center)
                        
                    
                }
                Spacer()
                    
                    
                    }.onReceive(timer){ _ in
                    vm.updateCountdown()
                }.onReceive(timer){ _ in
                    vm1.updateCountdown()
            }
                
        }.navigationBarBackButtonHidden(vm.isActive || vm1.isActive)
    }
}

struct GPSpecial: View{
    @StateObject private var vm = ViewModelGP()
    @StateObject private var vm1 = ViewModelGP1()
    
    @ObservedObject var levelHelper : ProgPageHelp
    
    
    
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View{
        ZStack{
            ZStack{
            //Maybe Background
            VStack{
                
                Text("H's Way").foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).font(.custom("PressStart2P-Regular", size: 20)).padding(.top, 50)
                
                Text("40 minutes on, 8 minutes off.").foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).font(.custom("PressStart2P-Regular", size: 12)).padding(.top, 5)
                    
                Spacer()
                
                Text("\(vm.time)").font(.custom("PressStart2P-Regular", size: 60)).foregroundColor(Color(red: 0.015, green: 0.04, blue: 0.303)).multilineTextAlignment(.center).alert("Round \(vm.currRound) Finished", isPresented: $vm.showingAlerts){
                    if(vm.currRound == vm.rounds){
                        Button("Great Work!"){
                            vm.totalReset()
                            vm1.totalReset()
                            levelHelper.updateLevel(color: "blueTile")
                            levelHelper.incHoursWorked(worked: 40)
                            
                        }
                    } else {
                        Button("Start Break") {
                            vm.reset()
                            vm1.start(minutes: vm1.minutes)
                            levelHelper.updateLevel(color: "blueTile")
                            levelHelper.incHoursWorked(worked: 40)
                            
                            }
                        
                        }
                    }
                
                Text("\(vm1.time)").font(.custom("PressStart2P-Regular", size: 40)).foregroundColor(Color(red: 0.168, green: 0.82, blue: 0.991)).multilineTextAlignment(.center).alert("Break Finished", isPresented: $vm1.showingAlerts){
                    Button("Start Work") {
                        vm1.reset()
                        vm.start(minutes: vm.minutes)
                    }
                }
                
                Text("Round \(vm.currRound)/\(vm.rounds)").font(.custom("PressStart2P-Regular", size: 30)).multilineTextAlignment(.center).padding(.bottom, 70).foregroundColor(Color(red: 0.168, green: 0.82, blue: 0.991))
                    
                Button(){
                    vm.start(minutes: vm.minutes)
                } label: {
                    Image("blueStart").resizable().frame(width: 120, height: 50, alignment: .center)
                }.padding(.bottom, 150).disabled(vm.isActive).disabled(vm1.isActive)
                
                Stepper("Rounds", value: $vm.rounds, in: 1...10).padding(.bottom, 150).frame(width: 250.0).font(.custom("PressStart2P-Regular", size: 24)).foregroundColor(.gray).disabled(vm.isActive).disabled(vm1.isActive).frame(width: 300, height: 50, alignment: .center).padding()
                
                }.onReceive(timer){ _ in
                vm.updateCountdown()
                }
            
            }.onReceive(timer){ _ in
            vm1.updateCountdown()
            }
        }.navigationBarBackButtonHidden(vm.isActive || vm1.isActive)
            
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let levelHelper = ProgPageHelp()
        let charHelper = CharacterHelper()
        
        return Group {
            ContentView()
            HomePage()
            charPage(charHelper: charHelper, levelHelper: levelHelper)
            closetPage(charHelper: charHelper)
            shopPage(charHelper: charHelper)
            helpPage()
            ProgPage(levelHelper: levelHelper, charHelper: charHelper)
            Custom(levelHelper: levelHelper)
            
        
        }
    }
}
