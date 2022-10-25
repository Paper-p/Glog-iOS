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
    private let disposeBag = DisposeBag()
    let coordinator: IntroCoordinator

    init(coordinator: IntroCoordinator) {
        self.coordinator = coordinator
    }

    struct Input {
        let signInButtonDidTap: Observable<Void>
        let signUpButtonDidTap: Observable<Void>
    }

    struct Output {
    }

    func transVC(_ input: Input) {

        input.signInButtonDidTap
            .bind(with: self)  { owner, _ in
                owner.coordinator.pushSignInVC()
            }
            .disposed(by: disposeBag)
        
        input.signUpButtonDidTap
            .bind(with: self)  { owner, _ in
                owner.coordinator.pushSignUpVC()
            }
            .disposed(by: disposeBag)
    }
}
