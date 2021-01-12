//
//  MarvelData.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public protocol DataProtocol: Decodable {
    associatedtype DataResource: Resource
    var data: DataResource { get }
}

public struct MarvelData<DataResource: Resource>: DataProtocol {
    public let data: DataResource
}
