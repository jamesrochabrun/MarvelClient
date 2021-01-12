//
//  Resources.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public protocol Resource: Decodable {
    associatedtype Model
    var offset: Int { get }
    var limit: Int { get }
    var count: Int { get }
    var total: Int { get }
    var results: [Model] { get }
}

public struct Resources<Model: Decodable>: Resource {
    
    public let offset: Int
    public let limit: Int
    public let count: Int
    public let total: Int
    public var results: [Model]
}

