//
//  hipHopView.swift
//  StudyBeatsFree
//
//  Created by Gobias LTD on 04/03/2021.
//

import SwiftUI
import AVFoundation
import UIKit
import LiveKnob
//import Controls
struct hipHopView: View {
    
    var gradient: [Color] = [Color("HipHop"), Color("HipHop2")]
    @ObservedObject var audiosettings = audioSettings()
    @ObservedObject var recordingsettings = Recorder()
    
    var isDisabled = false
    
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading, spacing: 20) {
                        hiphop1()
                        Spacer()
                        //        SmallKnobDemoView()
                        Spacer()
                        StudyBeatsPro()
                        Spacer()
                        Spacer()
                        Spacer()
                        Banner()
                        Spacer()
                    } //: VSTACK
                    .padding(.horizontal)
                    .padding(.vertical, 30)
                    Spacer()
                }.onDisappear {
                    self.recordingsettings.stopRecording()
                    self.recordingsettings.stopPlayback()
                    self.recordingsettings.stopPlaybackThree()
                    self.recordingsettings.stopSound()
                    
                } //: VSTACK
                //     .frame(height:1400)
                
            }.background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
                .edgesIgnoringSafeArea(.all)
            
        }
    }
    
}

enum ActiveAlert {
    case first, second
}
/*

struct SmallKnobDemoView: View {
    @State var value: Float = 0.33
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .center, spacing: 50) {
                    SmallKnob(value: $value)
                        .backgroundColor(.yellow)
                        .foregroundColor(.blue)
                        .frame(width: 75, height: 75, alignment: .leading)
                    SmallKnob(value: $value)
                        .backgroundColor(.orange)
                        .foregroundColor(.red)
                        .frame(width: 75, height: 75, alignment: .center)
                    SmallKnob(value: $value)
                        .frame(width: 75, height: 75, alignment: .trailing)
                    
                }
            }
        }
        .navigationTitle("Simple Knob")
        .padding()
    }
}
*/
struct hiphop1: View {
    
    @State private var playButton: Image? = Image(systemName: "play.circle")
    @State private var stopButton: Image? = Image(systemName: "stop.circle")
    @State private var recordButton: Image? = Image(systemName: "mic.circle")
    @State private var playbackButton: Image? = Image(systemName: "waveform.circle")
    @State private var tickButton: Image? = Image(systemName: "checkmark.circle")
    @State var isActive = true
    
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .first
    @State private var activeAlertTwo: ActiveAlert = .second
    
    @State private var showingAlert = false
    @State private var showingAlertHeadphones = false
    @State private var showingAlertOverwrite = false
    
    
    
    var playerValue: TimeInterval = 0.0
    var trackLength: TimeInterval = 0.0
    
    @State var value: Double = 33
    @ObservedObject var hiphopsettings = hiphopSettings()
    @State private var textStyle = UIFont.TextStyle.body
    var gradient: [Color] = [Color("HipHop"), Color("HipHop2")]
    @ObservedObject var recordingsettings = Recorder()
    
    @ObservedObject var sharesettings = shareSettings()
    @State private var showingSheet = false
    
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("Hip Hop Track")
                .font(Font.custom("Lobster 1.4", size: 30))
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                .fixedSize(horizontal: false, vertical: true)
            
            
            
            Text("Song Title:")
                .font(Font.custom("Lobster 1.4", size: 22))
                .foregroundColor(Color.white)
            TextView(text: $hiphopsettings.songTitleOne, textStyle: $textStyle)
            //            .padding()
                .background(Color(UIColor.tertiarySystemFill))
                .cornerRadius(9)
                .font(.system(size: 16, weight: .bold, design: .default))
                .frame(height: 50)
            
            
            Text("Song Lyrics:")
                .font(Font.custom("Lobster 1.4", size: 22))
                .foregroundColor(Color.white)
            TextView(text: $hiphopsettings.songLyricsOne, textStyle: $textStyle)
            //      .padding(10)
                .background(Color(UIColor.tertiarySystemFill))
                .cornerRadius(9)
            
                .font(.system(size: 16, weight: .bold, design: .default))
                .frame(height: 500)
            
            HStack {
                Spacer()
                Button(action: {
                    self.recordingsettings.stopRecording()
                    self.recordingsettings.stopPlayback()
                    self.recordingsettings.stopPlaybackThree()
                    self.recordButton = Image(systemName: "mic.circle")
                    self.playbackButton = Image(systemName: "waveform.circle")
                    
                    if (self.playButton == Image(systemName: "play.circle")) {
                        print("All Done")
                        self.recordingsettings.playSound(sound: "Hip Hop 8", type: "caf")
                        let currentTime = self.recordingsettings.audioPlayer?.currentTime
                        self.recordingsettings.playValue = currentTime!
                        self.recordingsettings.songDuration = 147.00
                        self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        self.playButton = Image(systemName: "pause.circle")
                        
                    } else {
                        
                        self.recordingsettings.pauseSound()
                        let currentTime = self.recordingsettings.audioPlayer?.currentTime
                        self.recordingsettings.playValue = currentTime!
                        self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        
                        
                        
                        self.playButton = Image(systemName: "play.circle")
                        
                        
                    }
                    
                    
                }) {
                    self.playButton
                        .foregroundColor(Color.white)
                        .font(.system(size: 44))
                }
                Button(action: {
                    print("All Done")
                    self.recordingsettings.stopPlayback()
                    self.recordingsettings.stopSound()
                    self.recordingsettings.stopRecording()
                    self.recordingsettings.stopPlaybackThree()
                    
                    self.recordButton = Image(systemName: "mic.circle")
                    self.playbackButton = Image(systemName: "waveform.circle")
                    self.playButton = Image(systemName: "play.circle")
                    
                    
                    self.recordingsettings.playValue = 0.0
                    
                }) {
                    self.stopButton
                        .foregroundColor(Color.white)
                        .font(.system(size: 44))
                    
                }
                Button(action: {
                    self.recordingsettings.stopSound()
                    self.recordingsettings.stopPlayback()
                    self.playbackButton = Image(systemName: "waveform.circle")
                    
                    self.playButton = Image(systemName: "play.circle")
                    
                    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    let fileName = path.appendingPathComponent("Hip Hop Recording.caf")
                    let audioAsset = AVURLAsset(url:fileName, options: nil)
                    let audioDuration = audioAsset.duration
                    let audioDurationSeconds = Float(CMTimeGetSeconds(audioDuration))
                    
                    
                    if (self.recordingsettings.isHeadsetPluggedIn() || self.recordingsettings.isBluetoothHeadsetPluggedIn()) {
                        if self.recordingsettings.isRecording == false {
                            if (audioDurationSeconds > 0.2) {
                                //       self.showingAlertOverwrite = true
                                //    self.alertItem = AlertItem(title: Text("Are you sure you want to overwrite your dope hip hop flow?"))
                                self.activeAlert = .second
                                self.showAlert = true
                                
                            }
                            
                            else {
                                print("Recording Tapped")
                                if (self.recordButton == Image(systemName: "mic.circle")) {
                                    self.recordingsettings.setUpAudio(sound: "Hip Hop 8.caf")
                                    self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                    self.recordingsettings.playSoundThree(sound: "Hip Hop 8", type: "caf")
                                    self.recordingsettings.songDuration = 147.00
                                    let currentTime = self.recordingsettings.audioPlayerThree?.currentTime
                                    self.recordingsettings.playValue = currentTime!
                                    self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                    
                                    try! self.recordingsettings.startRecording(sound: "Hip Hop Recording.caf")
                                    self.recordButton = Image(systemName: "checkmark.circle")
                                    
                                }
                            }
                        }
                        else {
                            self.recordingsettings.stopRecording()
                            self.recordButton = Image(systemName: "mic.circle")
                            self.showAlert = false
                            
                        }
                        
                    }
                    else {
                        print("Headphones required")
                        //            showingAlertHeadphones = true
                        self.activeAlert = .first
                        self.showAlert = true
                    }
                }) {
                    self.recordButton
                        .foregroundColor(Color.white)
                        .font(.system(size: 44))
                }
                .alert(isPresented: $showAlert) {
                    switch activeAlert {
                    case .first:
                        return Alert(title: Text("Headphones must be connected to record."))
                    case .second:
                        return Alert(title: Text("Are you sure you want to overwrite your dope hip hop flow?"), primaryButton: .destructive(Text("Let's go!")){
                            if (self.recordButton == Image(systemName: "mic.circle")) {
                                self.recordingsettings.setUpAudio(sound: "Hip Hop 8.caf")
                                self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                self.recordingsettings.playSoundThree(sound: "Hip Hop 8", type: "caf")
                                self.recordingsettings.songDuration = 147.00
                                let currentTime = self.recordingsettings.audioPlayerThree?.currentTime
                                self.recordingsettings.playValue = currentTime!
                                self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                
                                try! self.recordingsettings.startRecording(sound: "Hip Hop Recording.caf")
                                self.recordButton = Image(systemName: "checkmark.circle")
                            }
                        },
                                     secondaryButton: .cancel()
                        )
                    }
                    
                }
                
                
                
                Button(action: {
                    self.recordingsettings.stopRecording()
                    self.recordingsettings.stopSound()
                    self.recordingsettings.stopPlaybackThree()
                    
                    self.recordButton = Image(systemName: "mic.circle")
                    self.playButton = Image(systemName: "play.circle")
                    
                    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    let fileName = path.appendingPathComponent("Hip Hop Recording.caf")
                    let audioAsset = AVURLAsset(url:fileName, options: nil)
                    let audioDuration = audioAsset.duration
                    let audioDurationSeconds = Float(CMTimeGetSeconds(audioDuration))
                    
                    if self.playbackButton == Image(systemName: "waveform.circle") {
                        print("Playback audio")
                        
                        
                        
                        if audioDurationSeconds < 0.1 {
                            showingAlert = true
                            
                        }
                        else {
                            self.recordingsettings.playSoundTwo(sound: "Hip Hop Recording.caf")
                            self.recordingsettings.songDuration = TimeInterval(audioDurationSeconds)
                            let currentTimeTwo = self.recordingsettings.audioPlayerTwo?.currentTime
                            self.recordingsettings.playValue = currentTimeTwo!
                            self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                            
                            self.playbackButton = Image(systemName: "pause.circle")
                        }
                    }
                    
                    else {
                        self.recordingsettings.pausePlaybackSound()
                        self.recordingsettings.songDuration = TimeInterval(audioDurationSeconds)
                        
                        let currentTimeTwo = self.recordingsettings.audioPlayerTwo?.currentTime
                        self.recordingsettings.playValue = currentTimeTwo!
                        self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        self.playbackButton = Image(systemName: "waveform.circle")
                    }
                    
                }) {
                    self.playbackButton
                        .foregroundColor(Color.white)
                        .font(.system(size: 44))
                    
                }
                .alert(isPresented:$showingAlert) {
                    Alert(title: Text("No track currently available. Hit the microphone icon and let's make some music!!"))
                }
                Spacer()
                
            }
            HStack {
                Spacer()
                Text(self.recordingsettings.timeString(time: recordingsettings.playValue))
                    .font(Font.custom("Lobster 1.4", size: 18))
                    .foregroundColor(Color.white)
                Spacer()
            }
            //    if self.audiosettings.audioPlayer != nil {
            Group {
                Slider(value: $recordingsettings.playValue, in: TimeInterval(0.0)...recordingsettings.songDuration, onEditingChanged: { _ in
                    if self.recordingsettings.audioPlayer != nil {
                        self.recordingsettings.changeSliderValue()
                        self.playButton = Image(systemName: "pause.circle")
                        if self.recordingsettings.playValue == self.recordingsettings.songDuration {
                            self.recordingsettings.stopSound()
                            self.playButton = Image(systemName: "play.circle")
                        }
                    } else if (recordingsettings.playing) {
                        self.recordingsettings.playSound(sound: "Hip Hop 8", type: "caf")
                        self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    }
                    if self.recordingsettings.audioPlayerTwo != nil {
                        self.recordingsettings.changeSliderValueTwo()
                        self.playbackButton = Image(systemName: "pause.circle")
                        if self.recordingsettings.playValue == self.recordingsettings.songDuration {
                            self.recordingsettings.stopSound()
                            self.playbackButton = Image(systemName: "waveform.circle")
                        }
                    } else if (recordingsettings.isPlaying) {
                        self.recordingsettings.playSoundTwo(sound: "Hip Hop Recording.caf")
                        self.recordingsettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                        //          self.playbackButton = Image(systemName: "pause.circle")
                        
                    }
                    
                    
                    
                    
                    
                }).accentColor(Color.white)
                    .onReceive(recordingsettings.timer) { _ in
                        if self.recordingsettings.audioPlayerThree != nil {
                            if self.recordingsettings.isRecording {
                                if let currentTime = self.recordingsettings.audioPlayerThree?.currentTime {
                                    self.recordingsettings.playValue = currentTime
                                }
                            }
                        }
                        
                        if self.recordingsettings.audioPlayerTwo != nil {
                            
                            if self.recordingsettings.isPlaying {
                                if let currentTime = self.recordingsettings.audioPlayerTwo?.currentTime {
                                    self.recordingsettings.playValue = currentTime
                                    if currentTime == TimeInterval(0.0) {
                                        self.recordingsettings.isPlaying = false
                                        self.playbackButton = Image(systemName: "waveform.circle")
                                        
                                    }
                                    
                                }
                                
                            }
                            else {
                                self.recordingsettings.isPlaying = false
                                self.recordingsettings.timer.upstream.connect().cancel()
                            }
                        }
                        
                        if self.recordingsettings.audioPlayer != nil {
                            
                            if self.recordingsettings.playing {
                                if let currentTime = self.recordingsettings.audioPlayer?.currentTime {
                                    self.recordingsettings.playValue = currentTime
                                    if currentTime == TimeInterval(0.0) {
                                        self.recordingsettings.playing = false
                                        self.playButton = Image(systemName: "play.circle")
                                        
                                    }
                                    
                                }
                                
                            }
                            else {
                                self.recordingsettings.playing = false
                                self.recordingsettings.timer.upstream.connect().cancel()
                            }
                        }
                        
                    }
                HStack {
                    Spacer()
                    Text("Vocal Volume")
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .foregroundColor(Color.white)
                    Spacer()
                }
                Slider(value: $recordingsettings.vocalValue, in: Float(0.0)...recordingsettings.vocalMaxVolume, onEditingChanged: { _ in
                    self.recordingsettings.changeVocalVolume()
                }).accentColor(Color.white)
                HStack {
                    Spacer()
                    Text("Vocal Reverb")
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .foregroundColor(Color.white)
                    Spacer()
                   
                }
                Slider(value: $recordingsettings.reverbValue, in: Float(0.0)...recordingsettings.reverbMaxValue, onEditingChanged: { _ in
                    self.recordingsettings.changeReverbValue()
                }).accentColor(Color.white)
                HStack {
                    Spacer()
                    DropDown()
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("Vocal Delay")
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .foregroundColor(Color.white)
                    Spacer()
                }
                Slider(value: $recordingsettings.delayValue, in: Double(0.0)...recordingsettings.delayMaxValue, onEditingChanged: { _ in
                    self.recordingsettings.changeDelayValue()
                }).accentColor(Color.white)
            }
            //    }
        }
    }
    func ShareAudio(_ AudioName : String ) -> URL?{
        let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileName = docDir.appendingPathComponent(AudioName)
        
        return fileName
    }
}

struct DropDown: View {
    @State var expand = false
    var gradient: [Color] = [Color("HipHop"), Color("HipHop2")]
    var reverbSetupArray = [String]()

    init() {
    let defaults = UserDefaults.standard
    reverbSetupArray = defaults.stringArray(forKey: "ReverbSetup") ?? [String]()
    }
    @State private var dropDownDisplay: String = "Reverb Effects"
    var body: some View {
        VStack(alignment: .leading, spacing: 18, content: {
            HStack {
                Spacer()
                Text(dropDownDisplay).fontWeight(.heavy)
                    .font(Font.custom("Lobster 1.4", size: 20))
                    .foregroundColor(.white)
                Image(systemName: expand ? "chevron.up" : "chevron.down").resizable().frame(width: 13, height: 6).foregroundColor(.white)
                Spacer()
            }
            .onTapGesture {
                self.expand.toggle()
            }
            
            if expand {
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = reverbSetupArray[0]
                }) {
                    Spacer()
                    Text(reverbSetupArray[0])
                    Spacer()
                }.foregroundColor(.white)
                    .font(Font.custom("Lobster 1.4", size: 20))
                    .multilineTextAlignment(.center)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = reverbSetupArray[4]
                }) {
                    Spacer()
                    Text(reverbSetupArray[4])
                    Spacer()
                }.foregroundColor(.white)
                    .font(Font.custom("Lobster 1.4", size: 20))
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = reverbSetupArray[11]
                }) {
                    Spacer()
                    Text(reverbSetupArray[11])
                    Spacer()
                }.foregroundColor(.white)
                    .font(Font.custom("Lobster 1.4", size: 20))
                    .multilineTextAlignment(.center)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = "Set To Default"
                }) {
                    Spacer()
                    Text("Medium Room | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = "Set To Default"
                }) {
                    Spacer()
                    Text("Medium Hall 2 | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = "Set To Default"
                }) {
                    Spacer()
                    Text("Medium Hall 3 | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = reverbSetupArray[2]
                }) {
                    Spacer()
                    Text("Large Room | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = "Set To Default"
                }) {
                    Spacer()
                    Text("Large Room 2 | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                Group {
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = "Set To Default"
                }) {
                    Spacer()
                    Text("Large Hall | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = "Set To Default"
                }) {
                    Spacer()
                    Text("Large Hall 2 | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = "Set To Default"
                }) {
                    Spacer()
                    Text("Plate | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = "Set To Default"
                }) {
                    Spacer()
                    Text("Medium Chamber | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                Button(action: {
                    self.expand.toggle()
                    dropDownDisplay = "Set To Default"
                }) {
                    Spacer()
                    Text("Cathedral | Study Beats Pro")
                    Spacer()
                }.foregroundColor(.white)
                        .font(Font.custom("Lobster 1.4", size: 20))
                        .opacity(0.5)
                        .disabled(true)
                
                }
            }
            
        })
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: gradient), startPoint: .top, endPoint: .bottom))
        .cornerRadius(0)
        .border(.white)
        .animation(.spring())
    }
}

struct StudyBeatsPro: View {

    var body: some View {
        HStack {
            //      Spacer()
            Button(action: {
                print("Download Study Beats Pro")
                
                if let url = URL(string: "https://apps.apple.com/gb/app/study-beats-pro-music-maker/id1125805386") {
                    UIApplication.shared.open(url)
                }
            })
            {
                Text("Study Beats Pro")
                    .font(Font.custom("Lobster 1.4", size: 30))
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .fixedSize(horizontal: false, vertical: true)
                
            }
        }
    }
}



struct hipHopView_Previews: PreviewProvider {
    static var previews: some View {
        hipHopView()
    }
}
