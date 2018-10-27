//
//  Series.swift
//  MarvelHeroes
//
//  Created by Lorrayne Paraiso  on 27/10/18.
//  Copyright © 2018 Lorrayne Paraiso. All rights reserved.
//

import Foundation

struct Series: Decodable {
    let id: Int
    let digitalID: Int?
    let name, description, title: String?
    let thumbnail: Thumbnail?

    enum CodingKeys: String, CodingKey {
        case digitalID = "digitalId"
        case description, id, name, title, thumbnail
    }
}
