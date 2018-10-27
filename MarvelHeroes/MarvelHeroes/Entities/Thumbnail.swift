//
//  Thumbnail.swift
//  MarvelHeroes
//
//  Created by Lorrayne Paraiso  on 27/10/18.
//  Copyright © 2018 Lorrayne Paraiso. All rights reserved.
//

import Foundation

struct Thumbnail: Decodable {
    let path: String?
    let thumbnailExtension: Extension?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

//swiftlint:disable redundant_string_enum_value
enum Extension: String, Decodable {
    case gif = "gif"
    case jpg = "jpg"
    case png = "png"
}
