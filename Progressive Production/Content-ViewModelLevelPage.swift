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
        
        @Published var newColumns : [GridItem] = [GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil), GridItem(.fixed(50), spacing: 0, alignment: nil)]
        
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
        
        @AppStorage("NEW_TILE_COLOR") var storedNewTileColor : String = "coinTile10,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,coinTile5,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile10,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile15,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile20,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile25,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile25,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile25,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile25,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile25,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile25,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile25,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile25,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile25,emptyTile,emptyTile,coinTile50,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile50,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile50,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile50,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile50,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,emptyTile,coinTile100"

        
        var newTileColor: [String]{
            get{
                return storedNewTileColor.components(separatedBy: ",")
            }
            set{
                storedNewTileColor = newValue.joined(separator: ",")
            }
        }
        
        
        var extraTileColor: [String]{
            get{
                return storedExtraTileColor.components(separatedBy: ",")
            }
            set{
                storedExtraTileColor = newValue.joined(separator: ",")
            }
        }
        
        
        
        @AppStorage("NUM_EXTRA_TILES_ADDED1") var extraTilesAdded:Int = 0
        @AppStorage("TOTAL_TILES_ADDED1") var totalTilesAdded:Int = 0
        
        @AppStorage("MINS_WORKED1") var minsWorked: Int = 0
        @AppStorage("MINS_WORKED_TODAY1") var todayMinsWorked: Int = 0
        @AppStorage("HOURS_WORKED_STRING1") var hoursWorkedString: String = "0hrs 0mins"
        @AppStorage("TODAY_WORKED_STRING11") var todayWorkedString: String = "0hrs 0mins"
        
        
        
        
        @AppStorage("ROUNDS_COMPLETED") var roundsCompleted: Int = 0
        @AppStorage("ROUNDS_GOAL") var roundsGoal: Int = 2
        @AppStorage("TIME_GOAL") var timeGoal: Int = 1
        @AppStorage("STREAK_GOAL") var streakGoal: Int = 2
        @AppStorage("ANIMATE_ROUNDS") var isAnimatingRound: Bool = false
        @AppStorage("ANIMATE_IME") var isAnimatingTime: Bool = false
        @AppStorage("ANIMATE_STREAK") var isAnimatingStreak: Bool = false
        @AppStorage("ANIMATE_DAILY_TIME") var isAnimatingDailyTime: Bool = false
        @AppStorage("ANIMATE_PAUSING") var isAnimatingPause: Bool = false
        @AppStorage("CURRENT_STREAK") var currentStreak: Int = 0
        @AppStorage("MAX_STREAK") var maxStreak: Int = 0
        @AppStorage("LAST_DATE") var lastWorkDate: String = ""
        @AppStorage("CURRENT_DATE") var currWorkDate: String = ""
        @AppStorage("YESTERDAY_DATE") var yesterdayDate: String = ""
        @AppStorage("DAILY_HOUR_GOAL") var dailyHourGoal: Int = 1
        @AppStorage("ROUNDS_TODAY_COMPLETED") var roundsToday: Int = 0
        @AppStorage("WORKED_TODAY") var workedToday: Bool = false
        @AppStorage("FIRST_TIME_STREAK") var firstTimeStreak: Bool = true
        @AppStorage("INCREASING_THE_LEVEL") var increasingLevel: Bool = false
        @AppStorage("REACHED_ROUNDS_GOAL") var todayRoundGoalMet: Bool = false
        @AppStorage("REACHED_HOUR_GOAL") var todayHourGoalMet: Bool = false
        @AppStorage("NO_PAUSES") var noPauses: Int = 0
        @AppStorage("NO_PAUSES_GOAL") var noPauseGoal: Int = 1
        @AppStorage("MAX_TODAY_WORKED") var todayWorkedRecord: Int = 0
        @AppStorage("MAX_TODAY_WORKED_STRING") var todayWorkedRecordString: String = "0hrs 0mins"
        @AppStorage("MAX_TODAY_WORKED_DATE") var todayWorkedRecordDate: String = "N/A"

        
        
        func updateStreak(){
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "MM-dd-yyyy"
            if let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) {
                self.yesterdayDate = dateFormatter.string(from: yesterdayDate)
            } else {
                print("date failure")
            }
            currWorkDate = dateFormatter.string(from: currentDate)
            
            if lastWorkDate == currWorkDate{
                workedToday = true
            } else{
                workedToday = false
            }
            
            //We only want to update this value if it is our first time working today
            if !workedToday{
                if lastWorkDate.isEmpty || yesterdayDate != lastWorkDate {
                    print("We lost the streak")
                    if firstTimeStreak{
                        print("First time streak")
                        maxStreak = 1
                        firstTimeStreak = false
                    }
                    currentStreak = 1
                } else {
                    print("We kept the streak!")
                    currentStreak += 1
                    if currentStreak >= maxStreak {
                        maxStreak = currentStreak
                    }
                }
                
                lastWorkDate = currWorkDate
                if lastWorkDate == currWorkDate{
                    workedToday = true
                } else{
                    workedToday = false
                }
            } else{
                print("We already worked today!")
            }
        }
        
        
        
        func incHoursWorked(worked: Int){
            minsWorked = minsWorked + worked
            print("**INCHOURSWORKED CALLED**")
            let hoursWorked = minsWorked/60
            let extraMinsWorked = minsWorked - hoursWorked*60
            hoursWorkedString = "\(hoursWorked)hrs \(extraMinsWorked)mins"
            roundsCompleted += 1
            updateStreak()
            if !workedToday{
                todayMinsWorked = worked
                roundsToday = 1
                let todayHoursWorked = todayMinsWorked/60
                let todayExtraMinsWorked = todayMinsWorked - todayHoursWorked*60
                todayWorkedString = "\(todayHoursWorked)hrs \(todayExtraMinsWorked)mins"
            } else {
                todayMinsWorked += worked
                roundsToday += 1
                let todayHoursWorked = todayMinsWorked/60
                let todayExtraMinsWorked = todayMinsWorked - todayHoursWorked*60
                todayWorkedString = "\(todayHoursWorked)hrs \(todayExtraMinsWorked)mins"
            }
            
            if todayMinsWorked > todayWorkedRecord{
                todayWorkedRecord = todayMinsWorked
                let recordHours = todayWorkedRecord/60
                let recordExMins = todayWorkedRecord % 60
                todayWorkedRecordString = "\(recordHours)hrs \(recordExMins)mins"
                let currentDate = Date()
                let dateFormatter = DateFormatter()
                
                dateFormatter.dateFormat = "MM-dd-yyyy"
                todayWorkedRecordDate = dateFormatter.string(from: currentDate)
                
            }
            
        }
        
        func resetTodayStats(){
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "MM-dd-yyyy"
            let currDate = dateFormatter.string(from: currentDate)
            
            if let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date()) {
                self.yesterdayDate = dateFormatter.string(from: yesterdayDate)
            } else {
                print("date failure")
            }
            
            if lastWorkDate != currDate {
                workedToday = false
                todayWorkedString = "0hrs 0mins"
                todayMinsWorked = 0
                dailyHourGoal = 1
                roundsGoal = 1
                roundsToday = 0
                todayRoundGoalMet = false
                todayHourGoalMet = false
            }
            
            if !workedToday && lastWorkDate != yesterdayDate{
                currentStreak = 0
                print("Hitting this")
            }
            
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
                //totalTilesAdded = totalTilesAdded + 1
                self.tileColor[currTilesAdded - 1 ] = color
            } else {
                if(extraTilesAdded < 900){
                    extraTilesAdded = extraTilesAdded + 1
                    self.extraTileColor[extraTilesAdded - 1] = color
                }
                //totalTilesAdded = totalTilesAdded + 1
                
            }
            if(currTilesAdded == numTiles){
                completed = true
                
            }
            
            
        }
        
        func newUpdateLevel(color: String){
            
            totalTilesAdded = totalTilesAdded + 1
            if totalTilesAdded <= 6000{
                newTileColor[totalTilesAdded - 1] = color
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
        
        
        
        func putCoinTile(index: Int) -> Bool {
            if index == 0 {
                return true
            } else if index <= 50{
                return index % 4 == 0
            } else if index > 50 && index <= 250{
                return index % 9 == 0
            } else if index > 250 && index <= 500 {
                return index % 13 == 0
            } else if index > 500 && index <= 750 {
                return index % 16 == 0
            }  else if index > 750 && index <= 900 {
                return index % 18 == 0
            } else if index > 900 && index <= 1000 {
                return index % 21 == 0
            } else if index > 1000 && index <= 6000{
                return index % 24 == 0
            }
            
            return false
        }
        
        
        
        func newUpdateMoney() -> Int{
            if totalTilesAdded == 1 {
                return 100
            } else if totalTilesAdded <= 50 && totalTilesAdded % 4 == 0{
                return 50
            } else if totalTilesAdded > 50 && totalTilesAdded <= 250 && totalTilesAdded % 9 == 0{
                return 100
            } else if totalTilesAdded > 250 && totalTilesAdded <= 500 && totalTilesAdded % 13 == 0{
                return 150
            } else if totalTilesAdded > 500 && totalTilesAdded <= 750 && totalTilesAdded % 16 == 0{
                return 200
            }  else if totalTilesAdded > 750 && totalTilesAdded <= 900 && totalTilesAdded % 18 == 0{
                return 250
            } else if totalTilesAdded > 900 && totalTilesAdded <= 1000 && totalTilesAdded % 21 == 0{
                return 500
            } else if totalTilesAdded > 1000 && totalTilesAdded <= 6000 && totalTilesAdded % 24 == 0{
                return 1000
            }
            
            return 0
        }
        
        func setUpNewGrid() -> some View{
            
            LazyVGrid(columns: self.newColumns, spacing: 0){
                ForEach(0..<self.newTileColor.count, id: \.self){ index in
                        Image(self.newTileColor[index]).resizable().frame(width: 50, height: 50)
                }
            }
        }
        
        
        func updateRoundsGoal(){
            if self.roundsToday >= roundsGoal{
                if self.roundsGoal == 1{
                    self.roundsGoal = 2
                } else if self.roundsGoal == 2{
                    self.roundsGoal = 3
                } else if self.roundsGoal == 3{
                    self.roundsGoal = 4
                } else if self.roundsGoal == 4{
                    self.roundsGoal = 5
                } else if self.roundsGoal == 5{ //CHANGE BACK
                    self.roundsGoal = 8
                } else if self.roundsGoal == 8{
                    self.roundsGoal = 10
                } else if self.roundsGoal == 10{
                    self.roundsGoal = 12
                } else if self.roundsGoal == 12{
                    self.roundsGoal = 20
                } else if self.roundsGoal == 20{
                    self.todayRoundGoalMet = true
                }
            }
        }
        
        func updateNoPauseGoal(){
            if self.noPauses >= noPauseGoal{
                if self.noPauseGoal == 1{
                    self.noPauseGoal = 2
                } else if self.noPauseGoal == 2{
                    self.noPauseGoal = 3
                } else if self.noPauseGoal == 3{
                    self.noPauseGoal = 4
                } else if self.noPauseGoal == 4{
                    self.noPauseGoal = 5
                } else if self.noPauseGoal == 5{
                    self.noPauseGoal = 8
                } else if self.noPauseGoal == 8{
                    self.noPauseGoal = 10
                } else if self.noPauseGoal == 10{
                    self.noPauseGoal = 12
                } else if self.noPauseGoal == 12{
                    self.noPauseGoal = 20
                } else if self.noPauseGoal == 20{
                    self.noPauseGoal = 50
                } else if self.noPauseGoal == 50{
                    self.noPauseGoal = 100
                } else if self.noPauseGoal == 100{
                    self.noPauseGoal = 250
                }
            }
        }
        
        func updateDailyHourGoal(){
            if self.todayMinsWorked/60 >= self.dailyHourGoal{
                if self.dailyHourGoal == 1{
                    self.dailyHourGoal = 2
                } else if self.dailyHourGoal == 2{
                    self.dailyHourGoal = 3
                } else if self.dailyHourGoal == 3{
                    self.dailyHourGoal = 4
                } else if self.dailyHourGoal == 4{
                    self.dailyHourGoal = 5
                } else if self.dailyHourGoal == 5{
                    self.dailyHourGoal = 6
                } else if self.dailyHourGoal == 6{
                    self.dailyHourGoal = 7
                } else if self.dailyHourGoal == 7{
                    self.dailyHourGoal = 8
                } else if self.dailyHourGoal == 8{
                    self.todayHourGoalMet = true
                }
            }
        }
        
        func updateTimeGoal(){
            if self.minsWorked/60 >= self.timeGoal{
                if self.timeGoal == 1{
                    self.timeGoal = 2
                }else if self.timeGoal == 2{
                    self.timeGoal = 3
                }else if self.timeGoal == 3{
                    self.timeGoal = 5
                }else if self.timeGoal == 5{
                    self.timeGoal = 10
                }else if self.timeGoal == 10{
                    self.timeGoal = 15
                }else if self.timeGoal == 15{
                    self.timeGoal = 25
                }else if self.timeGoal == 25{
                    self.timeGoal = 50
                }else if self.timeGoal == 50{
                    self.timeGoal = 75
                }else if self.timeGoal == 75{
                    self.timeGoal = 100
                }else if self.timeGoal == 100{
                    self.timeGoal = 200
                }else if self.timeGoal == 200{
                    self.timeGoal = 500
                }else if self.timeGoal == 500{
                    self.timeGoal = 750
                }else if self.timeGoal == 750{
                    self.timeGoal = 1000
                }else if self.timeGoal == 1000{
                    self.timeGoal = 10000
                }
            }
        }
        //NEED TO ADD THE LOGIC THAT GIVES COINS FOR COMPLETING THE CHALLENGES!!!!!
        
        //Also need to add a cap so that once you complete the last part of a challenge the the logic doesn't keep going,
        //should just be a simple if statement,
        func roundChallenges() -> some View{
            
            
            VStack{
                VStack(spacing:0){
                            HStack{
                                Spacer()
                                if self.roundsCompleted >= roundsGoal{
                                    
                                    Button{
                                        self.updateRoundsGoal()
                                    }label:{
                                        Spacer()
                                        Text("Complete " + String(self.roundsGoal) + " rounds of work").font(.custom("Jersey15-Regular", size: 20)).foregroundColor(.green).opacity(self.isAnimatingRound ? 1 : 0)
                                            .onAppear {
                                                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                                    self.isAnimatingRound.toggle()
                                                }
                                            }
                                        Spacer()
                                        Text(String(self.roundsCompleted) + "/" + String(self.roundsGoal)).font(.custom("Jersey15-Regular", size: 20)).foregroundStyle(.black)
                                        Spacer()
                                    }.multilineTextAlignment(.center)
                                } else {
                                    
                                    Text("Complete " + String(self.roundsGoal) + " rounds of work").font(.custom("Jersey15-Regular", size: 20))
                                    Spacer()
                                    Text(String(self.roundsCompleted) + "/" + String(self.roundsGoal)).font(.custom("Jersey15-Regular", size: 20))
                                    Spacer()
                                }
                            }
                    
                }
                ZStack(alignment: .leading){
                    
                    Rectangle().frame(width: 300, height: 20).foregroundStyle(.black).opacity(0.1)
                    if self.roundsCompleted/self.roundsGoal >= 1  {
                        Rectangle().frame(width: 300, height: 20).foregroundStyle(.green).opacity(0.8)
                    } else {
                        
                        Rectangle().frame(width: CGFloat(((CGFloat(self.roundsCompleted)/CGFloat(self.roundsGoal))) * 300), height: 20).foregroundStyle(.green).opacity(0.8)
                        
                    }
                }
            }
        }
        
        
        func timeChallenges() -> some View{
            
            
            VStack{
                VStack(spacing:0){
                            HStack{
                                Spacer()
                                if self.minsWorked/60 >= self.timeGoal{
                                    
                                    Button{
                                        self.updateTimeGoal()
                                    }label:{
                                        Spacer()
                                        Text("Complete " + String(self.timeGoal) + " hours of work").font(.custom("Jersey15-Regular", size: 20)).foregroundColor(.green).opacity(self.isAnimatingTime ? 1 : 0)
                                            .onAppear {
                                                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                                    self.isAnimatingTime.toggle()
                                                }
                                            }
                                        Spacer()
                                        Text(String(self.minsWorked/60) + "/" + String(self.timeGoal)).font(.custom("Jersey15-Regular", size: 20)).foregroundStyle(.black)
                                        Spacer()
                                    }.multilineTextAlignment(.center)
                                } else {
                                    
                                    Text("Complete " + String(self.timeGoal) + " hours of work").font(.custom("Jersey15-Regular", size: 20))
                                    Spacer()
                                    Text(String(self.minsWorked/60) + "/" + String(self.timeGoal)).font(.custom("Jersey15-Regular", size: 20))
                                    Spacer()
                                }
                            }
                    
                }
                ZStack(alignment: .leading){
                    
                    Rectangle().frame(width: 300, height: 20).foregroundStyle(.black).opacity(0.1)
                    if (self.minsWorked/60)/self.timeGoal >= 1  {
                        Rectangle().frame(width: 300, height: 20).foregroundStyle(.green).opacity(0.8)
                    } else {
                        
                        Rectangle().frame(width: CGFloat(((CGFloat(self.minsWorked)/CGFloat(self.timeGoal*60))) * 300), height: 20).foregroundStyle(.green).opacity(0.8)
                        
                    }
                }
            }
        }
        
        func updateStreakGoal(){
            if self.maxStreak >= self.streakGoal{
                if self.streakGoal == 2{
                    self.streakGoal =  3
                }else if self.streakGoal == 3{
                    self.streakGoal =  5
                }else if self.streakGoal == 5{
                    self.streakGoal =  7
                }else if self.streakGoal == 7{
                    self.streakGoal =  10
                }else if self.streakGoal == 10{
                    self.streakGoal =  15
                }else if self.streakGoal == 15{
                    self.streakGoal =  20
                }else if self.streakGoal == 20{
                    self.streakGoal =  30
                }else if self.streakGoal == 30{
                    self.streakGoal =  50
                }else if self.streakGoal == 50{
                    self.streakGoal =  75
                }else if self.streakGoal == 75{
                    self.streakGoal =  100
                }else if self.streakGoal == 100{
                    self.streakGoal =  365
                }
            }
        }
            
        
        func streakChallenges() -> some View{
            
            
            VStack{
                VStack(spacing:0){
                            HStack{
                                Spacer()
                                if self.maxStreak >= self.streakGoal{
                                    
                                    Button{
                                        self.updateStreakGoal()
                                    }label:{
                                        Spacer()
                                        Text("Get a streak of " + String(self.streakGoal) + " days").font(.custom("Jersey15-Regular", size: 20)).foregroundColor(.green).opacity(self.isAnimatingStreak ? 1 : 0)
                                            .onAppear {
                                                withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                                    self.isAnimatingStreak.toggle()
                                                }
                                            }
                                        Spacer()
                                        Text(String(self.maxStreak) + "/" + String(self.streakGoal)).font(.custom("Jersey15-Regular", size: 20)).foregroundStyle(.black)
                                        Spacer()
                                    }.multilineTextAlignment(.center)
                                } else {
                                    
                                    Text("Get a streak of " + String(self.streakGoal) + " days").font(.custom("Jersey15-Regular", size: 20))
                                    Spacer()
                                    Text(String(self.maxStreak) + "/" + String(self.streakGoal)).font(.custom("Jersey15-Regular", size: 20))
                                    Spacer()
                                }
                            }
                    
                }
                ZStack(alignment: .leading){
                    
                    Rectangle().frame(width: 300, height: 20).foregroundStyle(.black).opacity(0.1)
                    if (self.maxStreak)/self.streakGoal >= 1  {
                        Rectangle().frame(width: 300, height: 20).foregroundStyle(.green).opacity(0.8)
                        
                    } else {
                        
                        Rectangle().frame(width: CGFloat(((CGFloat(self.maxStreak)/CGFloat(self.streakGoal))) * 300), height: 20).foregroundStyle(.green).opacity(0.8)
                        
                    }
                }
            }
        }
        
       
    }
    
    

