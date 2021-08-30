//
//  SearchDataModel.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import Foundation

class DataModel {
    
    private var dataTask: URLSessionDataTask?
    
    // Creates URL and send request
    func loadSongs(searchTerm: String, completion: @escaping(([Song]) -> Void)) {
        dataTask?.cancel()
        guard let url = buildUrl(forTerm: searchTerm) else {
            completion([])
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
        
        
        if let songResponse = try? JSONDecoder().decode(SongResponse.self, from: data) {
            completion(songResponse.songs)
        }
    }
        dataTask?.resume()
    }
    // building URL based on the search term
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
}
