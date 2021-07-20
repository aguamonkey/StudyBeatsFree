//
//  liesSettings.swift
//  Awaken Me
//
//  Created by Gobias LTD on 07/08/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import Foundation
import Combine

class liesSettings: ObservableObject {
    @Published var liesOne: String {
        didSet {
            UserDefaults.standard.set(liesOne, forKey: "liesOne")
        }
    }
    
    @Published var liesTwo: String {
        didSet {
            UserDefaults.standard.set(liesTwo, forKey: "liesTwo")
        }
    }
    
    @Published var liesThree: String {
        didSet {
            UserDefaults.standard.set(liesThree, forKey: "liesThree")
        }
    }
    
    
    @Published var liesFour: String {
        didSet {
            UserDefaults.standard.set(liesFour, forKey: "liesFour")
        }
    }
    
    @Published var liesFive: String {
        didSet {
            UserDefaults.standard.set(liesFive, forKey: "liesFive")
        }
    }
    
    @Published var liesSix: String {
        didSet {
            UserDefaults.standard.set(liesSix, forKey: "liesSix")
        }
    }
    
    @Published var liesSeven: String {
        didSet {
            UserDefaults.standard.set(liesSeven, forKey: "liesSeven")
        }
    }
    
    
    @Published var liesEight: String {
        didSet {
            UserDefaults.standard.set(liesEight, forKey: "liesEight")
        }
    }
    
    @Published var liesNine: String {
        didSet {
            UserDefaults.standard.set(liesNine, forKey: "liesNine")
        }
    }
    
    @Published var liesTen: String {
        didSet {
            UserDefaults.standard.set(liesTen, forKey: "liesTen")
        }
    }
    
    @Published var liesEleven: String {
        didSet {
            UserDefaults.standard.set(liesEleven, forKey: "liesEleven")
        }
    }
    
    
    @Published var liesTwelve: String {
        didSet {
            UserDefaults.standard.set(liesTwelve, forKey: "liesTwelve")
        }
    }
    
    @Published var liesThirteen: String {
        didSet {
            UserDefaults.standard.set(liesThirteen, forKey: "liesThirteen")
        }
    }
    
    @Published var liesFourteen: String {
        didSet {
            UserDefaults.standard.set(liesFourteen, forKey: "liesFourteen")
        }
    }
    
    @Published var liesFifteen: String {
        didSet {
            UserDefaults.standard.set(liesFifteen, forKey: "liesFifteen")
        }
    }
    
    @Published var liesSixteen: String {
        didSet {
            UserDefaults.standard.set(liesSixteen, forKey: "liesSixteen")
        }
    }
    
    
    @Published var liesSeventeen: String {
        didSet {
            UserDefaults.standard.set(liesSeventeen, forKey: "liesSeventeen")
        }
    }
    
    @Published var liesEighteen: String {
        didSet {
            UserDefaults.standard.set(liesEighteen, forKey: "liesEighteen")
        }
    }
    
    @Published var liesNineteen: String {
        didSet {
            UserDefaults.standard.set(liesNineteen, forKey: "liesNineteen")
        }
    }
    
    @Published var liesTwenty: String {
        didSet {
            UserDefaults.standard.set(liesTwenty, forKey: "liesTwenty")
        }
    }
    
    @Published var liesTwentyOne: String {
        didSet {
            UserDefaults.standard.set(liesTwentyOne, forKey: "liesTwentyOne")
        }
    }
    
    @Published var liesTwentyTwo: String {
        didSet {
            UserDefaults.standard.set(liesTwentyTwo, forKey: "liesTwentyTwo")
        }
    }
    
    @Published var liesTwentyThree: String {
        didSet {
            UserDefaults.standard.set(liesTwentyThree, forKey: "liesTwentyThree")
        }
    }
    
    
    @Published var liesTwentyFour: String {
        didSet {
            UserDefaults.standard.set(liesTwentyFour, forKey: "liesTwentyFour")
        }
    }
    
    @Published var liesTwentyFive: String {
        didSet {
            UserDefaults.standard.set(liesTwentyFive, forKey: "liesTwentyFive")
        }
    }
    
    @Published var liesTwentySix: String {
        didSet {
            UserDefaults.standard.set(liesTwentySix, forKey: "liesTwentySix")
        }
    }
    
    @Published var liesTwentySeven: String {
        didSet {
            UserDefaults.standard.set(liesTwentySeven, forKey: "liesTwentySeven")
        }
    }
    
    
    @Published var liesTwentyEight: String {
        didSet {
            UserDefaults.standard.set(liesTwentyEight, forKey: "liesTwentyEight")
        }
    }
    
    init() {
        self.liesOne = UserDefaults.standard.object(forKey: "liesOne") as? String ?? ""
        self.liesTwo = UserDefaults.standard.object(forKey: "liesTwo") as? String ?? ""
        self.liesThree = UserDefaults.standard.object(forKey: "liesThree") as? String ?? ""
        self.liesFour = UserDefaults.standard.object(forKey: "liesFour") as? String ?? ""
        self.liesFive = UserDefaults.standard.object(forKey: "liesFive") as? String ?? ""
        self.liesSix = UserDefaults.standard.object(forKey: "liesSix") as? String ?? ""
        self.liesSeven = UserDefaults.standard.object(forKey: "liesSeven") as? String ?? ""
        self.liesEight = UserDefaults.standard.object(forKey: "liesEight") as? String ?? ""
        self.liesNine = UserDefaults.standard.object(forKey: "liesNine") as? String ?? ""
        self.liesTen = UserDefaults.standard.object(forKey: "liesTen") as? String ?? ""
        self.liesEleven = UserDefaults.standard.object(forKey: "liesEleven") as? String ?? ""
        self.liesTwelve = UserDefaults.standard.object(forKey: "liesTwelve") as? String ?? ""
        self.liesThirteen = UserDefaults.standard.object(forKey: "liesThirteen") as? String ?? ""
        self.liesFourteen = UserDefaults.standard.object(forKey: "liesFourteen") as? String ?? ""
        self.liesFifteen = UserDefaults.standard.object(forKey: "liesFifteen") as? String ?? ""
        self.liesSixteen = UserDefaults.standard.object(forKey: "liesSixteen") as? String ?? ""
        self.liesSeventeen = UserDefaults.standard.object(forKey: "liesSeventeen") as? String ?? ""
        self.liesEighteen = UserDefaults.standard.object(forKey: "liesEighteen") as? String ?? ""
        self.liesNineteen = UserDefaults.standard.object(forKey: "liesNineteen") as? String ?? ""
        self.liesTwenty = UserDefaults.standard.object(forKey: "liesTwenty") as? String ?? ""
        self.liesTwentyOne = UserDefaults.standard.object(forKey: "liesTwentyOne") as? String ?? ""
        self.liesTwentyTwo = UserDefaults.standard.object(forKey: "liesTwentyTwo") as? String ?? ""
        self.liesTwentyThree = UserDefaults.standard.object(forKey: "liesTwentyThree") as? String ?? ""
        self.liesTwentyFour = UserDefaults.standard.object(forKey: "liesTwentyFour") as? String ?? ""
        self.liesTwentyFive = UserDefaults.standard.object(forKey: "liesTwentyFive") as? String ?? ""
        self.liesTwentySix = UserDefaults.standard.object(forKey: "liesTwentySix") as? String ?? ""
        self.liesTwentySeven = UserDefaults.standard.object(forKey: "liesTwentySeven") as? String ?? ""
        self.liesTwentyEight = UserDefaults.standard.object(forKey: "liesTwentyEight") as? String ?? ""

    }
}
