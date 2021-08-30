//
//  SearchView.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import SwiftUI
import StoreKit
import MediaPlayer


struct SearchView: View {
    
    @ObservedObject var viewModel: SongListViewModel

    
    
    var body: some View {
        // Embedding all content in content view in a navigationView
        
            VStack {
                SearchBar(searchTerm: $viewModel.searchTerm)
                if viewModel.songs.isEmpty {
                    EmptyStateView()
                } else {
                    List(viewModel.songs) { song in
                            SongView(song: song)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationBarTitle("Music Search")
        
    }
}
