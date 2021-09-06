//
//  NowPlaying.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/4.
//

import SwiftUI
import SDWebImageSwiftUI


struct NowPlayingView: View {
    
    @Binding var isPlaying: Bool
    @StateObject var nowPlaying = HomeViewModel()
    
    var body: some View {
        HStack (spacing: 16) {

            
            VStack(alignment: .leading) {

                Text(nowPlaying.latestItem.name.uppercased())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    
                Text("Kid Cudi")
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
                
                Button(action: { isPlaying.toggle() }) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            .padding()
            
        }
        .onAppear(perform: {
            nowPlaying.login()
       })
        

        .frame(height: 60)
        .background(Color(#colorLiteral(red: 0.1372345686, green: 0.1372663081, blue: 0.1372349262, alpha: 1)))
    }
    
}
