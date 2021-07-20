//
//  griefSettings.swift
//  Awaken Me
//
//  Created by Gobias LTD on 07/08/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import Foundation
import Combine

class rockSettings: ObservableObject {
    @Published var songTitleRockOne: String {
        didSet {
            UserDefaults.standard.set(songTitleRockOne, forKey: "songTitleRockOne")
        }
    }
    
    @Published var songLyricsRockOne: String {
        didSet {
            UserDefaults.standard.set(songLyricsRockOne, forKey: "songLyricsRockOne")
        }
    }
    
    @Published var griefThree: String {
        didSet {
            UserDefaults.standard.set(griefThree, forKey: "griefThree")
        }
    }
    
    
    @Published var griefFour: String {
        didSet {
            UserDefaults.standard.set(griefFour, forKey: "griefFour")
        }
    }
    
    @Published var griefFive: String {
        didSet {
            UserDefaults.standard.set(griefFive, forKey: "griefFive")
        }
    }
    
    @Published var griefSix: String {
        didSet {
            UserDefaults.standard.set(griefSix, forKey: "griefSix")
        }
    }
    
    @Published var griefSeven: String {
        didSet {
            UserDefaults.standard.set(griefSeven, forKey: "griefSeven")
        }
    }
    
    
    @Published var griefEight: String {
        didSet {
            UserDefaults.standard.set(griefEight, forKey: "griefEight")
        }
    }
    
    @Published var griefNine: String {
        didSet {
            UserDefaults.standard.set(griefNine, forKey: "griefNine")
        }
    }
    
 

    
    init() {
        self.songTitleRockOne = UserDefaults.standard.object(forKey: "songTitleRockOne") as? String ?? ""
        self.songLyricsRockOne = UserDefaults.standard.object(forKey: "songLyricsRockOne") as? String ?? ""
        self.griefThree = UserDefaults.standard.object(forKey: "griefThree") as? String ?? ""
        self.griefFour = UserDefaults.standard.object(forKey: "griefFour") as? String ?? ""
        self.griefFive = UserDefaults.standard.object(forKey: "griefFive") as? String ?? ""
        self.griefSix = UserDefaults.standard.object(forKey: "griefSix") as? String ?? ""
        self.griefSeven = UserDefaults.standard.object(forKey: "griefSeven") as? String ?? ""
        self.griefEight = UserDefaults.standard.object(forKey: "griefEight") as? String ?? ""
        self.griefNine = UserDefaults.standard.object(forKey: "griefNine") as? String ?? ""
   


    }
}
