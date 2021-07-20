//
//  guiltSettings.swift
//  Awaken Me
//
//  Created by Gobias LTD on 07/08/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import Foundation
import Combine

class popSettings: ObservableObject {
    @Published var songTitlePopOne: String {
        didSet {
            UserDefaults.standard.set(songTitlePopOne, forKey: "songTitlePopOne")
        }
    }
    
    @Published var songLyricsPopOne: String {
        didSet {
            UserDefaults.standard.set(songLyricsPopOne, forKey: "songLyricsPopOne")
        }
    }
    
    @Published var guiltThree: String {
        didSet {
            UserDefaults.standard.set(guiltThree, forKey: "guiltThree")
        }
    }
    
    
    @Published var guiltFour: String {
        didSet {
            UserDefaults.standard.set(guiltFour, forKey: "guiltFour")
        }
    }
    
    @Published var guiltFive: String {
        didSet {
            UserDefaults.standard.set(guiltFive, forKey: "guiltFive")
        }
    }
    
    @Published var guiltSix: String {
        didSet {
            UserDefaults.standard.set(guiltSix, forKey: "guiltSix")
        }
    }
    
    @Published var guiltSeven: String {
        didSet {
            UserDefaults.standard.set(guiltSeven, forKey: "guiltSeven")
        }
    }
    
    
    @Published var guiltEight: String {
        didSet {
            UserDefaults.standard.set(guiltEight, forKey: "guiltEight")
        }
    }
    
    @Published var guiltNine: String {
        didSet {
            UserDefaults.standard.set(guiltNine, forKey: "guiltNine")
        }
    }
    
    @Published var guiltTen: String {
        didSet {
            UserDefaults.standard.set(guiltTen, forKey: "guiltTen")
        }
    }
    
    @Published var guiltEleven: String {
        didSet {
            UserDefaults.standard.set(guiltEleven, forKey: "guiltEleven")
        }
    }
    

    
    init() {
        self.songTitlePopOne = UserDefaults.standard.object(forKey: "songTitlePopOne") as? String ?? ""
        self.songLyricsPopOne = UserDefaults.standard.object(forKey: "songLyricsPopOne") as? String ?? ""
        self.guiltThree = UserDefaults.standard.object(forKey: "guiltThree") as? String ?? ""
        self.guiltFour = UserDefaults.standard.object(forKey: "guiltFour") as? String ?? ""
        self.guiltFive = UserDefaults.standard.object(forKey: "guiltFive") as? String ?? ""
        self.guiltSix = UserDefaults.standard.object(forKey: "guiltSix") as? String ?? ""
        self.guiltSeven = UserDefaults.standard.object(forKey: "guiltSeven") as? String ?? ""
        self.guiltEight = UserDefaults.standard.object(forKey: "guiltEight") as? String ?? ""
        self.guiltNine = UserDefaults.standard.object(forKey: "guiltNine") as? String ?? ""
        self.guiltTen = UserDefaults.standard.object(forKey: "guiltTen") as? String ?? ""
        self.guiltEleven = UserDefaults.standard.object(forKey: "guiltEleven") as? String ?? ""



    }
}
