//
//  SearchView.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import SwiftUI
import StoreKit
import MediaPlayer
import AVKit
import Firebase
import SDWebImageSwiftUI

struct SongView: View {
    
    var song: Song
    @State var isPlaying: Bool? = false
    
    func sendSearchItem() {
        let db = Firestore.firestore()
        db.collection("Replay").document(Auth.auth().currentUser!.uid).collection("items").addDocument(data: [
            "artistName": song.artistName,
            "trackName": song.trackName,
            "artworkUrl": song.artworkUrl,
            "previewUrl": song.previewUrl,
            "isLike": false,
        ]) {
            (err) in
            if err != nil {
                return
            }
            print("success")
        }
    }
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    func playTrack(from previewUrl: String) {
        guard let url = URL(string: previewUrl) else {
            return
        }
        
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    //send searchItem

    var body: some View {
        HStack {
            WebImage(url: URL(string: song.artworkUrl))
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
                sendSearchItem()
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



struct SearchView: View {
    

    @StateObject var searchData = SearchViewModel()
    @State var isPlaying: Bool? = false
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    func playTrack(from previewUrl: String) {
        guard let url = URL(string: previewUrl) else {
            return
        }
        
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    var body: some View {
        // Embedding all content in content view in a navigationView
        
            VStack {
                //SearchBar()
                HStack(spacing: 15){
                    Button(action: {
                        searchData.fetch()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.gray)
                        TextField("Type a song, artist, or album name...", text: $searchData.search)
                    })

                }.padding(.horizontal)
                
                .padding(.top,10)
                if searchData.songs.isEmpty {
                    EmptyStateView()
                } else {
                    List(searchData.songs) { song in
                        SongView(song: song)
                    }
                    .listStyle(PlainListStyle())

                }
            }
            
            .navigationBarTitle("Music Search")
            .onAppear(perform: {
                //searchData.login()
           })
    }
    
}
