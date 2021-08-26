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
    var body: some View {
        TabView {
            NavigationView {
            }.tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }
            NavigationView {
                
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

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
