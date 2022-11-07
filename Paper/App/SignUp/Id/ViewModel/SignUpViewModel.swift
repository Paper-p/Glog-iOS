//
//  SignUpViewModel.swift
//  Paper
//
//  Created by 선민재 on 2022/10/25.
//

import UIKit
import RxSwift
import RxCocoa

final class SignUpViewModel:ViewModelType {
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }
    
    struct Input{
        
    }
    struct Output{
        
    }
}
