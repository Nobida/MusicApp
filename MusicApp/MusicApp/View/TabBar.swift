//
//  TabBar.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/26.
//

import SwiftUI

struct TabBar: View {
    
    @State var playerIsHidden: Bool = true
    @State var isPlaying: Bool = true
    @StateObject var homeModel = HomeViewModel()
    
    
    init() {
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
    }
    
    
    var body: some View {

        ZStack{
            TabView {
                ZStack(alignment: .bottom) {
                    HomeView()
                    NowPlayingView()
                        .onTapGesture {
                            homeModel.playerIsHidden.toggle()
                        }
                }.tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                NavigationView {
                    SearchView(searchData: SearchViewModel())
                }.tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                NavigationView {
                    Text("Your Library")
                }.tabItem {
                    VStack {
                        Image(systemName: "books.vertical")
                        Text("Your Library")
                    }
                }
                NavigationView {
                    //Login(, show: <#Binding<Bool>#>)
                }.tabItem {
                    VStack {
                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                        Text("Premium")
                    }
                }

            }
            .accentColor(.white)
            MusicPlayer()
        }.preferredColorScheme(.dark)
        .environmentObject(homeModel)
        .onAppear(perform: {
            homeModel.fetchRecent()
       })

    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
