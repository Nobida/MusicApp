//
//  Artist.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import Foundation

struct Artist: Identifiable {
    
    var id: String
    var imageName: String
    var name: String
}

struct SongItem: Identifiable {
    
    var id: String
    var trackName: String
    var artistName: String
    var artworkUrl: String
    var previewUrl: String
    var isLike: Bool = false
    
}



