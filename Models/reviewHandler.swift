//
//  reviewHandler.swift
//  StudyBeatsFree
//
//  Created by TCH Developer on 23/10/2022.
//

import Foundation
import StoreKit
import SwiftUI

class ReviewHandler {
    
    static func requestReview() {
        var count = UserDefaults.standard.integer(forKey: UserDefaultKeys.appStartUpsCountKey)
        count += 1
        UserDefaults.standard.set(count, forKey: UserDefaultKeys.appStartUpsCountKey)
        
        let infoDictionaryKey = kCFBundleVersionKey as String
        guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: infoDictionaryKey) as? String
            else { fatalError("Expected to find a bundle version in the info dictionary") }

        let lastVersionPromptedForReview = UserDefaults.standard.string(forKey: UserDefaultKeys.lastVersionPromptedForReviewKey)
        
        if count >= 5 && currentVersion != lastVersionPromptedForReview {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            }
        }
    }
}
