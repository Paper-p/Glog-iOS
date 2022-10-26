//
//  BaseViewModel.swift
//  Paper
//
//  Created by 선민재 on 2022/10/26.
//

import UIKit
import RxCocoa
import RxSwift

class BaseViewModel {
    var coordinator: IntroCoordinator
    var disposeBag = DisposeBag()
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }
}
