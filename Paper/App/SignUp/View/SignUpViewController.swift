//
//  SignUpViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/10/21.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: BaseViewController<SignUpViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.logoImage()
    }

}
