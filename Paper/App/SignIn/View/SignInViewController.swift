//
//  SiginInViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/10/20.
//

import UIKit
import RxCocoa
import RxSwift

class SignInViewController: UIViewController {
    let viewModel: SignInViewModel
    let disposeBag = DisposeBag()
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow

    }

}
