//
//  LoadButton.swift
//  iOS Onboarding Challenge
//
//  Created by 이명진 on 2023/03/03.
//

import UIKit

final class LoadButton: UIButton {
    
    override var isSelected: Bool {
        didSet {
            isSelected ? setStatus(.unload) : setStatus(.load)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    convenience init(title text: String) {
        self.init()
        setTitle(text, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    func setStatus(_ status: ButtonStatus) {
        setTitle(status.title, for: .normal)
    }
    
}
