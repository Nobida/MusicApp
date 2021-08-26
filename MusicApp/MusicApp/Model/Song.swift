//
//  Song.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/26.
//

import Foundation

class Song: Decodable {
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
