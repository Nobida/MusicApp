//
//  SongResponse.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import Foundation


struct SongResponse: Decodable {
    let songs: [Song]
    
    enum CodingKeys: String, CodingKey {
        case songs = "results"
    }
}
