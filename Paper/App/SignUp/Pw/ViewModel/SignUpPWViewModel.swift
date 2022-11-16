//
//  SignUpPWViewModel.swift
//  Paper
//
//  Created by 선민재 on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpPWViewModel: BaseViewModel {
    
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }

    func transVC(input: Input) {
        input.pwnextButtonTap.subscribe(
        onNext: pwnextButton
        ) .disposed(by: disposeBag)
    }
    
    private func pwnextButton() {
        coordinator.pwNextButton()
    }
    
}

extension SignUpPWViewModel: ViewModelType{

    struct Input {
        let pwnextButtonTap: Observable<Void>
    }

    struct Output {
        
    }
}
