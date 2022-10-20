//
//  IntroCoordinator.swift
//  Paper
//
//  Created by 선민재 on 2022/10/20.
//

import UIKit


class IntroCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var nav: UINavigationController
    
    init(nav:UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        let introVC = IntroViewController()
        introVC.coordinator = self
        nav.pushViewController(introVC, animated: true)
    }
    func pushSignInVC() {
        let signInCoordinator = SignInCoordinator(nav: nav)
        signInCoordinator.parentCoordinator = self
        childCoordinators.append(signInCoordinator)
        signInCoordinator.start()
    }
}
