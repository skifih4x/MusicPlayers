//
//  Albums.swift
//  MusicPlayers
//
//  Created by Артем Орлов on 19.07.2022.
//

import Foundation

struct Albums: Codable {
    let results: [Results]
}

struct Results: Codable {
    let artistName: String
    let collectionName: String
    let artworkUrl100: String
}
