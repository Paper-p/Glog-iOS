//
//  IntroCoordinator.swift
//  Paper
//
//  Created by 선민재 on 2022/10/20.
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
//        navigationController.setViewControllers([], animated: true)
        let signInVC = SignInViewController()
        signInVC.coordinator = self
        navigationController.pushViewController(signInVC, animated: true)
//        navigationController.setViewControllers([signInVC], animated: true)
//        let test = SignInViewController()
//        test.modalPresentationStyle = .fullScreen
//        navigationController.pushViewController(test, animated: true)
    }
}
