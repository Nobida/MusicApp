//
//  RecentSong.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/4.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecentSong: View {
    @StateObject var RecentSongModel = HomeViewModel()
    var gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HStack {
                Text("こんにちは")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }.padding(.leading)
            LazyVGrid(columns: gridLayout, spacing: 8) {
                ForEach(RecentSongModel.recentItems) { item in
                    HStack {
                        WebImage(url: URL(string: item.imageName))
                            .resizable()
                            .frame(width: 60, height: 60)
                        Text(item.name)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.trailing)
                    .background(Color.white.opacity(0.085))
                    .cornerRadius(8)
                }
            }
            .padding(.horizontal)

        }
        .padding(.vertical)
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
