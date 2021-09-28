//
//  SearchViewModel.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/1.
//


import MediaPlayer
import AVKit
import Firebase

class SongViewModel: Identifiable, ObservableObject {
    let id: Int
    let trackName: String
    let artistName: String
    let previewUrl: String
    

    init(song: Song) {
        self.id = song.id
        self.trackName = song.trackName
        self.artistName = song.artistName
        self.previewUrl = song.previewUrl
    }
}

struct SongResponse: Decodable {
    let songs: [Song]
    
    enum CodingKeys: String, CodingKey {
        case songs = "results"
    }
}


struct Song: Identifiable,Decodable {
    let id: Int
    let trackName: String
    let artistName: String
    let artworkUrl: String
    let previewUrl: String
    

    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName
        case artistName
        case artworkUrl = "artworkUrl60"
        case previewUrl
    }
}


import Foundation

class SearchViewModel: NSObject, ObservableObject {
    
    //ItemData...
    @Published var songs: [Song] = []
    @Published var search = ""
    
    func fetch() {
        guard let url = self.buildUrl(forTerm: search) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            //Convert to JSON
            do {
                let s = try JSONDecoder().decode(SongResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.songs = s.songs
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    private func buildUrl(forTerm searchTerm: String) -> URL? {
        guard !searchTerm.isEmpty else { return nil }
        
        let queryItems = [
        URLQueryItem(name: "term", value: searchTerm),
        URLQueryItem(name: "entity", value: "song"),
        ]
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = queryItems
        
        return components?.url
    }

    func login() {
        
        Auth.auth().signInAnonymously {(res, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            print("Success = \(res!.user.uid)")
        }
    }
}
    
    
    

