//
//  MarvelService.swift
//  MarvelClient
//
//  Created by James Rochabrun on 1/11/21.
//

import Foundation

public class MarvelService: GenericAPI {
    
    struct Keys {
        static var privateKey: String = ""
        static var publicKey: String = ""
    }
    
    public lazy var offset = 0
    public lazy var total = 0
    public lazy var limit = 20
    public var session: URLSession
    
    private func timestamp() -> String {
        String(format: "%.0f", NSDate().timeIntervalSince1970)
    }
    
    internal var parameters: String {
        let authentication = (timestamp() + Keys.privateKey + Keys.publicKey).md5
        return "?" + ServiceParameters.timestamp + "=" + timestamp() + "&"
            + ServiceParameters.apiKey + "=" + Keys.publicKey + "&"
            + ServiceParameters.hash + "=" + authentication
    }
    
    public init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    public convenience init(privateKey: String, publicKey: String) {
        self.init(configuration: .default)
        Keys.privateKey = privateKey
        Keys.publicKey = publicKey
    }
    
    public func getParameters() -> String {
         parameters
    }
    
    internal func url(withPath path: String) -> URL? {
         URL(string:
                Service.base + path + parameters + "&" + ServiceParameters.offset + "=" + "\(offset)"
                + "&" + ServiceParameters.limit + "=" + "\(limit)")
    }
    
    public func fetch<Data: DataProtocol>(_ data: Data.Type, completion: @escaping (Result<[Data.DataResource.Model], APIError>) -> Void) {
        
        guard
            let marvelResource = MarvelResources(T: data.DataResource),
            let url = url(withPath: marvelResource.rawValue) else { return }
        let request = URLRequest(url: url)
        fetch(with: request) {
            $0 as? Data
        } completion: {
            switch $0 {
            case .success(let data):
                completion(.success(data.data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
