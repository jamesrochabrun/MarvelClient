//
//  Comic.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public struct Comic: Decodable {
    let title: String
    let thumbnail: Artwork
}


public class ComicViewModel: IdentifiableHashable, ObservableObject {
    
    public let id = UUID()
    @Published var title: String
    @Published var artwork: ArtworkViewModel
    
    public init(model: Comic) {
        self.title = model.title
        self.artwork = ArtworkViewModel(artWork: model.thumbnail)! // Should not be nil.
    }
}
