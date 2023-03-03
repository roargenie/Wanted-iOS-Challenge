//
//  ImageStatus.swift
//  iOS Onboarding Challenge
//
//  Created by 이명진 on 2023/03/04.
//

import UIKit


enum ImageStatus {
    
    case load(_ case: UrlImageCase, _ imageView: UIImageView)
    case unload
    
    var image: Any {
        switch self {
        case .load(let imageCase, let imageView):
            return loadImage(url: imageCase.url, imageView: imageView)
        case .unload:
            return UIImage(systemName: "photo")!
        }
    }
    
    func loadImage(url: URL, imageView: UIImageView) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageView.image = image
                    }
                }
            }
        }
    }
    
}
