//
//  BaseCoordinator.swift
//  Paper
//
//  Created by 선민재 on 2022/10/26.
//

import UIKit

class BaseCoordinator: Coordinator{
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    let window: UIWindow
    
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
        window.rootViewController = navigationController
    }
    
    func start() {
        
    }
}
