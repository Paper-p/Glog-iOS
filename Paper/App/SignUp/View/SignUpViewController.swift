//
//  SignUpViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/10/21.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: BaseViewController {
    let viewModel: SignUpViewModel
    let disposeBag = DisposeBag()
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
    }

}
