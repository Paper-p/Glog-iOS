//
//  BaseViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/10/21.
//

import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit

class BaseViewController<T>: UIViewController {
    
    let viewModel: T
    var disposeBag = DisposeBag()
    let bounds = UIScreen.main.bounds
    
    init(_ viewModel: T) {
        self.viewModel = viewModel
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
        view.backgroundColor = .backgroundColor
    }

    func addView() {
        
    }

    func setLayout() {
        
    }
}

extension UIColor {
    class var backgroundColor: UIColor?{return UIColor(named: "backgroundColor")}
    class var Gradient1: UIColor?{return UIColor(named: "Gradient1")}
    class var Gradient2: UIColor?{return UIColor(named: "Gradient2")}
}
