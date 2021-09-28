//
//  NowPlaying.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/4.
//

import SwiftUI
import SDWebImageSwiftUI


struct NowPlayingView: View {
    
    @EnvironmentObject var homeModel: HomeViewModel

    var body: some View {
        HStack (spacing: 16) {
            WebImage(url: URL(string: homeModel.nowPlaying.artworkUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text(homeModel.nowPlaying.trackName.uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    
                Text(homeModel.nowPlaying.artistName)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(#colorLiteral(red: 0.6391423345, green: 0.6392569542, blue: 0.6391436458, alpha: 1)))
            }
            
            Spacer()
            
            HStack(spacing: 30) {
                
                Button(action: {}) {
                    Image(systemName: "laptopcomputer.and.iphone")
                        .foregroundColor(Color(#colorLiteral(red: 0.1756174564, green: 0.8146540523, blue: 0.4214161634, alpha: 1)))
                }
                
                Button(action: { homeModel.isPlaying.toggle() }) {
                    Image(systemName: homeModel.isPlaying ? "pause.fill" : "play.fill")
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            .padding()
            
        }
        .frame(height: 60)
        .background(Color(#colorLiteral(red: 0.1372345686, green: 0.1372663081, blue: 0.1372349262, alpha: 1)))
    }
    
}
