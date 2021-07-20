//
//  CardView.swift
//  Seven Sins
//
//  Created by Gobias LTD on 27/06/2020.
//  Copyright © 2020 Gobias LTD. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    //MARK: - PROPERTIES
  //  @Environment(\.presentationMode) var presentationMode

 //   @State private var willMoveToNextScreen = false
    @State var presentingModal = false
    var card: Card
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModal: Bool = false
    //MARK: - CARD
    
    
    var body: some View {
        ZStack {
            Image(card.imageName)
            VStack {
                Text(card.title)
                    .font(Font.custom("Lobster 1.4", size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .font(Font.custom("Lobster 1.4", size: 22))
                    .foregroundColor(Color.white)
                .italic()
            }
            .offset(y: -233)
            
            
            Button(action: {
                //MARK: - PLAY SOUND
           //     playSound(sound: "soundName", type: "mp3")
                }) {
                HStack {
                    Text(card.callToAction)
                        .font(Font.custom("Lobster 1.4", size: 26))
                        .foregroundColor(Color.white)
                        .accentColor(Color.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(Color.white)
                } //MARK: -BUTTON FUNCTIONALITY:
                .onTapGesture {
                    self.hapticImpact.impactOccurred()
                    self.showModal = true
                }
                .sheet(isPresented: self.$showModal) {
                    if (self.card.callToAction == "Hip Hop") {
                    hipHopView()
                    }
                    if (self.card.callToAction == "Pop") {
                    popView()
                    }
                    if (self.card.callToAction == "Rap") {
                    rapView()
                    }
                    if (self.card.callToAction == "Country") {
                    countryView()
                    }
                    if (self.card.callToAction == "Rock") {
                    rockView()
                    }
                    if (self.card.callToAction == "Acoustic") {
                    acousticView()
                    }
                    if (self.card.callToAction == "Dance") {
                    danceView()
                    }
                    if (self.card.callToAction == "Reggae") {
                    reggaeView()
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y: 222)
            
        }
        .frame(width: 355, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
    .cornerRadius(16)
    .shadow(radius: 8)

    }
}


//MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[6])
            .previewLayout(.sizeThatFits)
    }
}

