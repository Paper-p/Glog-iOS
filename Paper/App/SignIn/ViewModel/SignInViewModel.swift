//
//  SignInViewModel.swift
//  Paper
//
//  Created by 선민재 on 2022/10/25.
//


import UIKit
import RxSwift
import RxCocoa

final class SignInViewModel {
    private let disposeBag = DisposeBag()
    let coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator) {
        self.coordinator = coordinator
    }
}
