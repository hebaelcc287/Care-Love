//
//  PlaySound.swift
//  Love&Care
//
//  Created by Shimaa Elcc on 20.4.2023.
//

import SwiftUI
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playsound(soundFile : String , soundType : String){
    if let path = Bundle.main.path(forResource: soundFile, ofType: soundType){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()

        }catch{
            print("Unable to play sound file")
        }
    }
    
}

