//
//  MarvelResources.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public enum MarvelResources: String {
    case characters
    case series
    case comics
}

public extension MarvelResources {
    
    init?(T: Decodable.Type) {
        switch T {
        case is Resources<Character>.Type: self = .characters
        case is Resources<Serie>.Type: self = .series
        case is Resources<Comic>.Type: self = .comics
        default: return nil
        }
    }
}
