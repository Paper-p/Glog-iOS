//
//  IntroViewModel.swift
//  Paper
//
//  Created by 선민재 on 2022/10/02.
//

import UIKit
import RxSwift
import RxCocoa

final class IntroViewModel {
    var coordinator: IntroCoordinator
    var disposeBag = DisposeBag()
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }

    struct Input {
        let signInButtonTap: Observable<Void>
        let signUpButtonTap: Observable<Void>
    }

    struct Output {
        
    }

    func transVC(input: Input) {
        input.signInButtonTap.subscribe(
        onNext: pushSignInVC
        ) .disposed(by: disposeBag)
        
        input.signUpButtonTap.subscribe(
        onNext: pushSignUpVC
        ) .disposed(by: disposeBag)
    }
    
    private func pushSignInVC() {
        coordinator.pushSignInVC()
    }
    private func pushSignUpVC() {
        coordinator.pushSignUpVC()
    }
    
}
