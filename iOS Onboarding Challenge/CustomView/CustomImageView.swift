//
//  CustomImageView.swift
//  iOS Onboarding Challenge
//
//  Created by 이명진 on 2023/03/03.
//

import UIKit

final class CustomImageView: UIImageView {
    
    var loaded: Bool = false {
        didSet {
            loaded ? setImageStatus(.load(UrlImageCase(rawValue: self.tag)!, self)) : setImageStatus(.unload)
        }
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
    }
    
    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImageStatus(_ status: ImageStatus) {
        image = status.image as? UIImage
    }
    
}
