//
//  Service.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public struct Service {
    static let base: String = "https://gateway.marvel.com/v1/public/"
}

public struct ServiceParameters {
    static let apiKey: String = "apikey"
    static let hash: String = "hash"
    static let timestamp: String = "ts"
    static let offset: String = "offset"
    static let limit: String = "limit"
}
