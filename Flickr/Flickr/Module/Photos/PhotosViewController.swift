//
//  PhotosViewController.swift
//  Flickr
//
//  Created by AkhileshSingh on 14/07/21.
//

import UIKit

class PhotosViewController: UIViewController {
    // MARK: - properties
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: variables
    private let viewModel: PhotosViewModel
    private let assember = Assembler()

    // MARK: - view life cycle functions
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        viewModel = assember.viewModel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    init(viewModel: PhotosViewModel) {
        self.viewModel = assember.viewModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.viewModel = assember.viewModel()
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        getPhotos()
    }

    // MARK: - other functions
    private func setupCollectionView() {
        collectionView.register(type: ImageCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func getPhotos() {
        viewModel.getPhotos { [weak self] (result) in
            switch result {
            case .success(_):
                self?.reloadPage()
            case .failure(_):
                break
            }
        }
    }
    
    private func reloadPage() {
        self.collectionView.reloadData()
    }
}

// MARK: - Data Source and Delegate
extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(type: ImageCollectionViewCell.self, indexPath: indexPath)
        cell.loadImage(url: viewModel.getPhotoForIndexPath(indexPath)?.url_m ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        let scaleFactor = (screenWidth / 2)
        
        return CGSize(width: scaleFactor, height: scaleFactor)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
    }

}
