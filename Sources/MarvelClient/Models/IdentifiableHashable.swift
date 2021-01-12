//
//  IdentifiableHashable.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

/// Protocol composition with an extension to provide `Hashable` conformance to an object.
public protocol IdentifiableHashable: Hashable & Identifiable {}
public extension IdentifiableHashable {
    
    static func == (lhs: Self, rhs: Self) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
