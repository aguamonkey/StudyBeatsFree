//
//  fearSettings.swift
//  Awaken Me
//
//  Created by Gobias LTD on 07/08/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import Foundation
import Combine

class hiphopSettings: ObservableObject {
    @Published var songTitleOne: String {
        didSet {
            UserDefaults.standard.set(songTitleOne, forKey: "songTitleOne")
        }
    }
    
    @Published var songLyricsOne: String {
        didSet {
            UserDefaults.standard.set(songLyricsOne, forKey: "songLyricsOne")
        }
    }
    
    @Published var fearThree: String {
        didSet {
            UserDefaults.standard.set(fearThree, forKey: "fearThree")
        }
    }
    
    
    @Published var fearFour: String {
        didSet {
            UserDefaults.standard.set(fearFour, forKey: "fearFour")
        }
    }
    
    @Published var fearFive: String {
        didSet {
            UserDefaults.standard.set(fearFive, forKey: "fearFive")
        }
    }
    
    @Published var fearSix: String {
        didSet {
            UserDefaults.standard.set(fearSix, forKey: "fearSix")
        }
    }
    
    @Published var fearSeven: String {
        didSet {
            UserDefaults.standard.set(fearSeven, forKey: "fearSeven")
        }
    }
    
    
    @Published var fearEight: String {
        didSet {
            UserDefaults.standard.set(fearEight, forKey: "fearEight")
        }
    }
    
    @Published var fearNine: String {
        didSet {
            UserDefaults.standard.set(fearNine, forKey: "fearNine")
        }
    }
    
    @Published var fearTen: String {
        didSet {
            UserDefaults.standard.set(fearTen, forKey: "fearTen")
        }
    }
    
    @Published var fearEleven: String {
        didSet {
            UserDefaults.standard.set(fearEleven, forKey: "fearEleven")
        }
    }
    
    
    @Published var fearTwelve: String {
        didSet {
            UserDefaults.standard.set(fearTwelve, forKey: "fearTwelve")
        }
    }
    
    @Published var fearThirteen: String {
        didSet {
            UserDefaults.standard.set(fearThirteen, forKey: "fearThirteen")
        }
    }
    
    @Published var fearFourteen: String {
        didSet {
            UserDefaults.standard.set(fearFourteen, forKey: "fearFourteen")
        }
    }
    
    @Published var fearFifteen: String {
        didSet {
            UserDefaults.standard.set(fearFifteen, forKey: "fearFifteen")
        }
    }
    
    @Published var fearSixteen: String {
        didSet {
            UserDefaults.standard.set(fearSixteen, forKey: "fearSixteen")
        }
    }
    
    
    @Published var fearSeventeen: String {
        didSet {
            UserDefaults.standard.set(fearSeventeen, forKey: "fearSeventeen")
        }
    }
    
    @Published var fearEighteen: String {
        didSet {
            UserDefaults.standard.set(fearEighteen, forKey: "fearEighteen")
        }
    }
    
    @Published var fearNineteen: String {
        didSet {
            UserDefaults.standard.set(fearNineteen, forKey: "fearNineteen")
        }
    }
    
    @Published var fearTwenty: String {
        didSet {
            UserDefaults.standard.set(fearTwenty, forKey: "fearTwenty")
        }
    }
    
    init() {
        self.songTitleOne = UserDefaults.standard.object(forKey: "songTitleOne") as? String ?? ""
        self.songLyricsOne = UserDefaults.standard.object(forKey: "songLyricsOne") as? String ?? ""
        self.fearThree = UserDefaults.standard.object(forKey: "fearThree") as? String ?? ""
        self.fearFour = UserDefaults.standard.object(forKey: "fearFour") as? String ?? ""
        self.fearFive = UserDefaults.standard.object(forKey: "fearFive") as? String ?? ""
        self.fearSix = UserDefaults.standard.object(forKey: "fearSix") as? String ?? ""
        self.fearSeven = UserDefaults.standard.object(forKey: "fearSeven") as? String ?? ""
        self.fearEight = UserDefaults.standard.object(forKey: "fearEight") as? String ?? ""
        self.fearNine = UserDefaults.standard.object(forKey: "fearNine") as? String ?? ""
        self.fearTen = UserDefaults.standard.object(forKey: "fearTen") as? String ?? ""
        self.fearEleven = UserDefaults.standard.object(forKey: "fearEleven") as? String ?? ""
        self.fearTwelve = UserDefaults.standard.object(forKey: "fearTwelve") as? String ?? ""
        self.fearThirteen = UserDefaults.standard.object(forKey: "fearThirteen") as? String ?? ""
        self.fearFourteen = UserDefaults.standard.object(forKey: "fearFourteen") as? String ?? ""
        self.fearFifteen = UserDefaults.standard.object(forKey: "fearFifteen") as? String ?? ""
        self.fearSixteen = UserDefaults.standard.object(forKey: "fearSixteen") as? String ?? ""
        self.fearSeventeen = UserDefaults.standard.object(forKey: "fearSeventeen") as? String ?? ""
        self.fearEighteen = UserDefaults.standard.object(forKey: "fearEighteen") as? String ?? ""
        self.fearNineteen = UserDefaults.standard.object(forKey: "fearNineteen") as? String ?? ""
        self.fearTwenty = UserDefaults.standard.object(forKey: "fearTwenty") as? String ?? ""


    }
}
