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
    
    
    init() {
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
    }
    
    
    var body: some View {
        ZStack{
            TabView {
                ZStack(alignment: .bottom) {
                    HomeView()

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
                    Text("Hello")
                }.tabItem {
                    VStack {
                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                        Text("Premium")
                    }
                }
                .accentColor(.white)
            }
            .preferredColorScheme(.dark)
        }
    }
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
