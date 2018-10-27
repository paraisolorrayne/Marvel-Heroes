//
//  MarvelAPI.swift
//  MarvelHeroes
//
//  Created by Lorrayne Paraiso  on 27/10/18.
//  Copyright © 2018 Lorrayne Paraiso. All rights reserved.
//

import Foundation

struct MarvelAPI<T: Decodable>: Decodable {
    let data: DataResponse<T>
}
