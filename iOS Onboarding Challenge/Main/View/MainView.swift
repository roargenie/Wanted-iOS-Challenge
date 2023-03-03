//
//  MainView.swift
//  iOS Onboarding Challenge
//
//  Created by 이명진 on 2023/03/03.
//

import UIKit
import Then
import SnapKit

class MainView: UIView {
    
    let firstImageView: CustomImageView = CustomImageView().then {
        $0.tag = 0
    }
    let secondImageView: CustomImageView = CustomImageView().then {
        $0.tag = 1
    }
    let thirdImageView: CustomImageView = CustomImageView().then {
        $0.tag = 2
    }
    let fourthImageView: CustomImageView = CustomImageView().then {
        $0.tag = 3
    }
    let fifthImageView: CustomImageView = CustomImageView().then {
        $0.tag = 4
    }
    
    lazy var imageStackView: UIStackView = UIStackView(
        arrangedSubviews: [firstImageView, secondImageView, thirdImageView, fourthImageView, fifthImageView]).then {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.spacing = 12
            $0.contentMode = .scaleAspectFit
    }
    
    let firstLoadButton: LoadButton = LoadButton(title: "Load")
    let secondLoadButton: LoadButton = LoadButton(title: "Load")
    let thirdLoadButton: LoadButton = LoadButton(title: "Load")
    let fourthLoadButton: LoadButton = LoadButton(title: "Load")
    let fifthLoadButton: LoadButton = LoadButton(title: "Load")
    let allLoadButton: LoadButton = LoadButton(title: "Load All Images")
    
    let firstImageProgressBar: UIProgressView = UIProgressView().then {
        $0.progressViewStyle = .default
        $0.progress = 0.5
    }
    let secondImageProgressBar: UIProgressView = UIProgressView().then {
        $0.progressViewStyle = .default
        $0.progress = 0.5
    }
    let thirdImageProgressBar: UIProgressView = UIProgressView().then {
        $0.progressViewStyle = .default
        $0.progress = 0.5
    }
    let fourthImageProgressBar: UIProgressView = UIProgressView().then {
        $0.progressViewStyle = .default
        $0.progress = 0.5
    }
    let fifthImageProgressBar: UIProgressView = UIProgressView().then {
        $0.progressViewStyle = .default
        $0.progress = 0.5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        [firstLoadButton,
         secondLoadButton,
         thirdLoadButton,
         fourthLoadButton,
         fifthLoadButton,
         allLoadButton,
         imageStackView,
         firstImageProgressBar,
         secondImageProgressBar,
         thirdImageProgressBar,
         fourthImageProgressBar,
         fifthImageProgressBar].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        imageStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalTo(allLoadButton.snp.top).offset(-12)
            make.width.equalTo(snp.width).multipliedBy(0.3)
        }
        firstLoadButton.snp.makeConstraints { make in
            make.centerY.equalTo(firstImageView.snp.centerY)
            make.trailing.equalToSuperview().inset(12)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        secondLoadButton.snp.makeConstraints { make in
            make.centerY.equalTo(secondImageView.snp.centerY)
            make.trailing.equalToSuperview().inset(12)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        thirdLoadButton.snp.makeConstraints { make in
            make.centerY.equalTo(thirdImageView.snp.centerY)
            make.trailing.equalToSuperview().inset(12)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        fourthLoadButton.snp.makeConstraints { make in
            make.centerY.equalTo(fourthImageView.snp.centerY)
            make.trailing.equalToSuperview().inset(12)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        fifthLoadButton.snp.makeConstraints { make in
            make.centerY.equalTo(fifthImageView.snp.centerY)
            make.trailing.equalToSuperview().inset(12)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        allLoadButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(12)
            make.horizontalEdges.equalToSuperview().inset(12)
            make.height.equalTo(36)
        }
        firstImageProgressBar.snp.makeConstraints { make in
            make.leading.equalTo(imageStackView.snp.trailing).offset(4)
            make.trailing.equalTo(firstLoadButton.snp.leading).offset(-4)
            make.centerY.equalTo(firstLoadButton.snp.centerY)
            make.height.equalTo(8)
        }
        secondImageProgressBar.snp.makeConstraints { make in
            make.leading.equalTo(imageStackView.snp.trailing).offset(4)
            make.trailing.equalTo(secondLoadButton.snp.leading).offset(-4)
            make.centerY.equalTo(secondLoadButton.snp.centerY)
            make.height.equalTo(8)
        }
        thirdImageProgressBar.snp.makeConstraints { make in
            make.leading.equalTo(imageStackView.snp.trailing).offset(4)
            make.trailing.equalTo(thirdLoadButton.snp.leading).offset(-4)
            make.centerY.equalTo(thirdLoadButton.snp.centerY)
            make.height.equalTo(8)
        }
        fourthImageProgressBar.snp.makeConstraints { make in
            make.leading.equalTo(imageStackView.snp.trailing).offset(4)
            make.trailing.equalTo(fourthLoadButton.snp.leading).offset(-4)
            make.centerY.equalTo(fourthLoadButton.snp.centerY)
            make.height.equalTo(8)
        }
        fifthImageProgressBar.snp.makeConstraints { make in
            make.leading.equalTo(imageStackView.snp.trailing).offset(4)
            make.trailing.equalTo(fifthLoadButton.snp.leading).offset(-4)
            make.centerY.equalTo(fifthLoadButton.snp.centerY)
            make.height.equalTo(8)
        }
        
    }
    
}
