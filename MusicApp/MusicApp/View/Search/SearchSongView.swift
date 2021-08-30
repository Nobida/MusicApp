//
//  SearchSongView.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import SwiftUI
import AVKit



struct SongView: View {
    @ObservedObject var song: SongViewModel
    @State var isPlaying: Bool? = false
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    private func playTrack(from previewUrl: String) {
        guard let url = URL(string: previewUrl) else {
            return
        }
        
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    var body: some View {
        HStack {
            ArtworkView(image: song.artwork)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(song.trackName)
                Text(song.artistName)
                //Text(song.trackName)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        
        Spacer()
        
        if !(isPlaying ?? false) {
            Button(action: {
                playTrack(from: song.previewUrl)
                isPlaying = true
            }) {
                Image(systemName: "play.fill")
                    .foregroundColor(.pink)
            }
        }else {
            Button(action: {
                player.pause()
                isPlaying = false
            }) {
                Image(systemName: "pause.circle")
                    .foregroundColor(.pink)
            }
            
        }
    }
}
