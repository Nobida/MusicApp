//
//  MusicPlayerViewModel.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/6.
//

import Foundation
import SwiftUI
import AVKit


class AVdelegate : NSObject,AVAudioPlayerDelegate{
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
    }
}



class MusicPlayerViewModel: NSObject, ObservableObject {
    

    @Published var title = ""
    @Published var player : AVAudioPlayer!
    @Published var playing = false
    @Published var width : CGFloat = 0
    @Published var songs: [Artist] = []
    @Published var current = 0
    @Published var finish = false
    @Published var del = AVdelegate()
    

}
