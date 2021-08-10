//
//  recordingFile.swift
//  StudyBeatsFree
//
//  Created by Gobias LTD on 08/03/2021.
//
import SwiftUI

import Foundation
import AVFoundation
import Combine

class Recorder: ObservableObject {
  enum RecordingState {
    case recording, paused, stopped
  }
    
    
    
    //PlayerSettings:
    var audioPlayer: AVAudioPlayer?
    var audioPlayerTwo: AVAudioPlayer?
    var audioPlayerThree: AVAudioPlayer?

    var playing = false
    @Published var playValue: TimeInterval = 0.0
    @Published var reverbValue: Float = 0.0
    var reverbMaxValue: Float = 100.0
    
    @Published var delayValue: Double = 0.0
    var delayMaxValue: Double = 1.0
    
    
    var songDuration: TimeInterval = 0.0


    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var formatter = DateComponentsFormatter()
    
    
    var isPlaying = false
  
    var isRecording = false

    
  private var engine: AVAudioEngine!
    private var engineTwo: AVAudioEngine!

  private var mixerNode: AVAudioMixerNode!
    
    //Added recently:
    private var setReverb: AVAudioUnitReverb!
    private var setDelay: AVAudioUnitDelay!
    
    private var playerNode: AVAudioPlayerNode!
    private var playerBuffer: AVAudioPCMBuffer! = nil
 //   var playerNodeTwo: AVAudioPlayerNode!
 //   private var playerBufferTwo: AVAudioPCMBuffer! = nil
    private var audioFile: AVAudioFile! = nil
    private var hipHopURL: NSURL!
    private var audio: [URL] = []
    
    //Buttons:
    private var playButton: Image? = Image(systemName: "play.circle")
    private var stopButton: Image? = Image(systemName: "stop.circle")
    private var recordButton: Image? = Image(systemName: "mic.circle")
    private var playbackButton: Image? = Image(systemName: "waveform.circle")
    private var tickButton: Image? = Image(systemName: "checkmark.circle")
    
  private var state: RecordingState = .stopped
    fileprivate var isInterrupted = false
    fileprivate var configChangePending = false

  
  init() {
    setupSession()
    setupEngine()
    registerForNotifications()
  //  setupSessionPlayback()
  }

    fileprivate func setupSession() {
      let session = AVAudioSession.sharedInstance()
        let ioBufferDuration: TimeInterval = 0.14929
        let sampleRate: Double = 44100.0

        try? session.setCategory(.playAndRecord, options: [.defaultToSpeaker, .allowAirPlay, .allowBluetoothA2DP])
        try? session.setPreferredSampleRate(sampleRate)
        try? session.setPreferredIOBufferDuration(ioBufferDuration)
      try? session.setActive(true, options: .notifyOthersOnDeactivation)
        print("Latency :",session.outputLatency)
        
        
    }
 

    
    fileprivate func setupEngine() {
      engine = AVAudioEngine()
      mixerNode = AVAudioMixerNode()
        playerNode = AVAudioPlayerNode()
        setReverb = AVAudioUnitReverb()
        setDelay = AVAudioUnitDelay()
        
        
      //You may be able to set this to 0 with the condition that headphones are not plugged in. If headphones are not plugged in 0 for no feedback, if they are then level 5 is a good level.
      // Set volume to 0 to avoid audio feedback while recording.
      //  mixerNode.volume = 1.2
        mixerNode.volume = 1.2

      engine.attach(mixerNode)
        engine.attach(playerNode)
        engine.attach(setReverb)
        engine.attach(setDelay)

      makeConnections()
      
      // Prepare the engine in advance, in order for the system to allocate the necessary resources.
      engine.prepare()
    }


    fileprivate func makeConnections() {
        //You want to connect the player node to here but you may need to align it to a buffer in another function.
        
      let inputNode = engine.inputNode
     //   inputNode.volume = 0.0
      let inputFormat = inputNode.outputFormat(forBus: 0)
   //   engine.connect(inputNode, to: mixerNode, format: inputFormat)

      let mainMixerNode = engine.mainMixerNode
      let mixerFormat = AVAudioFormat(commonFormat: .pcmFormatFloat32, sampleRate: inputFormat.sampleRate, channels: 1, interleaved: false)
        engine.connect(inputNode, to: setReverb, format: mixerFormat)
        engine.connect(setReverb, to: setDelay, format: mixerFormat)
        engine.connect(setDelay, to: mixerNode, format: mixerFormat)
        

        engine.connect(playerNode, to: mixerNode, format: mixerFormat)
        engine.connect(mixerNode, to: mainMixerNode, format: mixerFormat)
        
        
        setDelay.delayTime = 0
        setDelay.feedback = 50
        setDelay.lowPassCutoff = 15000
        setDelay.wetDryMix = 100
        
        setReverb.wetDryMix = 0
        setReverb.loadFactoryPreset(.mediumChamber)
        
        
    }
    
    func changeReverbValue() {
        setReverb.wetDryMix = reverbValue
    }
    
    func changeDelayValue() {
        setDelay.delayTime = delayValue
    }



    func setUpAudio(sound: String) {
        
        let url = Bundle.main.resourceURL!.appendingPathComponent(sound)
        
     
        
        audioFile = try! AVAudioFile(forReading: url)
        
        playerBuffer = AVAudioPCMBuffer(
            pcmFormat: audioFile.processingFormat, frameCapacity: AVAudioFrameCount(audioFile.length))
        
        try! audioFile.read(into: playerBuffer)
        
        engine.attach(playerNode)
        engine.connect(playerNode, to: mixerNode, format: audioFile.processingFormat)
        
        try! engine.start()
        
        
        playerNode.play()
        playerNode.scheduleBuffer(playerBuffer)
        playerNode.scheduleFile(audioFile, at:nil)
        
    }

    /*

    */
   
    func pausePlaybackSound() {
        if isPlaying == true {
            audioPlayerTwo?.pause()
            isPlaying = false
            
            
        }
    }

    func resumeSound() throws {
      try engineTwo.start()
   //   state = .recording
        isPlaying = true

    }
    
    func startRecording(sound:String) throws {
      
   //     if isHeadsetPluggedIn() {
        //    self .setUpHipHopAudio(sound: "Hip Hop 8.caf")
        

        
        let tapNode: AVAudioNode = mixerNode
        
        //Or maybe attach a player Node here to the mixer node
      let format = tapNode.outputFormat(forBus: 0)

      let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
      
      // AVAudioFile uses the Core Audio Format (CAF) to write to disk.
      // So we're using the caf file extension.
      let file = try AVAudioFile(forWriting: documentURL.appendingPathComponent(sound), settings: format.settings)
        
//Maybe the key lies in the format below:
      tapNode.installTap(onBus: 0, bufferSize: 32, format: format, block: {
        (buffer, time) in
        try? file.write(from: buffer)
      })
        

      try engine.start()
      state = .recording
        isRecording = true

    }

    func resumeRecording() throws {
      try engine.start()
      state = .recording
    }
    
    

    func pauseRecording() {
      engine.pause()
      state = .paused
    }
    
    func stopPlaybackThree() {
        audioPlayerThree?.stop()
          audioPlayerThree = nil

          playValue = 0.0
        
    }

    func stopRecording() {
      // Remove existing taps on nodes
      mixerNode.removeTap(onBus: 0)
//        engine.detach(playerNode)
//       engine.detach(mixerNode)
      engine.stop()
        audioPlayerThree?.stop()
          audioPlayerThree = nil

          playValue = 0.0
      isRecording = false
        
      state = .stopped
    }
    
    func stopPlayback() {
        audioPlayerTwo?.stop()
        audioPlayerTwo = nil
        isPlaying = false
        playValue = 0.0

    }
    

    
    fileprivate func registerForNotifications() {
      NotificationCenter.default.addObserver(
        forName: AVAudioSession.interruptionNotification,
        object: nil,
        queue: nil
      )
      { [weak self] (notification) in
        guard let weakself = self else {
          return
        }

        let userInfo = notification.userInfo
        let interruptionTypeValue: UInt = userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt ?? 0
        let interruptionType = AVAudioSession.InterruptionType(rawValue: interruptionTypeValue)!

        switch interruptionType {
        case .began:
          weakself.isInterrupted = true

          if weakself.state == .recording {
            weakself.pauseRecording()
          }
        case .ended:
          weakself.isInterrupted = false

          // Activate session again
          try? AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

          weakself.handleConfigurationChange()

          if weakself.state == .paused {
            try? weakself.resumeRecording()
          }
        @unknown default:
          break
        }
      }
        NotificationCenter.default.addObserver(
          forName: Notification.Name.AVAudioEngineConfigurationChange,
          object: nil,
          queue: nil
        ) { [weak self] (notification) in
          guard let weakself = self else {
            return
          }

          weakself.configChangePending = true

          if (!weakself.isInterrupted) {
            weakself.handleConfigurationChange()
          } else {
            print("deferring changes")
          }
        }

  
    }
    fileprivate func handleConfigurationChange() {
      if configChangePending {
        makeConnections()
      }

      configChangePending = false
    }
    

    func isHeadsetPluggedIn() -> Bool {

        let route = AVAudioSession.sharedInstance().currentRoute
        for desc in route.outputs {
            if desc.portType == (AVAudioSession.Port.headphones) {
                return true
            }
        }
        return false


    }
    func isBluetoothHeadsetPluggedIn() -> Bool {

        let route = AVAudioSession.sharedInstance().currentRoute
        for desc in route.outputs {
            if desc.portType == (AVAudioSession.Port.bluetoothA2DP) {
                return true
            }
        }
        return false


    }

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
    
    func playSoundThree(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                if isRecording == false {
                    if (audioPlayerThree == nil) {
                        
                        
                        audioPlayerThree = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                        audioPlayerThree?.prepareToPlay()
                        audioPlayerThree?.volume = 0.0
                        audioPlayerThree?.play()
                        isRecording = true
                    }
                    
                }
                
                
            } catch {
                print("Could not find and play the sound file.")
            }
        }
        
    }

    func playSoundTwo(sound: String) {
         let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
         let fileName = path.appendingPathComponent(sound)
       
        if isPlaying == false {
            if (audioPlayerTwo == nil) {
                audioPlayerTwo = try! AVAudioPlayer(contentsOf: fileName)
                audioPlayerTwo?.prepareToPlay()
                
                audioPlayerTwo?.play()
                isPlaying = true
            }
        }
        
        if isPlaying == false {
            audioPlayerTwo?.play()
            isPlaying = true
        }
        

    }
    
    
    func stopSound() {
        //   if playing == true {
        audioPlayer?.stop()
        audioPlayer = nil
        playing = false
        playValue = 0.0
        songDuration = 0.0
        
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
    
    func changeSliderValueTwo() {

        
 
        if isPlaying == true {
            pausePlaybackSound()
            audioPlayerTwo?.currentTime = playValue
        }
        
        if isPlaying == false {
            audioPlayerTwo?.currentTime = playValue
            audioPlayerTwo?.play()
            isPlaying = true
        }
    
}
    

    
    
func timeString(time:TimeInterval) -> String {
    let minutes = Int(time) / 60
    let seconds = time - Double(minutes) * 60
    return String(format:"%02i:%02i",minutes,Int(seconds))
}


    

 //       self.play()


}



//Recording playback more complex version code:

/*
 
 
 fileprivate func setupEngineTwo() {
   engineTwo = AVAudioEngine()
//    mixerNode = AVAudioMixerNode()
     playerNodeTwo = AVAudioPlayerNode()
     
   //You may be able to set this to 0 with the condition that headphones are not plugged in. If headphones are not plugged in 0 for no feedback, if they are then level 5 is a good level.
   // Set volume to 0 to avoid audio feedback while recording.
   //  mixerNode.volume = 1.2
//      mixerNode.volume = 1.2

 //  engine.attach(mixerNode)
     engineTwo.attach(playerNodeTwo)

   makeConnectionsTwo()
   
   // Prepare the engine in advance, in order for the system to allocate the necessary resources.
   engineTwo.prepare()
 }
 
 
 
 fileprivate func makeConnectionsTwo() {
     //You want to connect the player node to here but you may need to align it to a buffer in another function.


   let mainMixerNode = engineTwo.mainMixerNode

     
     let stereoFormat = AVAudioFormat(commonFormat: .pcmFormatFloat32, sampleRate: 44100, channels: 2, interleaved: false)

     engineTwo.connect(playerNodeTwo, to: mainMixerNode, format: stereoFormat)
 }
 
 func playRecordedFile(track: String) {
     //Within here you will establish the length of the audio file and if it is over 0 secnds there will be an overwrite alert.
     let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
     let fileName = path.appendingPathComponent(track)
     let audioAsset = AVURLAsset(url:fileName, options: nil)
     let audioDuration = audioAsset.duration
     let audioDurationSeconds = Float(CMTimeGetSeconds(audioDuration))
     
     if audioDurationSeconds < 0.1 {
         print("No file to play")
     }
     
     
     if isPlaying == false {
//         if playerNodeTwo == nil {
             setUpRecordingPlayback(sound: track)
             isPlaying = true
///          }
//          if isPlaying == false {
//             playerNodeTwo.play()
//              isPlaying = true
 //        }
 

     }
     
 }
 
 //perhaps the below could be func setUpRecordingPlayback(path: url, file: url)
 func setUpRecordingPlayback(sound: String) {
     
     
 //    var documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
     
     // AVAudioFile uses the Core Audio Format (CAF) to write to disk.
     // So we're using the caf file extension.
     
   
//     documentURL = Bundle.main.resourceURL!.appendingPathComponent("recording.caf")
   //INSTEAD of sound you could use the actual file name when referencing directly in your code view page
     let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
     let fileName = path.appendingPathComponent(sound)
     let audioAsset = AVURLAsset(url:fileName, options: nil)
     let audioDuration = audioAsset.duration
     let audioDurationSeconds = Float(CMTimeGetSeconds(audioDuration))
     
     if audioDurationSeconds < 0.1 {
         print("No file to play")
     }
     

     
     audioFile = try! AVAudioFile(forReading: fileName)

     //Below is the beggining of establishing the audio files length time wise.

  
     playerBufferTwo = AVAudioPCMBuffer(
         pcmFormat: audioFile.processingFormat, frameCapacity: AVAudioFrameCount(audioFile.length))
     
     try! audioFile.read(into: playerBufferTwo)
     
     engineTwo.attach(playerNodeTwo)

     engineTwo.connect(playerNodeTwo, to: engineTwo.mainMixerNode, format: audioFile.processingFormat)
     
     try! engineTwo.start()
     
     playerNodeTwo.play()
     playerNodeTwo.scheduleBuffer(playerBufferTwo)
     playerNodeTwo.scheduleFile(audioFile, at:nil)
         
         
     
     
     
     
 }
 
 func currentTime() -> TimeInterval {
    if let nodeTime: AVAudioTime = playerNodeTwo.lastRenderTime, let playerTime: AVAudioTime = playerNodeTwo.playerTime(forNodeTime: nodeTime) {
       return Double(Double(playerTime.sampleTime) / playerTime.sampleRate)
    }
    return 0
}
 */
