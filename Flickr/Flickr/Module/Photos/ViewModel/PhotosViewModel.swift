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
    private let service: APIServiceProtocol
    private var photos: [Photo] = []

    // MARK: - initialize view model
    init(service: APIServiceProtocol?) {
        self.service = service!
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

    func getPhotos(completion: @escaping (Result<Bool, Error>) -> Void) {
        service.getPhotos { [weak self](result) in
            switch result {
            case .success(let model):
                self?.photos = model?.photos?.photo ?? []
                let status = ((self?.photos ?? []).count > 0)
                completion(.success(status))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
