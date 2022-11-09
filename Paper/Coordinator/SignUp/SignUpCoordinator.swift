//
//  SignUpCoordinator.swift
//  Paper
//
//  Created by 선민재 on 2022/11/08.
//

//import UIKit
//
//class SignUpCoordinator: Coordinator{
//    var childCoordinators = [Coordinator]()
//    var navigationController: UINavigationController
//    let window: UIWindow
//    
//    
//    init(navigationController: UINavigationController, window: UIWindow) {
//        self.navigationController = navigationController
//        self.window = window
//        window.rootViewController = navigationController
//    }
//    
//    func start() {
//        let signUpVM = SignUpViewModel(coordinator: self)
//        let signUpVC = SignInViewController(signUpVM)
//        navigationController.setViewControllers(signUpVC, animated: true)
//    }
//    
//    func idNextButton() {
//        let signUpPwVM = SignUpPWViewModel(coordinator: self)
//        let signUpPwVC = SignUpPWViewController(signUpPwVM)
//        navigationController.pushViewController(signUpPwVC, animated: true)
//    }
//}
