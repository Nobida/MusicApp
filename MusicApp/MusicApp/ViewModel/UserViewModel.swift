//
//  UserViewModel.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/3.
//

import Foundation

class UserViewModel: NSObject, ObservableObject {
    
    //ItemData...
    @Published var songs: [Song] = []
    @Published var search = ""
    

}
