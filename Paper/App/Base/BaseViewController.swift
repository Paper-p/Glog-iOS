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
    class var textField: UIColor?{return UIColor(named: "textField")}
}

extension UITextField {
    func addLeftImage(_ image: UIImage, x: Float) {
        let iconView = UIImageView(frame:CGRect(x: CGFloat(x), y: 5, width: image.size.width, height: image.size.height))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:CGRect(x: 0, y: 0, width: 38, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }

}

extension UIViewController {
    func addGradient(_ button: UIButton) {
        let gradient = CAGradientLayer()
        gradient.frame = button.bounds
        gradient.colors = [UIColor.Gradient1!.cgColor, UIColor.Gradient2!.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        button.layer.insertSublayer(gradient, at: 0)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
    }
}
