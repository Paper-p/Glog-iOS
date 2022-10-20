//
//  SignInCoordinator.swift
//  Paper
//
//  Created by 선민재 on 2022/10/20.
//

import UIKit


class SignInCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: IntroCoordinator?
    var nav: UINavigationController
    
    init(nav:UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        let signInVC = SignInViewController()
        signInVC.coordinator = self
        nav.pushViewController(signInVC, animated: true)
    }
}
