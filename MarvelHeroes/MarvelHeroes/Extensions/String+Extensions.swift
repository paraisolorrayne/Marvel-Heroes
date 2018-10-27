//
//  String+Extensions.swift
//  MarvelHeroes
//
//  Created by Lorrayne Paraiso  on 27/10/18.
//  Copyright © 2018 Lorrayne Paraiso. All rights reserved.
//

import Foundation
import CommonCrypto

extension String {
    
    func toMD5(string: String) -> Data {
        let messageData = string.data(using: .utf8)!
        var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = digestData.withUnsafeMutableBytes {digestBytes in
            messageData.withUnsafeBytes {messageBytes in
                CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
            }
        }
        
        return digestData
    }
}
