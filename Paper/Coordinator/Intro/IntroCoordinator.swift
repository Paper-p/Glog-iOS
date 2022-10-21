//
//  IntroCoordinator.swift
//  Paper
//
//  Created by 선민재 on 2022/10/21.
//

import UIKit


class IntroCoordinator : Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let window: UIWindow
    
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        window.rootViewController = navigationController
    }
    
    func start() {
        let introVC = IntroViewController(coordinator: self)
        navigationController.setViewControllers([introVC], animated: true)
    }
    func pushSignInVC() {
        let signInVC = SignInViewController()
        signInVC.coordinator = self
        navigationController.pushViewController(signInVC, animated: true)
    }
    func pushSignUpVC() {
        let signUpVC = SignUpViewController()
        signUpVC.coordinator = self
        navigationController.pushViewController(signUpVC, animated: true)
    }
}
