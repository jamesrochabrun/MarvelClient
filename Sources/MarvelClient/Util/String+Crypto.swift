//
//  String+Crypto.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation
import CommonCrypto
import UIKit

public extension String {

    var md5: String {
        let data = Data(utf8)
        var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        data.withUnsafeBytes { buffer in
            _ = CC_MD5(buffer.baseAddress, CC_LONG(buffer.count), &hash)
        }
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }
}
