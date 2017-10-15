//
//  AudioPlayer.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 14/10/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import AVFoundation

class AudioPlayer {
  
  // MARK: - PRIVATE PROPERTIES
  
  private var audioPlayer = AVAudioPlayer()
  
  // MARK: - OUTPUT PROPERTIES
  
  var isPlaying: Bool {
    return audioPlayer.isPlaying
  }

  // MARK: - INITIALIZER
  
  init() {
    let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
    let soundPathUrl = URL(fileURLWithPath: path)
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: soundPathUrl)
      audioPlayer.prepareToPlay()
      audioPlayer.numberOfLoops = -1
    } catch {
      // couldn't load file :(
    }
    
  }
  
  // MARK: - METHODS
  
  func playAudio() {
    if audioPlayer.isPlaying { stopAudio() }
    DispatchQueue.main.async { [weak self] in self?.audioPlayer.play() }
  }
  
  func stopAudio() {
    audioPlayer.stop()
    audioPlayer.currentTime = 0.0
  }
  
}
