//
//  EmptyStateView.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/8/30.
//

import SwiftUI


struct EmptyStateView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "music.note")
                .font(.system(size: 85))
                .padding(.bottom)
                Text("Start your search for music")
                .font(.title)
            Spacer()
        }
        .padding()
        .foregroundColor(Color(.systemIndigo))
    }
}
