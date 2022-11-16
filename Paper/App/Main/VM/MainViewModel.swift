//
//  MainViewModel.swift
//  Paper
//
//  Created by 선민재 on 2022/11/16.
//

import UIKit
import RxSwift
import RxCocoa

final class MainViewModel:BaseViewModel {
    var coordinator: IntroCoordinator
    
    init(coordinator: IntroCoordinator){
        self.coordinator = coordinator
    }
    
}
