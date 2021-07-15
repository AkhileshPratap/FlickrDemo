//
//  PhotosBaseModel.swift
//  Flickr
//
//  Created by AkhileshSingh on 14/07/21.
//

import UIKit
// https://api.flickr.com/services/rest?api_key=b234a3173e79893cebf7b191ee8dbd30&method=flickr.photos.search&tags=Electrolux&format=json&nojsoncallback=true&extras=media&extras=url_sq&extras=url_m&per_page=20&page=1

struct PhotosBaseModel: Codable {
    let photos: Photos?
    let stat: String?
}

struct Photos: Codable {
    let page: Int?
    let pages: Int?
    let perpage: Int?
    let total: Int?
    let photo: [Photo]?
}

struct Photo: Codable {
    let id: String?
    let owner: String?
    let secret: String?
    let server: String?
    let farm: Int?
    let title: String?
    let ispublic: Int?
    let isfriend: Int?
    let isfamily: Int?
    let url_m: String?
    let height_m: Int?
    let width_m: Int?
}
