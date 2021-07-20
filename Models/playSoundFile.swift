//
//  playSoundFile.swift
//  StudyBeatsFree
//
//  Created by Gobias LTD on 04/03/2021.
//

import Foundation
import AVFoundation
import Combine

class audioSettings: ObservableObject {
    var audioPlayer: AVAudioPlayer?
    var playing = false
    @Published var playValue: TimeInterval = 0.0
    
    var hipHopDuration: TimeInterval = 147.00
    var popDuration: TimeInterval = 157.00
    var rapDuration: TimeInterval = 157.00
    var countryDuration: TimeInterval = 157.00
    var rockDuration: TimeInterval = 157.00
    var acousticDuration: TimeInterval = 157.00
    var danceDuration: TimeInterval = 157.00
    var reggaeDuration: TimeInterval = 157.00

    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var formatter = DateComponentsFormatter()
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                if playing == false {
                    if (audioPlayer == nil) {
                        
                        
                        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                        audioPlayer?.prepareToPlay()
                        
                        audioPlayer?.play()
                        playing = true
                    }
                    
                }
                if playing == false {
                    
                    audioPlayer?.play()
                    playing = true
                }
                
                
            } catch {
                print("Could not find and play the sound file.")
            }
        }
        
    }
    

  
    
    func stopSound() {
        //   if playing == true {
        audioPlayer?.stop()
        audioPlayer = nil
        playing = false
        playValue = 0.0
        
        
        //   }
    }
    
    func pauseSound() {
        if playing == true {
            audioPlayer?.pause()
            playing = false
            
            
        }
    }
    
    
    func changeSliderValue() {
        if playing == true {
            pauseSound()
            audioPlayer?.currentTime = playValue
            
        }
        
        if playing == false {
            audioPlayer?.currentTime = playValue
            
            
            audioPlayer?.play()
            playing = true
        }
    }
    
}
func timeString(time:TimeInterval) -> String {
    let minutes = Int(time) / 60
    let seconds = time - Double(minutes) * 60
    return String(format:"%02i:%02i",minutes,Int(seconds))
}

