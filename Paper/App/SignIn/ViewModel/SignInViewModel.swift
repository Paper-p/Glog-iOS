//
//  SignInViewModel.swift
//  Paper
//
//  Created by 선민재 on 2022/10/25.
//


import UIKit
import RxSwift
import RxCocoa

final class SignInViewModel:BaseViewModel {
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }
    
    func transVC(input: Input) {
        input.signInButtonTap.subscribe(
        onNext: signInButton
        ) .disposed(by: disposeBag)
    }
    
    private func signInButton() {
        coordinator.pushMainVC()
    }
    
}

extension SignInViewModel: ViewModelType{

    struct Input {
        let signInButtonTap: Observable<Void>
    }

    struct Output {
        
    }
}
