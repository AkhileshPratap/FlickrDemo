//
//  Extension.swift
//  Flickr
//
//  Created by AkhileshSingh on 14/07/21.
//

import UIKit
import Kingfisher

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.identifer, for: indexPath) as! T
    }
    
    func register<T: UICollectionViewCell>(type: T.Type) {
        register(T.nib(), forCellWithReuseIdentifier: T.identifer)
    }
    
}

extension UIView {

    static var identifer: String {
        return "\(self)"
    }

    static func nib() -> UINib {
        return UINib(nibName: identifer, bundle: nil)
    }
    
}

extension UIWindow {
    static var window: UIWindow? {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}

extension UIImageView {
    func setImage(urlString: String, placeHolder: UIImage? = nil) {
        guard let url = URL(string: urlString) else {
            self.image = placeHolder
            return
        }
        let imageResource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.setImage(with: imageResource, placeholder: placeHolder)
    }
}

