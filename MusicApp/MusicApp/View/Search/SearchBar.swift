//
//  SearchBar.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//


import SwiftUI
import StoreKit
import MediaPlayer




struct SearchBar2: UIViewRepresentable {
    typealias UIViewType = UISearchBar
    // ^ UIVRep has to conform
    
    @Binding var searchTerm: String
    
    // Conforming methos to configure search bar
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Type a song, artist, or album name..."
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(searchTerm: $searchTerm)
    }
    
    // The search bars delegate
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        @Binding var searchTerm: String
        
        init(searchTerm: Binding<String>) {
            self._searchTerm = searchTerm
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchTerm = searchBar.text ?? ""
            UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
        }
    }
}
