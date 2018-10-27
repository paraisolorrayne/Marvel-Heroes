//
//  Request.swift
//  MarvelHeroes
//
//  Created by Lorrayne Paraiso  on 27/10/18.
//  Copyright © 2018 Lorrayne Paraiso. All rights reserved.
//

import Foundation

enum Request {
    case character(Int)
    case characters(Int, Int)
    case comics(Int)
    case series(Int)
}

protocol RequestsGateway {
    func loadAll<T: Decodable>(ofType: Request, onComplete: @escaping (Result<T>) -> Void)
}

struct RequestsNetworkGateway: RequestsGateway {

    let ts = 1
    let publicKey = "e150dd3df2d047f9277d8d72caa8f8be"
    let privateKey = "5880584f382029df8c6ab8211a122d0423516330"

    var hash: String {
        let combined = "\(ts)\(privateKey)\(publicKey)"
        let md5Data = combined.toMD5(string: combined)
        let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()

        return md5Hex
    }

    func loadAll<T: Decodable>(ofType: Request, onComplete: @escaping (Result<T>) -> Void) {
        switch ofType {
        case .characters(let limit, let offset):
            guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?orderBy=name&limit=" +
                "\(limit)&offset=\(offset)&apikey=\(publicKey)&hash=\(hash)&ts=\(ts)") else { return }

            RequestAdapter.request(url, onComplete)

        case .character(let id):
            guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters/\(id)?apikey=" +
                "\(publicKey)&hash=\(hash)&ts=\(ts)") else { return }

            RequestAdapter.request(url, onComplete)

        case .comics(let id):
            guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters/\(id)/comics?apikey=" +
                "\(publicKey)&hash=\(hash)&ts=\(ts)") else { return }

            RequestAdapter.request(url, onComplete)

        case .series(let id):
            guard let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters/\(id)/series?apikey=" +
                "\(publicKey)&hash=\(hash)&ts=\(ts)") else { return }

            RequestAdapter.request(url, onComplete)
        }
    }
}
