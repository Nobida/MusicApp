//
//  MusicPlayer.swift
//  Spotify
//
//  Created by gentian sadiku on 31.12.20.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase


struct MusicPlayer: View {

    @State private var playerOffSet: CGSize = .zero
    @EnvironmentObject var homeModel: HomeViewModel
    
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.09240948409, green: 0.1576190889, blue: 0.2253419161, alpha: 1)) , Color(#colorLiteral(red: 0.265961051, green: 0.3859980702, blue: 0.5002948642, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            VStack {
                PlayerNavigationView()
                PlayingSongView()
                PlayerControlView()
            }
            .foregroundColor(.white)
            .padding(.horizontal, 2)
        }
        .offset(y: homeModel.playerIsHidden ? UIScreen.main.bounds.height : playerOffSet.height)
        .animation(.linear(duration: 0.3))
        .gesture(
            DragGesture()
                .onChanged { value in
                    guard value.translation.height >= 0 else { return }
                    playerOffSet = value.translation
                }
                .onEnded { value in
                    homeModel.playerIsHidden = value.translation.height > 200 ? true : false
                    playerOffSet = .zero
                }
        )
    }
}



struct PlayerControlView: View {
    

    @State private var playingTime: CGFloat = 3.2
    @EnvironmentObject var homeModel: HomeViewModel
    
    var body: some View {
        VStack {
            VStack {
                Slider(value: $playingTime, in: 0 ... 10)
                    .foregroundColor(.white)
                    .accentColor(.white)
                HStack {
                    Text("0.48")
                    Spacer()
                    Text("-4.48")
                }
            }
            
            HStack {
                Image(systemName: "shuffle")
                    .resizable()
                    .frame(width:20, height:20)
                
                Spacer()
                
                Image(systemName: "backward.end.fill")
                    .resizable()
                    .frame(width:26,height:26)
                
                Spacer()
                
                Button(action: {
                        homeModel.isPlaying.toggle()
                        
                }) {
                    Image(systemName: homeModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width:70,height:70)
                }
                
                Spacer()
                
                Image(systemName: "forward.end.fill")
                    .resizable()
                    .frame(width:26,height:26)
                
                Spacer()
                
                Image(systemName: "repeat")
                    .resizable()
                    .frame(width:20, height:20)
            }
        }
        .padding()
    }
}

struct PlayerNavigationView: View {
    

    @EnvironmentObject var homeModel: HomeViewModel
        
    var body: some View {
        ZStack {
            Text(homeModel.nowPlaying.trackName)
                .font(.headline)
                .fontWeight(.semibold)
            HStack {
                Button(action:{homeModel.playerIsHidden = true}) {
                    Image(systemName: "chevron.down")
                }
                Spacer()
                Button(action:{}) {
                    Text("•••")
                }
            }
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct PlayingSongView: View {
    

    @EnvironmentObject var homeModel: HomeViewModel
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: homeModel.nowPlaying.artworkUrl))
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(homeModel.nowPlaying.trackName)
                        .font(.largeTitle)
                        .bold()
                    Text(homeModel.nowPlaying.artistName)
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white.opacity(0.3))
                }
                Spacer()
                Button(action: {
                    homeModel.nowPlaying.isLike.toggle()
                    homeModel.updateLikeStatus(item: homeModel.nowPlaying)
                }) {
                    Image(systemName: homeModel.nowPlaying.isLike ? "heart.fill" : "heart")
                        .foregroundColor(homeModel.nowPlaying.isLike ? Color.yellow : Color.gray)
                }
            }.padding(.top, 30)
        }.padding(.horizontal)
    }
}

