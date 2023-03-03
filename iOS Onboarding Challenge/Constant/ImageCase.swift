//
//  ImageCase.swift
//  iOS Onboarding Challenge
//
//  Created by 이명진 on 2023/03/04.
//

import UIKit

enum UrlImageCase: Int, CaseIterable {
    
    case firstButton = 0, secondButton,
         thirdButton, fourthButton, fifthButton, allLoad
    
    var url: URL? {
        switch self {
        case .firstButton:
            return URL(string: ImageURL.firstImage)!
        case .secondButton:
            return URL(string: ImageURL.secondImage)!
        case .thirdButton:
            return URL(string: ImageURL.thirdImage)!
        case .fourthButton:
            return URL(string: ImageURL.fourthImage)!
        case .fifthButton:
            return URL(string: ImageURL.fifthImage)!
        case .allLoad:
            return nil
        }
    }
    
    
    
    
}
