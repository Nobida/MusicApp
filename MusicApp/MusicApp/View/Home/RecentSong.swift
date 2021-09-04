//
//  RecentSong.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecentSong: View {
    
    @StateObject var RecentSongModel = RecentViewModel()

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Recently Song")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(RecentSongModel.items) { item in
                        VStack(alignment: .leading) {
                            WebImage(url: URL(string: item.imageName))
                                .resizable()
                                .frame(width: 130, height: 130)
                                .cornerRadius(3)
                            Text(item.name)
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

struct RecentSong_Previews: PreviewProvider {
    static var previews: some View {
        RecentSong()
    }
}
