//
//  Comics.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public struct Comics: Decodable {
    public let available: Int
    public let collectionURI: URL
}
