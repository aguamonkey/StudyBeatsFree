//
//  bannerAds.swift
//  StudyBeatsFree
//
//  Created by Gobias LTD on 30/03/2021.
//

import GoogleMobileAds
import SwiftUI
import UIKit

final private class BannerVC: UIViewControllerRepresentable  {

    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)

        let viewController = UIViewController()
     //   let testID = "ca-app-pub-3940256099942544/2934735716"
        let realID = "ca-app-pub-7786319563620268/7018605193"
        view.adUnitID = realID
        view.rootViewController = viewController
        
        
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        view.load(GADRequest())

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct Banner: View {
    var body: some View{
        HStack {
            Spacer()
            BannerVC().frame(width: 320, height: 50, alignment: .center)
            Spacer()
        }.padding(-20)
       // .aspectRatio(contentMode: .fill)
        
        
        
        
    }
}

struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner()
    }
}
