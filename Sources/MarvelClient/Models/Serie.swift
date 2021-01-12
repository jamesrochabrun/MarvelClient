//
//  Serie.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public struct Serie: Decodable {
    public let title: String
    public let thumbnail: Artwork
}

public class SerieViewModel: IdentifiableHashable, ObservableObject {
    
    public let id = UUID()
    @Published public var title: String
    @Published public var artwork: ArtworkViewModel
    
    public init(model: Serie) {
        self.title = model.title
        self.artwork = ArtworkViewModel(artWork: model.thumbnail)! // Should not be nil.
    }
}



