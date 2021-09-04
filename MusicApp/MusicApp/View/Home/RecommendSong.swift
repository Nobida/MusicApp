//
//  RecommendSong.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecommendSong: View {
    var columns = Array(repeating: GridItem(.flexible(), spacing:20), count:2)
    
    @StateObject var RecentSongModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("おすすめステーション")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                }
            
            LazyVGrid(columns: columns, spacing: 20) {
                
                ForEach(RecentSongModel.items){
                    item in
                    
                    WebImage(url: URL(string: item.imageName))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 180)
                        .cornerRadius(30)
                }
            }
            }.padding(.leading)
            .onAppear(perform: {
               RecentSongModel.login()
           })
        }
    }


struct RecommendSong_Previews: PreviewProvider {
    static var previews: some View {
        RecommendSong()
    }
}
