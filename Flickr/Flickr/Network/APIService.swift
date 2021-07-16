//
//  APIService.swift
//  Flickr
//
//  Created by AkhileshSingh on 15/07/21.
//

import Foundation

protocol APIServiceProtocol {
    func getPhotos(completion: @escaping (Result<PhotosBaseModel?, Error>) -> Void)
}

struct PhotoRequest: URLQueryRequest {
    var path: Path {
        return .photos
    }
}

struct APIService: APIServiceProtocol {
    
    let fetcher: Fetcher
    
    init(fetcher: Fetcher) {
        self.fetcher = fetcher
    }
    
    func getPhotos(completion: @escaping (Result<PhotosBaseModel?, Error>) -> Void) {
        let responder = Responder(completion: completion)
        fetcher.fetch(request: PhotoRequest(), responder: responder)
    }
}
