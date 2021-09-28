//
//  RecentSong.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import SwiftUI
import SDWebImageSwiftUI

struct LikeSong: View {
    
    @StateObject var RecentSongModel = HomeViewModel()
    
    
    var body: some View {
        VStack {
            HStack {
                Text("あなたのTop Mix")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(RecentSongModel.recommendItems) { item in
                        VStack(alignment: .leading) {
                            WebImage(url: URL(string: item.artworkUrl))
                                .resizable()
                                .frame(width: 130, height: 130)
                                .cornerRadius(3)
                            Text(item.artistName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .lineLimit(2)
                        }
                    }
                }
            }
        }.padding(.leading)
         .onAppear(perform: {
            RecentSongModel.login()
        })
    }
}

struct LikeSong_Previews: PreviewProvider {
    static var previews: some View {
        LikeSong()
    }
}
