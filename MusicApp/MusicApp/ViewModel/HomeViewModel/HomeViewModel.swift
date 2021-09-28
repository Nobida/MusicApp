//
//  RecentSongViewModel.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import SwiftUI
import CoreLocation
import Firebase


class HomeViewModel: NSObject, ObservableObject {
    
    //ItemData...
    @Published var items: [SongItem] = []
    @Published var recommendItems: [SongItem] = []
    @Published var recentItems: [SongItem] = []
    @Published var nowPlaying = SongItem(id: "", trackName: "", artistName: "", artworkUrl:"", previewUrl:"")
    

    @Published var playerIsHidden: Bool = true
    @Published var isPlaying: Bool = true
    
    
    // anynomus login For Reading Database
    func login() {
        self.fetchRecommend()
        self.fetchRecent()
    }

    // Fetching Recommend Data...
    func fetchRecommend() {
        let db = Firestore.firestore()
        db.collection("LIke").document(Auth.auth().currentUser!.uid).collection("items").limit(to: 6).getDocuments {(snap, err) in
            guard let itemData = snap else { return }
            self.recommendItems = itemData.documents.compactMap({
                (doc) -> SongItem? in
                let id = doc.documentID
                let artistName = doc.get("artistName") as! String
                let trackName = doc.get("trackName") as! String
                let artworkUrl = doc.get("artworkUrl") as! String
                let previewUrl = doc.get("previewUrl") as! String
                return SongItem(id: id, trackName: trackName, artistName: artistName,
                                artworkUrl: artworkUrl, previewUrl: previewUrl)
            })
        }
    }
    
    // Fetching Recent Data...
    func fetchRecent() {
        let db = Firestore.firestore()
        db.collection("Replay").document(Auth.auth().currentUser!.uid).collection("items").limit(to: 6).getDocuments{(snap, err) in
            guard let itemData = snap else { return }
            self.recentItems = itemData.documents.compactMap({
                (doc) -> SongItem? in
                let id = doc.documentID
                let artistName = doc.get("artistName") as! String
                let trackName = doc.get("trackName") as! String
                let artworkUrl = doc.get("artworkUrl") as! String
                let previewUrl = doc.get("previewUrl") as! String
                let isLike = doc.get("isLike") as! Bool
                return SongItem(id: id, trackName: trackName, artistName: artistName,
                                artworkUrl: artworkUrl, previewUrl: previewUrl, isLike: isLike)
            })
            self.nowPlaying = self.recentItems[0]
        }
    }
    
    // Fetching Latest Data...
    func touchNowPlaying(item: SongItem) {
        self.nowPlaying = item
    }
    
    //update like status
    func updateLikeStatus(item: SongItem) {
        let db = Firestore.firestore()
        db.collection("Replay").document(Auth.auth().currentUser!.uid).collection("items").document(item.id).updateData([
            "isLike": item.isLike
        ]){
            (err) in
            if err != nil {
                return
            }
        }
        
        db.collection("LIke").document(Auth.auth().currentUser!.uid).collection("items").addDocument(data: [
            "artistName": item.artistName,
            "trackName": item.trackName,
            "artworkUrl": item.artworkUrl,
            "previewUrl": item.previewUrl,
            "isLike": true,
        ]) {
            (err) in
            if err != nil {
                return
            }
        }
    }
}
