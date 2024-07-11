//
//  Content-ViewModelCharacter.swift
//  Progressive Production
//
//  Created by Harper Austin on 3/25/24.
//

import Foundation
import SwiftUI

final class CharacterHelper: ObservableObject{
    @AppStorage("CURRENT_HAT1") var currentHat : String = "uHat"
    @AppStorage("CURRENT_HAIR1") var currentHair : String = "uHair"
    @AppStorage("CURRENT_HEAD1") var currentHead : String = "uHead1"
    @AppStorage("CURRENT_SHIRT1") var currentShirt : String = "uTorso51"
    @AppStorage("CURRENT_PANTS1") var currentPants : String = "uPants"
    @AppStorage("CURRENT_SHOES1") var currentShoes : String = "uShoes1"
    @AppStorage("CURRENT_PET1") var currentPet : String = "uPet"
    @AppStorage("CURRENT_BODY1") var currentBody : String = "uBody1"
    @AppStorage("CURRENT_LEGS1") var currentLegs : String = "uLegs1"
    @AppStorage("CURRENT_BACKGROUND1") var currentBackground: String = "uBackground1"
    @AppStorage("IS_WIDE") var isWide : Bool = false
    
    @Published var shoesPrice: Int = 175
    @Published var pantsPrice: Int = 200
    @Published var shirtPrice: Int = 250
    @Published var headPrice: Int = 25
    @Published var hatPrice: Int = 225
    @Published var petPrice: Int = 475
    @Published var teesPrice: Int = 205
    @Published var backPrice: Int = 325
    
    //DIMENSIONS
    @Published var hatW: Int = 31
    @Published var hatH: Int = 30
    
    @Published var petW: Int = 48
    @Published var petH: Int = 97
    
    @Published var headW: Int = 19
    @Published var headH: Int = 24
    
    @Published var torsoW: Int = 35
    @Published var torsoH: Int = 40
    
    @Published var pantsW: Int = 25
    @Published var pantsH: Int = 55
    
    @Published var shoesW: Int = 25
    @Published var shoesH: Int = 4
    
    
    
    
    @AppStorage("MONEY_KEY") var money: Int = 5
    
    
    @AppStorage("OWNED_HATS1") var storedOwnedHats : String = "uHat"
    
    var ownedHats: [String] {
        get{
            return storedOwnedHats.components(separatedBy: ",")
        }
        set{
            storedOwnedHats = newValue.joined(separator: ",")
        }
    }
    
    @AppStorage("OWNED_HAIR1") var storedOwnedHair : String = "uHair,uHair1,uHair2,uHair3,uHair4,uHair5,uHair6,uHair7,uHair8,uHair9,uHair10,uHair11,uHair12,uHair13,uHair14,uHair15,uHair16,uHair17,uHair18,uHair19,uHair20,uHair21,uHair22,uHair23,uHair24,uHair25,uHair26,uHair27,uHair28,uHair29,uHair30,uHair31,uHair32,uHair33,uHair34,uHair35,uHair36,uHair37,uHair38,uHair39,uHair40,uHair41,uHair42,uHair43,uHair44,uHair45,uHair46,uHair47,uHair48"
    
    var ownedHair: [String] {
        get{
            return storedOwnedHair.components(separatedBy: ",")
        }
        set{
            storedOwnedHair = newValue.joined(separator: ",")
        }
    }
    
    
    
    @AppStorage("OWNED_HEADS1") var storedOwnedHeads : String = "uHead1,uHead2,uHead3,uHead4,uHead5,uHead6,uHead7,uHead8,uHead9,uHead10,uHead11,uHead12"
    var ownedHeads: [String] {
        get{
            return storedOwnedHeads.components(separatedBy: ",")
        }
        set{
            storedOwnedHeads = newValue.joined(separator: ",")
        }
    }
    
    @AppStorage("OWNED_SHIRTS1") var storedOwnedShirts: String = "uTorso51,uTorso14"
    var ownedShirts : [String] {
        get{
            return storedOwnedShirts.components(separatedBy: ",")
        }
        set{
            storedOwnedShirts = newValue.joined(separator: ",")
        }
    }
    
    @AppStorage("OWNED_PANTS1") var storedOwnedPants : String = "uPants"
    var ownedPants : [String]{
        get{
            return storedOwnedPants.components(separatedBy: ",")
    }
        set{
            storedOwnedPants = newValue.joined(separator: ",")
        }
    }
    @AppStorage("OWNED_SHOES1") var storedOwnedShoes : String = "uShoes1"
    var ownedShoes : [String]{
        get{
            return storedOwnedShoes.components(separatedBy: ",")
        }
        set{
            storedOwnedShoes = newValue.joined(separator: ",")
        }
    }
    
    @AppStorage("OWNED_PETS1") var storedOwnedPets : String = "uPet"
    var ownedPets : [String]{
        get{
            return storedOwnedPets.components(separatedBy: ",")
        }
        set{
            storedOwnedPets = newValue.joined(separator: ",")
        }
    }
    
    @AppStorage("OWNED_BACKGROUNDS") var storedOwnedBackgrounds : String = "uBackground1"
    var ownedBackgrounds : [String]{
        get{
            return storedOwnedBackgrounds.components(separatedBy: ",")
        }
        set{
            storedOwnedBackgrounds = newValue.joined(separator: ",")
        }
    }
    
    @Published var shopHats: [String] = ["uHat43","uHat44","uHat45","uHat46","uHat47","uHat48","uHat49","uHat50","uHat51","uHat52","uHat53","uHat54","uHat55","uHat56","uHat57","uHat58","uHat28","uHat29","uHat30","uHat31","uHat32","uHat33","uHat34","uHat35","uHat36", "uHat1","uHat2","uHat3","uHat4","uHat5","uHat6","uHat7","uHat8","uHat9","uHat10","uHat11","uHat12","uHat13","uHat14","uHat15","uHat16","uHat17","uHat18", "uHat37", "uHat38","uHat39","uHat40","uHat41","uHat42","uHat22","uHat23","uHat24","uHat25","uHat26","uHat27", "uHat59", "uHat60"]
    
    @Published var shopHeads: [String] = ["head64","head65","head66","head67","head68","head69","head70","head71","head72","head73","head74","head75","head76","head77","head78","head79","head80","head81","head82", "head83", "head84","head86"]
    
    @Published var shopShirts: [String] = ["uTorso1","uTorso2","uTorso3","uTorso4","uTorso5","uTorso6","uTorso7","uTorso8","uTorso9","uTorso10","uTorso11","uTorso12","uTorso13","uTorso15","uTorso16","uTorso17","uTorso18","uTorso19","uTorso20","uTorso21","uTorso22","uTorso23","uTorso24","uTorso25","uTorso26","uTorso27","uTorso28","uTorso29","uTorso30","uTorso31","uTorso32","uTorso33","uTorso34","uTorso35","uTorso36","uTorso37","uTorso38","uTorso39","uTorso40","uTorso41","uTorso42","uTorso43","uTorso44","uTorso45","uTorso46","uTorso47","uTorso48","uTorso49","uTorso50","uTorso52","uTorso53","uTorso54","uTorso55","uTorso56","uTorso57","uTorso58","uTorso59","uTorso60","uTorso61","uTorso62","uTorso63","uTorso64","uTorso65","uTorso66","uTorso67","uTorso68","uTorso69","uTorso70","uTorso71","uTorso72","uTorso73","uTorso74","uTorso75","uTorso76","uTorso77","uTorso78","uTorso79","uTorso80","uTorso81","uTorso82","uTorso83","uTorso84","uTorso85","uTorso129","uTorso86","uTorso87","uTorso88","uTorso89","uTorso90","uTorso91","uTorso92","uTorso93","uTorso94","uTorso95","uTorso96","uTorso97","uTorso98","uTorso99","uTorso100","uTorso101","uTorso102","uTorso103","uTorso104","uTorso105","uTorso106","uTorso107", "uTorso108", "uTorso109", "uTorso110", "uTorso111", "uTorso112", "uTorso113","uTorso114","uTorso115","uTorso116","uTorso117","uTorso118","uTorso119","uTorso120","uTorso121","uTorso122","uTorso123","uTorso124","uTorso125","uTorso126","uTorso127","uTorso128","uTorso130", "uTorso131", "uTorso132", "uTorso133"]
    
    
    
    @Published var shopPants: [String] = ["uPants1", "uPants2", "uPants3","uPants4","uPants5","uPants6","uPants7","uPants8","uPants9","uPants10","uPants11", "uPants66","uPants12","uPants13","uPants14","uPants15","uPants16","uPants17","uPants18","uPants19","uPants20","uPants58","uPants59","uPants60","uPants61","uPants62","uPants63","uPants64","uPants21","uPants22","uPants23","uPants24","uPants25","uPants26","uPants27","uPants28","uPants29","uPants30","uPants31","uPants32","uPants33","uPants34","uPants35","uPants36","uPants37","uPants38","uPants39","uPants40","uPants67","uPants41","uPants42","uPants43","uPants44","uPants45","uPants46","uPants47","uPants48","uPants49","uPants50","uPants51","uPants52","uPants53", "uPants65", "uPants54","uPants55","uPants56","uPants57"]
    
    @Published var shopShoes: [String] = ["uShoes2", "uShoes3", "uShoes4", "uShoes5", "uShoes6", "uShoes7", "uShoes8", "uShoes9", "uShoes10", "uShoes11", "uShoes12", "uShoes13"]
    @Published var shopPets: [String] = ["uPet1","uPet2","uPet3","uPet4","uPet5","uPet6","uPet7","uPet8","uPet9","uPet10","uPet11","uPet12","uPet13","uPet14","uPet15"]
    @Published var shopBackgrounds: [String] = ["uBackground2","uBackground3","uBackground4","uBackground5","uBackground6","uBackground7","uBackground8","uBackground9","uBackground10","uBackground11","uBackground12","uBackground13","uBackground14", "uBackground15"]
    
    
    @Published var confirmingHats: [Bool] = Array(repeating: false, count: 57)
    @Published var confirmingShirts: [Bool] = Array(repeating: false, count: 131)
    @Published var confirmingPets: [Bool] = Array(repeating: false, count: 15)
    @Published var confirmingPants: [Bool] = Array(repeating: false, count: 68)
    @Published var confirmingShoes: [Bool] = Array(repeating: false, count: 13)
    @Published var confirmingBackgrounds: [Bool] = Array(repeating: false, count: 14)
    
    
    
    
    func setUpOwnedBackgrounds()-> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<ownedBackgrounds.count, id: \.self){ index in
                    ZStack{
                        if(self.ownedBackgrounds[index] == self.currentBackground){
                                Rectangle().frame(width: 40*4, height: 70*4, alignment: .trailing).foregroundColor(.yellow).opacity(0.2)
                        }else{
                            Rectangle().frame(width: 40*4, height: 70*4, alignment: .trailing).foregroundColor(.gray).opacity(0.1)
                        }
                        
                        Button{
                            self.chooseCurrBackground(back: self.ownedBackgrounds[index])
                        } label:{
                            Image("\(self.ownedBackgrounds[index])").resizable().frame(width: 35*4, height: 65*4)
                        }
                        
                        
                    }
                }
                
            }.padding(.leading, 20)
        }
    }
    
    
    
    func setUpOwnedHats() -> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<ownedHats.count, id: \.self){ index in
                    ZStack{
                        if(self.ownedHats[index] == self.currentHat){
                                Rectangle().frame(width: 41*4, height: 40*4, alignment: .trailing).foregroundColor(.yellow).opacity(0.2)
                        }else{
                            Rectangle().frame(width: 41*4, height: 40*4, alignment: .trailing).foregroundColor(.gray).opacity(0.1)
                        }
                        if(self.ownedHats[index] == "uHat"){
                            Button{
                                self.chooseCurrHat(hat: self.ownedHats[index])
                            } label:{
                                Text("None").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 15)
                            }
                        }
                        else {
                            Button{
                                self.chooseCurrHat(hat: self.ownedHats[index])
                            } label:{
                                Image("\(self.ownedHats[index])").resizable().frame(width: 31*4, height: 30*4)
                        }
                        }
                        
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpOwnedPets() -> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<ownedPets.count, id: \.self){ index in
                    ZStack{
                        if(self.ownedPets[index] == self.currentPet){
                                Rectangle().frame(width: 58*3, height: 107*3, alignment: .trailing).foregroundColor(.yellow).opacity(0.2)
                        }else{
                            Rectangle().frame(width: 58*3, height: 107*3, alignment: .trailing).foregroundColor(.gray).opacity(0.1)
                        }
                        if(self.ownedPets[index] == "uPet"){
                            Button{
                                self.chooseCurrPet(pet: self.ownedPets[index])
                            } label:{
                                Text("None").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 15)
                            }
                        }
                        else {
                            Button{
                                self.chooseCurrPet(pet: self.ownedPets[index])
                            } label:{
                                Image("\(self.ownedPets[index])").resizable().frame(width: 48*3, height: 97*3)
                        }
                        }
                        
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpOwnedHair() -> some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(0..<ownedHair.count, id: \.self){ index in
                    ZStack{
                        if(self.ownedHair[index] == self.currentHair){
                            Rectangle().frame(width:24*4, height: 29*4, alignment: .trailing).foregroundColor(.yellow).opacity(0.2)
                        }else{
                            Rectangle().frame(width:24*4, height: 29*4, alignment: .trailing).foregroundColor(.gray).opacity(0.1)
                        }
                        if(self.ownedHair[index] == "uHair"){
                            Button{
                                self.chooseCurrHat(hat: self.ownedHats[index])
                            } label:{
                                Text("Bald!").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 15)
                            }
                        }
                        Button{
                            self.chooseCurrHair(hair: self.ownedHair[index])
                        } label:{
                            Image("\(self.ownedHair[index])").resizable().frame(width: 19*4, height: 24*4)
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
                            Rectangle().frame(width: 24*4, height: 29*4, alignment: .trailing).foregroundColor(.yellow).opacity(0.2)
                        }else{
                            Rectangle().frame(width: 24*4, height: 29*4, alignment: .trailing).foregroundColor(.gray).opacity(0.1)
                        }
                        Button{
                            self.chooseCurrHead(head: self.ownedHeads[index], index: index)
                        } label:{
                            Image("\(self.ownedHeads[index])").resizable().frame(width: 19*4, height: 24*4)
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
                            Rectangle().frame(width: 40*4, height: 45*4, alignment: .trailing).foregroundColor(.yellow).opacity(0.2)
                        }else{
                            Rectangle().frame(width: 40*4, height: 45*4, alignment: .trailing).foregroundColor(.gray).opacity(0.1)
                        }
                        Button{
                            self.chooseCurrShirt(shirt: self.ownedShirts[index])
                        } label:{
                            Image("\(self.ownedShirts[index])").resizable().frame(width: 35*4, height: 40*4)
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
                                Rectangle().frame(width: 30*4, height: 60*4, alignment: .trailing).foregroundColor(.yellow).opacity(0.2)
                        }else{
                            Rectangle().frame(width: 30*4, height: 60*4, alignment: .trailing).foregroundColor(.gray).opacity(0.2)
                        }
                        Button{
                            self.chooseCurrPants(pants: self.ownedPants[index])
                        } label:{
                            Image("\(self.ownedPants[index])").resizable().frame(width: 25*4, height: 55*4)
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
                            Rectangle().frame(width: 30*4, height: 9*4, alignment: .trailing).foregroundColor(.yellow).opacity(0.2)
                            
                        }else{
                        Rectangle().frame(width: 30*4, height: 9*4, alignment: .trailing).foregroundColor(.gray).opacity(0.1)
                        }
                        if(self.ownedShoes[index] == "shoes1"){
                            Button{
                            self.chooseCurrShoes(shoes: self.ownedShoes[index])
                            } label:{
                                Text("None").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                            }
                            
                        } else{
                            
                                Button{
                                    self.chooseCurrShoes(shoes: self.ownedShoes[index])
                                } label:{
                                    Image("\(self.ownedShoes[index])").resizable().frame(width: 25*4, height: 4*4)
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
            VStack(alignment: .leading,spacing: 10){
            Text("Hats").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
            self.setUpOwnedHats()
            }
            VStack(alignment: .leading,spacing: 10){
            Text("Hair").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
            self.setUpOwnedHair()
            }
            VStack(alignment: .leading,spacing: 10){
            Text("Heads").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
            self.setUpOwnedHeads()
            }
            VStack(alignment: .leading,spacing: 10){
            Text("Tops").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
            self.setUpOwnedShirts()
            }
            VStack(alignment: .leading, spacing: 10){
                Text("Bottoms").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
            self.setUpOwnedPants()
            }
            VStack(alignment: .leading,spacing: 10){
            Text("Shoes").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
            self.setUpOwnedShoes()
            }
            VStack(alignment: .leading,spacing: 10){
            Text("Pets").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
            self.setUpOwnedPets()
            }
            VStack(alignment: .leading,spacing: 10){
            Text("Backgrounds").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
            self.setUpOwnedBackgrounds()
            }
            
        }
    }
    
    func chooseCurrBackground(back: String){
        self.currentBackground = back
    }
    
    func chooseCurrHat(hat: String){
        self.currentHat = hat
    }
    
    func chooseCurrPet(pet: String){
        self.currentPet = pet
    }
    
    func chooseCurrHair(hair: String){
        self.currentHair = hair
    }
    
    func chooseCurrHead(head: String, index: Int){
        self.currentHead = head
        if(index == 0 || index == 6){
            if self.isWide{
                self.currentBody = "uBody7"
            } else{
                self.currentBody = "uBody1"
            }
            self.currentLegs = "uLegs1"
        }
        if(index == 1 || index == 7){
            if self.isWide{
                self.currentBody = "uBody8"
            } else{
                self.currentBody = "uBody2"
            }
            self.currentLegs = "uLegs2"
        }
        if(index == 2 || index == 8){
            if self.isWide{
                self.currentBody = "uBody9"
            } else{
                self.currentBody = "uBody3"
            }
            self.currentLegs = "uLegs3"
        }
        if(index == 3 || index == 9){
            if self.isWide{
                self.currentBody = "uBody10"
            } else{
                self.currentBody = "uBody4"
            }
            self.currentLegs = "uLegs4"
        }
        
        if(index == 4 || index == 10){
            if self.isWide{
                self.currentBody = "uBody11"
            } else{
                self.currentBody = "uBody5"
            }
            self.currentLegs = "uLegs5"
        }
        if(index == 5 || index == 11){
            if self.isWide{
                self.currentBody = "uBody12"
            } else{
                self.currentBody = "uBody6"
            }
            self.currentLegs = "uLegs6"
        }
        
    }
    
    func chooseCurrShirt(shirt: String){
        self.currentShirt = shirt
        let number = findTorso(torso: shirt)
        if number > 0 && number <= 11{
            self.isWide = true
        } else if number > 11 && number <= 54{
            self.isWide = false
        } else if number > 54 && number <= 101{
            self.isWide = true
        } else if number > 101 && number <= 108{
            self.isWide = false
        } else if number > 108 && number <= 113 {
            self.isWide = true
        } else if number > 113 && number <= 129 {
            self.isWide = false
        } else if number > 129 && number <= 131 {
            self.isWide = true
        } else if number == 132 || number == 133 {
            self.isWide = false
        }
        self.updateBody()
        //FUNCTION FOR CHANGING THE BODY NOW
    }
    
    func chooseCurrPants(pants: String){
        self.currentPants = pants
    }
    
    func chooseCurrShoes(shoes: String){
        self.currentShoes = shoes
    }
    
    
    func findTorso(torso: String) -> Int{
        do {
            let regex = try NSRegularExpression(pattern: "(\\d+)$")
            if let match = regex.firstMatch(in: torso, options: [],  range: NSRange(location: 0, length: torso.count)){
                if let range = Range(match.range, in: torso){
                    let numberString = String(torso[range])
                    if let number = Int(numberString){
                        return number
                    }
                }
            }
        } catch{
            print("Invalid Input")
        }
        return -1
    }
    
    func updateBody(){
        let head = findTorso(torso: currentHead)
        if head == 1 || head == 7 {
            if isWide{
                self.currentBody = "uBody7"
            } else{
                self.currentBody = "uBody1"
            }
        
        } else if head == 2 || head == 8 {
            if isWide{
                self.currentBody = "uBody8"
            } else{
                self.currentBody = "uBody2"
            }
        
        } else if head == 3 || head == 9 {
            if isWide{
                self.currentBody = "uBody9"
            } else{
                self.currentBody = "uBody3"
            }
        
        } else if head == 4 || head == 10 {
            if isWide{
                self.currentBody = "uBody10"
            } else{
                self.currentBody = "uBody4"
            }
        
        } else if head == 5 || head == 11 {
            if isWide{
                self.currentBody = "uBody11"
            } else{
                self.currentBody = "uBody5"
            }
        
        } else if head == 6 || head == 12 {
            if isWide{
                self.currentBody = "uBody12"
            } else{
                self.currentBody = "uBody6"
            }
        
        }
        
        
    }
    
    
    
    //DIMENSIONS:
    //PETS: 48W 97H
    //HATS: 31W 30H
    //HEAD/HAIR: 19W 24H
    //TORSO: 35W 40H
    //PANTS: 25W 49H
    //SHOES: 25W 2H
    
    func setUpShopHats() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(0..<shopHats.count, id: \.self){ index in
                    if(self.ownedHats.contains(self.shopHats[index])){
                        ZStack{
                            Rectangle().frame(width: 36*4, height: 35*4).foregroundColor(.green).opacity(0.2)
                            Image("\(self.shopHats[index])").resizable().frame(width: 31*4, height: 30*4)
                        }
                    } else {
                        if self.confirmingHats[index]{
                            ZStack{
                                Rectangle().frame(width: 36*4, height: 35*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Hat?").font(.custom("Jersey15-Regular", size: 20))
                                    HStack{
                                        Button(action: {
                                            self.confirmingHats[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchaseHat(hat: self.shopHats[index])
                                            self.confirmingHats[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                                
                            }
                        } else{
                            
                            
                            ZStack{
                                Rectangle().frame(width: 36*4, height: 35*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingHats[index] = true
                                } label:{
                                    
                                    Image("\(self.shopHats[index])").resizable().frame(width: 31*4, height: 30*4)
                                }
                                
                                
                            }
                    }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopBackgrounds() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(0..<shopBackgrounds.count, id: \.self){ index in
                    if(self.ownedBackgrounds.contains(self.shopBackgrounds[index])){
                        ZStack{
                            Rectangle().frame(width: 40*4, height: 70*4).foregroundColor(.green).opacity(0.2)
                            Image("\(self.shopBackgrounds[index])").resizable().frame(width: 35*4, height: 65*4)
                        }
                    } else {
                        if self.confirmingBackgrounds[index]{
                            ZStack{
                                Rectangle().frame(width: 40*4, height: 70*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Background?").font(.custom("Jersey15-Regular", size: 17))
                                    HStack{
                                        Button(action: {
                                            self.confirmingBackgrounds[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchaseBackground(back: self.shopBackgrounds[index])
                                            self.confirmingBackgrounds[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                                
                            }
                        } else{
                            
                            
                            ZStack{
                                Rectangle().frame(width: 40*4, height: 70*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingBackgrounds[index] = true
                                } label:{
                                    
                                    Image("\(self.shopBackgrounds[index])").resizable().frame(width: 35*4, height: 65*4)
                                }
                                
                                
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
                        Rectangle().frame(width: 24*4, height: 24*4).foregroundColor(.green).opacity(0.2)
                        Image("\(self.shopHeads[index])").resizable().frame(width: 19*4, height: 24*4)
                        }
                    } else {
                        
                        
                        
                        
                    ZStack{
                        Rectangle().frame(width: 24*4, height: 24*4).foregroundColor(.gray).opacity(0.1)
                        Button{
                            self.purchaseHead(head: self.shopHeads[index])
                            } label:{
                                
                            Image("\(self.shopHeads[index])").resizable().frame(width: 19*4, height: 24*4)
                        }
                    }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopPets() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(0..<shopPets.count, id: \.self){ index in
                    if(self.ownedPets.contains(self.shopPets[index])){
                        ZStack{
                        Rectangle().frame(width: 53*4, height: 102*4).foregroundColor(.green).opacity(0.2)
                        Image("\(self.shopPets[index])").resizable().frame(width: 48*4, height: 97*4)
                        }
                    } else {
                        
                        if self.confirmingPets[index]{
                            ZStack{
                                Rectangle().frame(width: 53*4, height: 102*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Pet?").font(.custom("Jersey15-Regular", size: 20))
                                    HStack{
                                        Button(action: {
                                            self.confirmingPets[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchasePet(pet: self.shopPets[index])
                                            self.confirmingPets[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                            
                        } else{
                            
                            ZStack{
                                Rectangle().frame(width: 53*4, height: 102*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingPets[index] = true
                                } label:{
                                    
                                    Image("\(self.shopPets[index])").resizable().frame(width: 48*4, height: 97*4)
                                }
                            }
                    }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopShirts() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(0..<shopShirts.count, id: \.self){ index in
                    if (index > 10 && index <= 18) || (index > 26 && index <= 32) || (index > 33 && index <= 42) || (index > 50 && index <= 69) || (index > 111 && index <= 126) || index == 129{
                        if(self.ownedShirts.contains(self.shopShirts[index])){
                            ZStack{
                                Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.green).opacity(0.2)
                                Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                            }
                        } else{
                            if self.confirmingShirts[index] {
                                ZStack{
                                    Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.3)
                                    VStack{
                                        Text("Purchase Tee?").font(.custom("Jersey15-Regular", size: 20))
                                        HStack{
                                            Button(action: {
                                                self.confirmingShirts[index] = false
                                            }, label: {
                                                Image("exButton").resizable().frame(width: 20, height: 20)
                                            })
                                            
                                            Button(action: {
                                                self.purchaseTees(shirt: self.shopShirts[index])
                                                self.confirmingShirts[index] = false
                                            }, label: {
                                                Image("checkButton").resizable().frame(width: 20, height: 20)
                                            })
                                        }
                                    }
                                }
                            } else{
                                
                                ZStack{
                                    Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.1)
                                    Button{
                                        self.confirmingShirts[index] = true
                                    } label:{
                                        Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                                    }
                                    
                                    
                                }
                        }
                        }
                        
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopSweaters() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(0..<shopShirts.count, id: \.self){ index in
                    if index <= 10 || (index > 18 && index <= 26) || (index > 42 && index <= 50) || (index > 99 && index <= 111) || index == 127 || index == 128{
                        if(self.ownedShirts.contains(self.shopShirts[index])){
                            ZStack{
                                Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.green).opacity(0.2)
                                Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                            }
                        } else{
                            if self.confirmingShirts[index]{
                                ZStack{
                                    Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.3)
                                    VStack{
                                        Text("Purchase Sweater?").font(.custom("Jersey15-Regular", size: 20))
                                        HStack{
                                            Button(action: {
                                                self.confirmingShirts[index] = false
                                            }, label: {
                                                Image("exButton").resizable().frame(width: 20, height: 20)
                                            })
                                            
                                            Button(action: {
                                                self.purchaseShirt(shirt: self.shopShirts[index])
                                                self.confirmingShirts[index] = false
                                            }, label: {
                                                Image("checkButton").resizable().frame(width: 20, height: 20)
                                            })
                                        }
                                    }
                                }
                            } else{
                                
                                ZStack{
                                    Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.1)
                                    Button{
                                        self.confirmingShirts[index] = true
                                    } label:{
                                        Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                                    }
                                    
                                    
                                }
                        }
                        }
                        
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopJerseys() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(70...83, id: \.self){ index in
                    if(self.ownedShirts.contains(self.shopShirts[index])){
                        ZStack{
                            Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.green).opacity(0.2)
                            Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                        }
                    } else{
                        if self.confirmingShirts[index]{
                            ZStack{
                                Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Jersey?").font(.custom("Jersey15-Regular", size: 20))
                                    HStack{
                                        Button(action: {
                                            self.confirmingShirts[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchaseShirt(shirt: self.shopShirts[index])
                                            self.confirmingShirts[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                        } else{
                            
                            ZStack{
                                Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingShirts[index] = true
                                } label:{
                                    Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                                }
                                
                                
                            }
                    }
                    }
                
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopCollars() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(0..<shopShirts.count, id: \.self){ index in
                    if (index >= 84 && index < 96) || index == 130{
                        if(self.ownedShirts.contains(self.shopShirts[index])){
                            ZStack{
                                Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.green).opacity(0.2)
                                Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                            }
                        } else{
                            if self.confirmingShirts[index]{
                                ZStack{
                                    Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.3)
                                    VStack{
                                        Text("Purchase Shirt?").font(.custom("Jersey15-Regular", size: 20))
                                        HStack{
                                            Button(action: {
                                                self.confirmingShirts[index] = false
                                            }, label: {
                                                Image("exButton").resizable().frame(width: 20, height: 20)
                                            })
                                            
                                            Button(action: {
                                                self.purchaseShirt(shirt: self.shopShirts[index])
                                                self.confirmingShirts[index] = false
                                            }, label: {
                                                Image("checkButton").resizable().frame(width: 20, height: 20)
                                            })
                                        }
                                    }
                                }
                            } else{
                                
                                ZStack{
                                    Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.1)
                                    Button{
                                        self.confirmingShirts[index] = true
                                    } label:{
                                        Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                                    }
                                    
                                    
                                }
                            }
                        }
                        
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    func setUpShopSuitTop() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(96...99, id: \.self){ index in
                    if(self.ownedShirts.contains(self.shopShirts[index])){
                        ZStack{
                            Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.green).opacity(0.2)
                            Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                        }
                    } else{
                        if self.confirmingShirts[index]{
                            ZStack{
                                Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Suit?").font(.custom("Jersey15-Regular", size: 20))
                                    HStack{
                                        Button(action: {
                                            self.confirmingShirts[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchaseShirt(shirt: self.shopShirts[index])
                                            self.confirmingShirts[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                        } else{
                            
                            
                            ZStack{
                                Rectangle().frame(width: 40*4, height: 45*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingShirts[index] = true
                                } label:{
                                    Image("\(self.shopShirts[index])").resizable().frame(width: 35*4, height: 40*4)
                                }
                                
                                
                            }
                        }
                    }
                
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopJerseyBottoms() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(49...62, id: \.self){ index in
                    if(self.ownedPants.contains(self.shopPants[index])){
                        ZStack{
                        Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.green).opacity(0.2)
                        Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                        }
                    }
                    else{
                        if self.confirmingPants[index]{
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Shorts?").font(.custom("Jersey15-Regular", size: 17))
                                    HStack{
                                        Button(action: {
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchasePants(pants: self.shopPants[index])
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                        } else{
                            
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingPants[index] = true
                                } label:{
                                    
                                    Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                                }
                                
                                
                            }
                        }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopPants() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(0...11, id: \.self){ index in
                    if(self.ownedPants.contains(self.shopPants[index])){
                        ZStack{
                        Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.green).opacity(0.2)
                        Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                        }
                    }
                    else{
                        if self.confirmingPants[index]{
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Pants?").font(.custom("Jersey15-Regular", size: 17))
                                    HStack{
                                        Button(action: {
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchasePants(pants: self.shopPants[index])
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                        } else{
                            
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingPants[index] = true
                                } label:{
                                    
                                    Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                                }
                                
                                
                            }
                        }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopDresses() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(12...27, id: \.self){ index in
                    if(self.ownedPants.contains(self.shopPants[index])){
                        ZStack{
                        Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.green).opacity(0.2)
                        Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                        }
                    }
                    else{
                        if self.confirmingPants[index]{
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Dress?").font(.custom("Jersey15-Regular", size: 17))
                                    HStack{
                                        Button(action: {
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchasePants(pants: self.shopPants[index])
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                        } else{
                            
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingPants[index] = true
                                } label:{
                                    
                                    Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                                }
                                
                                
                            }
                        }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopSuitBottoms() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(63...66, id: \.self){ index in
                    if(self.ownedPants.contains(self.shopPants[index])){
                        ZStack{
                        Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.green).opacity(0.2)
                        Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                        }
                    }
                    else{
                        if self.confirmingPants[index]{
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Pants?").font(.custom("Jersey15-Regular", size: 17))
                                    HStack{
                                        Button(action: {
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchasePants(pants: self.shopPants[index])
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                        } else{
                            
                            
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingPants[index] = true
                                } label:{
                                    
                                    Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                                }
                                
                                
                            }
                        }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopShorts() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(28...40, id: \.self){ index in
                    if(self.ownedPants.contains(self.shopPants[index])){
                        ZStack{
                        Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.green).opacity(0.2)
                        Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                        }
                    }
                    else{
                        if self.confirmingPants[index]{
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Shorts?").font(.custom("Jersey15-Regular", size: 17))
                                    HStack{
                                        Button(action: {
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchasePants(pants: self.shopPants[index])
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                        } else{
                            
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingPants[index] = true
                                } label:{
                                    
                                    Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                                }
                                
                                
                            }
                        }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopSkirts() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(41...48, id: \.self){ index in
                    if(self.ownedPants.contains(self.shopPants[index])){
                        ZStack{
                        Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.green).opacity(0.2)
                        Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                        }
                    }
                    else{
                        if self.confirmingPants[index]{
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.3)
                                VStack{
                                    Text("Purchase Skirt?").font(.custom("Jersey15-Regular", size: 17))
                                    HStack{
                                        Button(action: {
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchasePants(pants: self.shopPants[index])
                                            self.confirmingPants[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                        } else{
                            
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 60*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingPants[index] = true
                                } label:{
                                    
                                    Image("\(self.shopPants[index])").resizable().frame(width: 25*4, height: 55*4)
                                }
                                
                                
                            }
                        }
                    }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopShoes() -> some View{
        ScrollView(.horizontal){
            HStack(spacing: 5){
                ForEach(0..<shopShoes.count, id: \.self){ index in
                    if(self.ownedShoes.contains(self.shopShoes[index])){
                        ZStack{
                            Rectangle().frame(width: 30*4, height: 9*4).foregroundColor(.green).opacity(0.2)
                            
                            Image("\(self.shopShoes[index])").resizable().frame(width: 25*4, height: 4*4)
                        }
                    }
                    else {
                        if self.confirmingShoes[index] {
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 9*4).foregroundColor(.gray).opacity(0.3)
                                VStack(spacing: 0){
                                    Text("Purchase Shoes?").font(.custom("Jersey15-Regular", size: 14))
                                    HStack{
                                        Button(action: {
                                            self.confirmingShoes[index] = false
                                        }, label: {
                                            Image("exButton").resizable().frame(width: 20, height: 20)
                                        })
                                        
                                        Button(action: {
                                            self.purchaseShoes(shoes: self.shopShoes[index])
                                            self.confirmingShoes[index] = false
                                        }, label: {
                                            Image("checkButton").resizable().frame(width: 20, height: 20)
                                        })
                                    }
                                }
                            }
                        } else{
                            
                            ZStack{
                                Rectangle().frame(width: 30*4, height: 9*4).foregroundColor(.gray).opacity(0.1)
                                Button{
                                    self.confirmingShoes[index] = true
                                } label:{
                                    
                                    Image("\(self.shopShoes[index])").resizable().frame(width: 25*4, height: 4*4)
                                }
                                
                                
                            }
                        }
                }
                }
                
            }.padding(.leading, 20)
        }
            
    }
    
    func setUpShopItems() -> some View{
        ScrollView{
            VStack(spacing: 25){
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 0){
                        Text("Hats: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.hatPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopHats()
                    
                }
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 0){
                        Text("Tees: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.teesPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopShirts()
                }
                
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 0){
                        Text("Sweaters: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.shirtPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopSweaters()
                }
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 0){
                        Text("Collared Tops: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.shirtPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopCollars()
                }
                
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 0){
                        Text("Jerseys (Top): ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.shirtPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopJerseys()
                }
                
                VStack(alignment: .leading, spacing: 10){
                    HStack(spacing: 0){
                        Text("Jerseys (Bottom): ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.pantsPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopJerseyBottoms()
                }
                VStack(alignment: .leading, spacing: 10){
                    HStack(spacing: 0){
                        Text("Suit (Top): ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.shirtPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopSuitTop()
                }
                
                VStack(alignment: .leading, spacing: 10){
                    HStack(spacing: 0){
                        Text("Suit (Bottom): ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.pantsPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopSuitBottoms()
                }
                
                
                VStack(alignment: .leading, spacing: 10){
                    HStack(spacing: 0){
                        Text("Pants: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.pantsPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopPants()
                }
                
                VStack(alignment: .leading, spacing: 10){
                    HStack(spacing: 0){
                        Text("Dresses: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.pantsPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopDresses()
                }
                
                VStack(alignment: .leading, spacing: 10){
                    HStack(spacing: 0){
                        Text("Shorts: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.pantsPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopShorts()
                }
                
                VStack(alignment: .leading, spacing: 10){
                    HStack(spacing: 0){
                        Text("Skirts: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.pantsPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopSkirts()
                }
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 0){
                        Text("Shoes: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.shoesPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopShoes()
                }
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 0){
                        Text("Pets: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.petPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopPets()
                }
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 0){
                        Text("Backgrounds: ").font(.custom("Jersey15-Regular", size: 30)).padding(.leading, 20)
                        Image("coin1").resizable().frame(width: 15, height: 15).padding(.trailing, 3)
                        Text("\(self.backPrice)").font(.custom("Jersey15-Regular", size: 25))
                    }
                    self.setUpShopBackgrounds()
                }

            }
        }
    }
    
    func updateMoney(numTiles: Int){
        money = money + numTiles
    }
    
    func purchaseBackground(back: String){
        if(self.money >= self.backPrice){
            money = money - backPrice
            self.ownedBackgrounds += [back]
        }
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
    func purchaseTees(shirt: String){
        if(self.money >= self.teesPrice){
            money = money - teesPrice
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
    
    func purchasePet(pet: String){
        if(self.money >= self.petPrice){
            money = money - petPrice
            self.ownedPets += [pet]
        }
    }
    
    
}
