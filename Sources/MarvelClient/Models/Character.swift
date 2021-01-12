//
//  Character.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public struct Character: Decodable {
    
    let id: Int?
    let name: String?
    let characterDescription: String
    let modified: String?
    let resourceURI: String?
    let urls: [URLKind]?
    let thumbnail: Artwork?
    
    let comicsInfo: Comics
    let seriesInfo: Series
    var comics: [Comic] = []
    var series: [Serie] = []

    var comicsCollectionUrl: URL {
        return comicsInfo.collectionURI
    }

    var seriesCollectionUrl: URL {
        return seriesInfo.collectionURI
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, thumbnail, id, modified, resourceURI, urls
        case characterDescription = "description"
        case comicsInfo = "comics"
        case seriesInfo = "series"
    }
}

public class CharacterViewModel: IdentifiableHashable, ObservableObject {

    public let id = UUID()

    @Published public var name: String
    @Published public var description: String
    @Published public var artwork: ArtworkViewModel?
    
    public init(model: Character) {
        name = model.name ?? "no name provided"
        description = model.characterDescription
        artwork = ArtworkViewModel(artWork: model.thumbnail)
    }
}
