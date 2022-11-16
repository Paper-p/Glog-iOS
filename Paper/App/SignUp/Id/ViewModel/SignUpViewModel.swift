//
//  SignUpViewModel.swift
//  Paper
//
//  Created by 선민재 on 2022/10/25.
//
import UIKit
import RxSwift
import RxCocoa

final class SignUpViewModel: BaseViewModel {
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }

    func transVC(input: Input) {
        input.nextButtonTap.subscribe(
        onNext: nextButton
        ) .disposed(by: disposeBag)
    }
    
    private func nextButton() {
        coordinator.idNextButton()
    }
    
}
extension SignUpViewModel: ViewModelType{

    struct Input {
        let nextButtonTap: Observable<Void>
    }

    struct Output {
        
    }
}
