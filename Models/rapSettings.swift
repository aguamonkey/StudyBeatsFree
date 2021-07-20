//
//  judgeSettings.swift
//  Awaken Me
//
//  Created by Gobias LTD on 07/08/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import Foundation
import Combine

class rapSettings: ObservableObject {
    @Published var songTitleRapOne: String {
        didSet {
            UserDefaults.standard.set(songTitleRapOne, forKey: "songTitleRapOne")
        }
    }
    
    @Published var songLyricsRapOne: String {
        didSet {
            UserDefaults.standard.set(songLyricsRapOne, forKey: "songLyricsRapOne")
        }
    }
    
    @Published var judgeThree: Int16 {
        didSet {
            UserDefaults.standard.set(judgeThree, forKey: "judgeThree")
        }
    }
    
    
    @Published var judgeFour: String {
        didSet {
            UserDefaults.standard.set(judgeFour, forKey: "judgeFour")
        }
    }
    
    @Published var judgeFive: String {
        didSet {
            UserDefaults.standard.set(judgeFive, forKey: "judgeFive")
        }
    }
    
    @Published var judgeSix: String {
        didSet {
            UserDefaults.standard.set(judgeSix, forKey: "judgeSix")
        }
    }
    
    @Published var judgeSeven: String {
        didSet {
            UserDefaults.standard.set(judgeSeven, forKey: "judgeSeven")
        }
    }
    
    
    @Published var judgeEight: String {
        didSet {
            UserDefaults.standard.set(judgeEight, forKey: "judgeEight")
        }
    }
    
    @Published var judgeNine: String {
        didSet {
            UserDefaults.standard.set(judgeNine, forKey: "judgeNine")
        }
    }
    
    @Published var judgeTen: String {
        didSet {
            UserDefaults.standard.set(judgeTen, forKey: "judgeTen")
        }
    }
    
    init() {
        self.songTitleRapOne = UserDefaults.standard.object(forKey: "songTitleRapOne") as? String ?? ""
        self.songLyricsRapOne = UserDefaults.standard.object(forKey: "songLyricsRapOne") as? String ?? ""
        self.judgeThree = UserDefaults.standard.object(forKey: "judgeThree") as? Int16 ?? 0
        self.judgeFour = UserDefaults.standard.object(forKey: "judgeFour") as? String ?? ""
        self.judgeFive = UserDefaults.standard.object(forKey: "judgeFive") as? String ?? ""
        self.judgeSix = UserDefaults.standard.object(forKey: "judgeSix") as? String ?? ""
        self.judgeSeven = UserDefaults.standard.object(forKey: "judgeSeven") as? String ?? ""
        self.judgeEight = UserDefaults.standard.object(forKey: "judgeEight") as? String ?? ""
        self.judgeNine = UserDefaults.standard.object(forKey: "judgeNine") as? String ?? ""
        self.judgeTen = UserDefaults.standard.object(forKey: "judgeTen") as? String ?? ""



    }
}
