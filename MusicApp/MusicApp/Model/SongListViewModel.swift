//
//  SongListViewModel.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/26.
//

import Combine
import Foundation
import SwiftUI

class SongListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published public private(set) var songs: [SongViewModel] = []

    
    init() {

    }
    

}
