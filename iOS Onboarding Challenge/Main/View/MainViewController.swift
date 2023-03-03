//
//  MainViewController.swift
//  iOS Onboarding Challenge
//
//  Created by 이명진 on 2023/03/03.
//

import UIKit
import RxCocoa
import RxSwift

class MainViewController: UIViewController {
    
    //MARK: - Properties

    private var mainView: MainView
    private let viewModel: MainViewModel
    private var disposeBag = DisposeBag()
    
    //MARK: - Init
    
    init(mainView: MainView, viewModel: MainViewModel) {
        self.mainView = mainView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bind()
    }
    
    //MARK: - Method

    private func bind() {
        let input = MainViewModel.Input(
            firstLoadButtonTap: mainView.firstLoadButton.rx.tap.asSignal(),
            secondLoadButtonTap: mainView.secondLoadButton.rx.tap.asSignal(),
            thirdLoadButtonTap: mainView.thirdLoadButton.rx.tap.asSignal(),
            fourthLoadButtonTap: mainView.fourthLoadButton.rx.tap.asSignal(),
            fifthLoadButtonTap: mainView.fifthLoadButton.rx.tap.asSignal(),
            allLoadButtonTap: mainView.allLoadButton.rx.tap.asObservable())
        let output = viewModel.transform(input: input)
        
        output.firstLoadImageURL
            .drive(mainView.firstLoadButton.rx.isSelected, mainView.firstImageView.rx.loaded)
            .disposed(by: disposeBag)
        
        output.secondLoadImageURL
            .drive(mainView.secondLoadButton.rx.isSelected,
                   mainView.secondImageView.rx.loaded)
            .disposed(by: disposeBag)
        
        output.thirdLoadImageURL
            .drive(mainView.thirdLoadButton.rx.isSelected,
                   mainView.thirdImageView.rx.loaded)
            .disposed(by: disposeBag)
        
        output.fourthLoadImageURL
            .drive(mainView.fourthLoadButton.rx.isSelected,
                   mainView.fourthImageView.rx.loaded)
            .disposed(by: disposeBag)
        
        output.fifthLoadImageURL
            .drive(mainView.fifthLoadButton.rx.isSelected,
                   mainView.fifthImageView.rx.loaded)
            .disposed(by: disposeBag)
        
        output.allLoadImageURL
            .drive(mainView.firstImageView.rx.loaded,
                   mainView.secondImageView.rx.loaded,
                   mainView.thirdImageView.rx.loaded,
                   mainView.fourthImageView.rx.loaded,
                   mainView.fifthImageView.rx.loaded)
            .disposed(by: disposeBag)
        
        
        
    }
    
    
    
}
