//
//  ImageCollectionViewCell.swift
//  Flickr
//
//  Created by AkhileshSingh on 14/07/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: cell setup
    func loadImage(url: String) {
    }
}
