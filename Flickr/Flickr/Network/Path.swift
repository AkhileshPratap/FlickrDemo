//
//  Path.swift
//  Flickr
//
//  Created by AkhileshSingh on 15/07/21.
//

import Foundation

enum Path: String {
    case baseURL = "https://api.flickr.com/services/"
    case photos = "rest?api_key=b234a3173e79893cebf7b191ee8dbd30&method=flickr.photos.search&tags=Electrolux&format=json&nojsoncallback=true&extras=media&extras=url_sq&extras=url_m&per_page=20&page=1"
    
    var url: URL? {
        return URL(string: self.rawValue, relativeTo: URL.init(string: Path.baseURL.rawValue))
    }
    
    var value: String {
        return self.rawValue
    }
}
