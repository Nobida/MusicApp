//
//  SongViewModel.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/26.
//

import Foundation
import Combine
import SwiftUI


class SongViewModel: Identifiable, ObservableObject {
    let id: Int
    let trackName: String
    let artistName: String
    let previewUrl: String
    @Published var artwork: Image?
    
    init(song: Song) {
        self.id = song.id
        self.trackName = song.trackName
        self.artistName = song.artistName
        self.previewUrl = song.previewUrl
    }
}
