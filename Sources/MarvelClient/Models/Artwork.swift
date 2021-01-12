//
//  Artwork.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public struct Artwork: Decodable {
    let path: String?
    let imageExtension: String
    
    private enum CodingKeys: String, CodingKey {
        case path,
        imageExtension = "extension"
    }
}

public class ArtworkViewModel: IdentifiableHashable, ObservableObject {
    
    public let id = UUID()
    @Published var path: String
    @Published var extensionType: String
    
    public init?(artWork: Artwork?) {
        guard
            let artWork = artWork,
            let path = artWork.path
        else { return nil }
        self.path = path
        self.extensionType = artWork.imageExtension
    }
    
    public func imagePathFor(variant: ImageVariant) -> String {
        let uri = "\(path)/\(variant.rawValue).\(extensionType)"
        print(uri)
        return uri
    }
}

public enum ImageVariant: String {
    
    // Portrait
    case portraitSmall = "portrait_small"
    case portraitMedium = "portrait_medium"
    case portraitXLarge = "portrait_xlarge"
    case portraitFantastic = "portrait_fantastic"
    case portraitUncanny = "portrait_uncanny"
    case portraitIncredible = "portrait_incredible"

    // Square
    case squareStandardSmall = "standard_small"
    case squareStandardMedium = "standard_medium"
    case squareStandardLarge = "standard_large"
    case squareStandardXLarge = "standard_xlarge"
    case squareStandardFantastic = "standard_fantastic"
    case squareStandardAmazing = "standard_amazing"
    
    // Landscape
    case landscapeSmall = "landscape_small"
    case landscapeMedium = "landscape_medium"
    case landscapeLarge = "landscape_large"
    case landscapeXLarge = "landscape_xlarge"
    case landscapeAmazing = "landscape_amazing"
    case landscapeIncredible = "landscape_incredible"
    
    // Full size images
    case detail
    case fullSizeImage = "full-size image"
}
