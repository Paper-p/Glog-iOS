//
//  SignInCoordinator.swift
//  Paper
//
//  Created by 선민재 on 2022/10/20.
//

import UIKit

class SignInCoordinator:Coordinator {
    func start() {
    
    }
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
