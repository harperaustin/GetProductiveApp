//
//  Content-ViewModelLevelPage.swift
//  Progressive Production
//
//  Created by Harper Austin on 3/21/24.
//

import Foundation
import SwiftUI
    
    final class ProgPageHelp: ObservableObject {
        @AppStorage("MY_LEVEL") var level = 1
        
        @Published var columns : [GridItem] = [GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil)]
        
        @AppStorage("NUM_OF_TILES") var numTiles: Int = 4
        
        //@Published var tileColor: [String] = []
        
        
        @AppStorage("TILE_COLOR") var storedTileColor: String = ""
        
        var tileColor: [String] {
            get{
                return storedTileColor.components(separatedBy: ",")
            }
            set{
                storedTileColor = newValue.joined(separator: ",")
            }
        }
        
        
        @AppStorage("CURR_TILES_ADDED") var currTilesAdded: Int = 0
        @AppStorage("MY_COMPLETED") var completed: Bool = false
        
        
        @AppStorage("EXTRA_TILE_COLOR") var storedExtraTileColor : String = Array(repeating: "emptyTile", count: 1000).joined(separator: ",")
        
        var extraTileColor: [String]{
            get{
                return storedExtraTileColor.components(separatedBy: ",")
            }
            set{
                storedExtraTileColor = newValue.joined(separator: ",")
            }
        }
        
        
        
        @AppStorage("NUM_EXTRA_TILES_ADDED") var extraTilesAdded:Int = 0
        @AppStorage("TOTAL_TILES_ADDED") var totalTilesAdded:Int = 0
        
        @AppStorage("HOURS_WORKED") var minsWorked: Int = 0
        @AppStorage("HOURS_WORKED_STRING") var hoursWorkedString: String = "0hrs 0mins"
        
        
        func incHoursWorked(worked: Int){
            minsWorked = minsWorked + worked
            let hoursWorked = minsWorked/60
            let extraMinsWorked = minsWorked - hoursWorked*60
            hoursWorkedString = "\(hoursWorked)hrs \(extraMinsWorked)mins"
        }
        
        func setCols(){
            if(level < 4){
                columns = [GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil)]
            } else if(level >= 4 && level < 7){
                columns = [GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil)]
            } else if(level >= 7 && level < 10){
                columns = [GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil)]
            } else if(level >= 10 && level < 13){
                columns = [GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil)]
            }
            else if(level >= 13){
                columns = [GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil)]
            }
            
        }
        
        
        
        func setEmptyTileColors(){
            
            var newColors : [String] = []
            for index in 0..<self.numTiles{
                newColors = newColors + [extraTileColor[index]]
                
            }
            
            tileColor = newColors
        }
        
        func updateLevel(color: String){
            
            if(currTilesAdded == 0){
                setEmptyTileColors()
            }
            
            if(completed == false){
                currTilesAdded = currTilesAdded + 1
                totalTilesAdded = totalTilesAdded + 1
                self.tileColor[currTilesAdded - 1 ] = color
            } else {
                if(extraTilesAdded < 900){
                    extraTilesAdded = extraTilesAdded + 1
                    self.extraTileColor[extraTilesAdded - 1] = color
                }
                totalTilesAdded = totalTilesAdded + 1
                
            }
            if(currTilesAdded == numTiles){
                completed = true
                
            }
            
            
        }
        
        func nextLevel(){
            completed = false
            if(level < 3){
                numTiles += 2
            } else if (level == 3) {
                numTiles = 9
            } else if (level > 3 && level < 6){
                numTiles += 3
            } else if (level == 6){
                numTiles = 16
            } else if(level > 6 && level < 9){
                numTiles += 4
            } else if (level == 9){
                numTiles = 25
            } else if (level > 9 && level < 12){
                numTiles += 5
            } else if (level == 12){
                numTiles = 36
            } else if (level > 12){
                numTiles += 6
            }
            
            setEmptyTileColors()
            level = level + 1
            setCols()
            if(extraTilesAdded > currTilesAdded){
                extraTilesAdded = extraTilesAdded - currTilesAdded
            } else{
                extraTilesAdded = 0
            }
            currTilesAdded = 0
            for index in 0..<self.numTiles{
                if(extraTileColor[index] != "emptyTile"){
                    currTilesAdded = currTilesAdded + 1
                    if(currTilesAdded == numTiles){
                        completed = true
                    }
                }
                
            }
            for index in self.numTiles..<extraTileColor.count - self.numTiles{
                extraTileColor[index - numTiles] = extraTileColor[index]
                extraTileColor[index] = extraTileColor[index + numTiles]
                
            }
            
        }
        
        
        func setUpGrid() -> some View{
            LazyVGrid(columns: self.columns, spacing: 0) {
            ForEach(0..<self.numTiles, id: \.self){ index in
                if(self.totalTilesAdded == 0){
                    Image("emptyTile").resizable().frame(height: 50)
                } else{
                Image(self.tileColor[index]).resizable().frame(height: 50)
                    }
                }
            
            }
        }
        
       
    }
    
    

