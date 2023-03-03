//
//  ButtonStatus.swift
//  iOS Onboarding Challenge
//
//  Created by 이명진 on 2023/03/04.
//

import Foundation

enum ButtonStatus {
    case load
    case unload
    
    var title: String {
        switch self {
        case .load:
            return "Load"
        case .unload:
            return "UnLoad"
        }
    }
    
}
