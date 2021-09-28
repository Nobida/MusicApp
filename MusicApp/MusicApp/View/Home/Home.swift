//
//  Home.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeModel: HomeViewModel
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                RecentSong()
                LikeSong()
                RecommendSong()

            }.padding(.bottom, 50)
            
            
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3269367814, green: 0.2393824756, blue: 0.2673944831, alpha: 1)) , .black]), startPoint: .topLeading, endPoint: .center).edgesIgnoringSafeArea(.all)
        )
    }
}




