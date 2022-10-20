//
//  Coordinator.swift
//  Paper
//
//  Created by 선민재 on 2022/10/19.
//
import UIKit


protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
