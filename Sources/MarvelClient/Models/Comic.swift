//
//  Comic.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public struct Comic: Decodable {
    public let title: String
    public let thumbnail: Artwork
}


public class ComicViewModel: IdentifiableHashable, ObservableObject {
    
    public let id = UUID()
    @Published public var title: String
    @Published public var artwork: ArtworkViewModel
    
    public init(model: Comic) {
        self.title = model.title
        self.artwork = ArtworkViewModel(artWork: model.thumbnail)! // Should not be nil.
    }
}
