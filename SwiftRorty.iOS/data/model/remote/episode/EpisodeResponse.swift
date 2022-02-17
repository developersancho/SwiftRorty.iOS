//
//  EpisodeResponse.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 3.02.2022.
//

import Foundation

struct EpisodeResponse: Codable {
    let pageInfo: PageInfo?
    let results: [EpisodeInfo]?
}
