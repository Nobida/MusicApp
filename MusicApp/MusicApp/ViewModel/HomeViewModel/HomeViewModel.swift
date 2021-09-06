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
    @Published var items: [Artist] = []
    @Published var recommendItems: [Artist] = []
    @Published var recentItems: [Artist] = []
    @Published var latestItem = Artist(id: "", imageName: "", name: "")

    
    // anynomus login For Reading Database
    func login() {
        self.fetchData()
        self.fetchRecommend()
        self.fetchRecent()
    }
    
    // Fetching Items Data...
    func fetchData() {
        let db = Firestore.firestore()
        db.collection("Recent").getDocuments {(snap, err) in
            guard let itemData = snap else { return }
            self.items = itemData.documents.compactMap({
                (doc) -> Artist? in
                let id = doc.documentID
                let artist = doc.get("artist") as! String
                let image = doc.get("image") as! String                
                return Artist(id: id, imageName: image, name: artist)
            })
        }
    }
    
    // Fetching Recommend Data...
    func fetchRecommend() {
        let db = Firestore.firestore()
        db.collection("Recommend").getDocuments {(snap, err) in
            guard let itemData = snap else { return }
            self.recommendItems = itemData.documents.compactMap({
                (doc) -> Artist? in
                let id = doc.documentID
                let artist = doc.get("artist") as! String
                let image = doc.get("image") as! String
                return Artist(id: id, imageName: image, name: artist)
            })
        }
    }
    
    // Fetching Recent Data...
    func fetchRecent() {
        let db = Firestore.firestore()
        db.collection("Replay").document(Auth.auth().currentUser!.uid).collection("items").limit(to: 6).getDocuments{(snap, err) in
            guard let itemData = snap else { return }
            self.recentItems = itemData.documents.compactMap({
                (doc) -> Artist? in
                let id = doc.documentID
                let artist = doc.get("artistName") as! String
                let image = doc.get("artworkUrl") as! String
                return Artist(id: id, imageName: image, name: artist)
            })
            self.latestItem = self.recentItems[0]
            print(self.latestItem)
        }
    }
    
    // Fetching Latest Data...
    
    
    
    
    

}
