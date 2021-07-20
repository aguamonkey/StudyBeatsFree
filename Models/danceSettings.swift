//
//  danceSettings.swift
//  StudyBeatsFree
//
//  Created by Joshua Browne on 03/04/2021.
//

//
//  illusionSettings.swift
//  Awaken Me
//
//  Created by Gobias LTD on 07/08/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//


import Foundation
import Combine

class danceSettings: ObservableObject {
    @Published var songTitleDanceOne: String {
        didSet {
            UserDefaults.standard.set(songTitleDanceOne, forKey: "songTitleDanceOne")
        }
    }
    
    @Published var songLyricsDanceOne: String {
        didSet {
            UserDefaults.standard.set(songLyricsDanceOne, forKey: "songLyricsDanceOne")
        }
    }
    
    @Published var illusionThree: String {
        didSet {
            UserDefaults.standard.set(illusionThree, forKey: "illusionThree")
        }
    }
    
    
    @Published var illusionFour: String {
        didSet {
            UserDefaults.standard.set(illusionFour, forKey: "illusionFour")
        }
    }
    
    @Published var illusionFive: String {
        didSet {
            UserDefaults.standard.set(illusionFive, forKey: "illusionFive")
        }
    }
    
    @Published var illusionSix: String {
        didSet {
            UserDefaults.standard.set(illusionSix, forKey: "illusionSix")
        }
    }
    
    @Published var illusionSeven: String {
        didSet {
            UserDefaults.standard.set(illusionSeven, forKey: "illusionSeven")
        }
    }
    
    
    @Published var illusionEight: String {
        didSet {
            UserDefaults.standard.set(illusionEight, forKey: "illusionEight")
        }
    }
    
    @Published var illusionNine: String {
        didSet {
            UserDefaults.standard.set(illusionNine, forKey: "illusionNine")
        }
    }
    
    @Published var illusionTen: String {
        didSet {
            UserDefaults.standard.set(illusionTen, forKey: "illusionTen")
        }
    }
    
    @Published var illusionEleven: String {
        didSet {
            UserDefaults.standard.set(illusionEleven, forKey: "illusionEleven")
        }
    }
    
    
    @Published var illusionTwelve: String {
        didSet {
            UserDefaults.standard.set(illusionTwelve, forKey: "illusionTwelve")
        }
    }
    
    @Published var illusionThirteen: String {
        didSet {
            UserDefaults.standard.set(illusionThirteen, forKey: "illusionThirteen")
        }
    }
    
    @Published var illusionFourteen: String {
        didSet {
            UserDefaults.standard.set(illusionFourteen, forKey: "illusionFourteen")
        }
    }
    
    @Published var illusionFifteen: String {
        didSet {
            UserDefaults.standard.set(illusionFifteen, forKey: "illusionFifteen")
        }
    }
    
    @Published var illusionSixteen: String {
        didSet {
            UserDefaults.standard.set(illusionSixteen, forKey: "illusionSixteen")
        }
    }
    
    
    @Published var illusionSeventeen: String {
        didSet {
            UserDefaults.standard.set(illusionSeventeen, forKey: "illusionSeventeen")
        }
    }
    
    @Published var illusionEighteen: String {
        didSet {
            UserDefaults.standard.set(illusionEighteen, forKey: "illusionEighteen")
        }
    }
    
    @Published var illusionNineteen: String {
        didSet {
            UserDefaults.standard.set(illusionNineteen, forKey: "illusionNineteen")
        }
    }
    
    @Published var illusionTwenty: String {
        didSet {
            UserDefaults.standard.set(illusionTwenty, forKey: "illusionTwenty")
        }
    }
    
    @Published var illusionTwentyOne: String {
        didSet {
            UserDefaults.standard.set(illusionTwentyOne, forKey: "illusionTwentyOne")
        }
    }
    
    @Published var illusionTwentyTwo: String {
        didSet {
            UserDefaults.standard.set(illusionTwentyTwo, forKey: "illusionTwentyTwo")
        }
    }
    
    @Published var illusionTwentyThree: String {
        didSet {
            UserDefaults.standard.set(illusionTwentyThree, forKey: "illusionTwentyThree")
        }
    }
    
    
    @Published var illusionTwentyFour: String {
        didSet {
            UserDefaults.standard.set(illusionTwentyFour, forKey: "illusionTwentyFour")
        }
    }
    
    @Published var illusionTwentyFive: String {
        didSet {
            UserDefaults.standard.set(illusionTwentyFive, forKey: "illusionTwentyFive")
        }
    }
    
    @Published var illusionTwentySix: String {
        didSet {
            UserDefaults.standard.set(illusionTwentySix, forKey: "illusionTwentySix")
        }
    }
    
    @Published var illusionTwentySeven: String {
        didSet {
            UserDefaults.standard.set(illusionTwentySeven, forKey: "illusionTwentySeven")
        }
    }
    
    
    @Published var illusionTwentyEight: String {
        didSet {
            UserDefaults.standard.set(illusionTwentyEight, forKey: "illusionTwentyEight")
        }
    }
    
    init() {
        self.songTitleDanceOne = UserDefaults.standard.object(forKey: "songTitleDanceOne") as? String ?? ""
        self.songLyricsDanceOne = UserDefaults.standard.object(forKey: "songLyricsDanceOne") as? String ?? ""
        self.illusionThree = UserDefaults.standard.object(forKey: "illusionThree") as? String ?? ""
        self.illusionFour = UserDefaults.standard.object(forKey: "illusionFour") as? String ?? ""
        self.illusionFive = UserDefaults.standard.object(forKey: "illusionFive") as? String ?? ""
        self.illusionSix = UserDefaults.standard.object(forKey: "illusionSix") as? String ?? ""
        self.illusionSeven = UserDefaults.standard.object(forKey: "illusionSeven") as? String ?? ""
        self.illusionEight = UserDefaults.standard.object(forKey: "illusionEight") as? String ?? ""
        self.illusionNine = UserDefaults.standard.object(forKey: "illusionNine") as? String ?? ""
        self.illusionTen = UserDefaults.standard.object(forKey: "illusionTen") as? String ?? ""
        self.illusionEleven = UserDefaults.standard.object(forKey: "illusionEleven") as? String ?? ""
        self.illusionTwelve = UserDefaults.standard.object(forKey: "illusionTwelve") as? String ?? ""
        self.illusionThirteen = UserDefaults.standard.object(forKey: "illusionThirteen") as? String ?? ""
        self.illusionFourteen = UserDefaults.standard.object(forKey: "illusionFourteen") as? String ?? ""
        self.illusionFifteen = UserDefaults.standard.object(forKey: "illusionFifteen") as? String ?? ""
        self.illusionSixteen = UserDefaults.standard.object(forKey: "illusionSixteen") as? String ?? ""
        self.illusionSeventeen = UserDefaults.standard.object(forKey: "illusionSeventeen") as? String ?? ""
        self.illusionEighteen = UserDefaults.standard.object(forKey: "illusionEighteen") as? String ?? ""
        self.illusionNineteen = UserDefaults.standard.object(forKey: "illusionNineteen") as? String ?? ""
        self.illusionTwenty = UserDefaults.standard.object(forKey: "illusionTwenty") as? String ?? ""
        self.illusionTwentyOne = UserDefaults.standard.object(forKey: "illusionTwentyOne") as? String ?? ""
        self.illusionTwentyTwo = UserDefaults.standard.object(forKey: "illusionTwentyTwo") as? String ?? ""
        self.illusionTwentyThree = UserDefaults.standard.object(forKey: "illusionTwentyThree") as? String ?? ""
        self.illusionTwentyFour = UserDefaults.standard.object(forKey: "illusionTwentyFour") as? String ?? ""
        self.illusionTwentyFive = UserDefaults.standard.object(forKey: "illusionTwentyFive") as? String ?? ""
        self.illusionTwentySix = UserDefaults.standard.object(forKey: "illusionTwentySix") as? String ?? ""
        self.illusionTwentySeven = UserDefaults.standard.object(forKey: "illusionTwentySeven") as? String ?? ""
        self.illusionTwentyEight = UserDefaults.standard.object(forKey: "illusionTwentyEight") as? String ?? ""

    }
}
