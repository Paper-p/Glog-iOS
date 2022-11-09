//
//  SignUpNicknameViewModel.swift
//  Paper
//
//  Created by 선민재 on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpNicknameViewModel:BaseViewModel{
    
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }

    func transVC(input: Input) {
        
    }
    
}

extension SignUpNicknameViewModel: ViewModelType{

    struct Input {

    }

    struct Output {
        
    }
}
