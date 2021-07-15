//
//  PhotosViewModel.swift
//  Flickr
//
//  Created by AkhileshSingh on 14/07/21.
//

import UIKit

protocol PhotosUseCase {
    func numberOfRows() -> Int
    func getPhotoForIndexPath(_ indexPath: IndexPath) -> Photo?
    func getPhotos(completion: @escaping (Result<Bool, Error>) -> Void)
}

class PhotosViewModel: PhotosUseCase {

    // MARK: properties
    private var photos: [Photo] = []

    // MARK: - initialize view model
    init() {
    }
    
}

// MARK: - protocol function implementation
extension PhotosViewModel {

    func numberOfRows() -> Int {
        return photos.count
    }

    func getPhotos() -> [Photo] {
        return photos
    }

    func getPhotoForIndexPath(_ indexPath: IndexPath) -> Photo? {
        if photos.count > 0 {
            return photos[indexPath.row]
        }
        return nil
    }

    //
    func getPhotos(completion: @escaping (Result<Bool, Error>) -> Void) {

    }
}
