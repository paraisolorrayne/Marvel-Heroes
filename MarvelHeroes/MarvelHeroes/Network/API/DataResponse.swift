//
//  DataResponse.swift
//  MarvelHeroes
//
//  Created by Lorrayne Paraiso  on 27/10/18.
//  Copyright © 2018 Lorrayne Paraiso. All rights reserved.
//

import Foundation

struct DataResponse<T: Decodable>: Decodable {
    let items: [T]

    enum CodingKeys: String, CodingKey {
        case items = "results"
    }
}
