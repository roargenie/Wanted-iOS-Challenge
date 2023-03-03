//
//  MainViewModel.swift
//  iOS Onboarding Challenge
//
//  Created by 이명진 on 2023/03/03.
//

import Foundation
import RxCocoa
import RxSwift

final class MainViewModel {
    
    private let firstLoadImageURL = BehaviorRelay<Bool>(value: false)
    private let secondLoadImageURL = BehaviorRelay<Bool>(value: false)
    private let thirdLoadImageURL = BehaviorRelay<Bool>(value: false)
    private let fourthLoadImageURL = BehaviorRelay<Bool>(value: false)
    private let fifthLoadImageURL = BehaviorRelay<Bool>(value: false)
    private let allLoadImageURL = BehaviorRelay<Bool>(value: false)
    
    struct Input {
        let firstLoadButtonTap: Signal<Void>
        let secondLoadButtonTap: Signal<Void>
        let thirdLoadButtonTap: Signal<Void>
        let fourthLoadButtonTap: Signal<Void>
        let fifthLoadButtonTap: Signal<Void>
        let allLoadButtonTap: Observable<Void>
    }
    
    struct Output {
        let firstLoadImageURL: Driver<Bool>
        let secondLoadImageURL: Driver<Bool>
        let thirdLoadImageURL: Driver<Bool>
        let fourthLoadImageURL: Driver<Bool>
        let fifthLoadImageURL: Driver<Bool>
        let allLoadImageURL: Driver<Bool>
    }
    var disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        
        input.firstLoadButtonTap
            .withUnretained(self)
            .emit { vm, value in
                vm.firstLoadImageURL.accept(!vm.firstLoadImageURL.value)
            }
            .disposed(by: disposeBag)

        input.secondLoadButtonTap
            .withUnretained(self)
            .emit { vm, value in
                vm.secondLoadImageURL.accept(!vm.secondLoadImageURL.value)
            }
            .disposed(by: disposeBag)

        input.thirdLoadButtonTap
            .withUnretained(self)
            .emit { vm, value in
                vm.thirdLoadImageURL.accept(!vm.thirdLoadImageURL.value)
            }
            .disposed(by: disposeBag)

        input.fourthLoadButtonTap
            .withUnretained(self)
            .emit { vm, value in
                vm.fourthLoadImageURL.accept(!vm.fourthLoadImageURL.value)
            }
            .disposed(by: disposeBag)

        input.fifthLoadButtonTap
            .withUnretained(self)
            .emit { vm, value in
                vm.fifthLoadImageURL.accept(!vm.fifthLoadImageURL.value)
            }
            .disposed(by: disposeBag)

        input.allLoadButtonTap
            .withLatestFrom(allLoadImageURL)
            .withUnretained(self)
            .bind { vm, value in
                vm.allLoadImageURL.accept(!value)
                vm.firstLoadImageURL.accept(!value)
                vm.secondLoadImageURL.accept(!value)
                vm.thirdLoadImageURL.accept(!value)
                vm.fourthLoadImageURL.accept(!value)
                vm.fifthLoadImageURL.accept(!value)
            }
            .disposed(by: disposeBag)
        
//        Observable.zip(
//            firstLoadImageURL,
//            secondLoadImageURL,
//            thirdLoadImageURL,
//            fourthLoadImageURL,
//            fifthLoadImageURL)
//        .map { $0 && $1 && $2 && $3 && $4 }
//        .withUnretained(self)
//        .bind { vm, value in
//            print(value)
//            vm.allLoadImageURL.accept(value)
//        }
//        .disposed(by: disposeBag)
        
        return Output(
            firstLoadImageURL: firstLoadImageURL.asDriver(onErrorJustReturn: false),
            secondLoadImageURL: secondLoadImageURL.asDriver(onErrorJustReturn: false),
            thirdLoadImageURL: thirdLoadImageURL.asDriver(onErrorJustReturn: false),
            fourthLoadImageURL: fourthLoadImageURL.asDriver(onErrorJustReturn: false),
            fifthLoadImageURL: fifthLoadImageURL.asDriver(onErrorJustReturn: false),
            allLoadImageURL: allLoadImageURL.asDriver(onErrorJustReturn: false))
    }
    
}



