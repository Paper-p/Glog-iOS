//
//  ViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/08/30.
//

import UIKit
import Then
import SnapKit

class IntroViewController: UIViewController {

    private let bounds = UIScreen.main.bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let gradient = CAGradientLayer()
        gradient.frame = self.loginButton.bounds
//        let colors: [CGColor] = [
//           .init(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1),
//           .init(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1),
//           .init(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)
//        ]
        gradient.colors = [UIColor.Gradient1!.cgColor, UIColor.Gradient2!.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        loginButton.layer.addSublayer(gradient)
        addView()
        setLayout()
    }
    
    let underText = UILabel().then {
        $0.text = "여기서 너의 생각을 \n 남들에게 이야기해봐"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
        $0.font = UIFont(name: "Pretendard-Bold", size: 18)
    }
    
    
    let backgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.52)
        $0.layer.cornerRadius = 112
    }
    lazy var loginButton = UIButton().then {
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-ExtraBold", size: 18)
        $0.setTitleColor(UIColor.blue, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    private func addView() {
        [backgroundView,underText,loginButton].forEach {
            view.addSubview($0)
        }
    }
    
    
    private func setLayout() {
        backgroundView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 3.8)
            $0.height.equalTo((bounds.height) / 2.89)
            $0.width.equalTo((bounds.width) / 1.33)
        }
        underText.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(backgroundView.snp.bottom).inset((bounds.height) / 12.78)
        }
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(600)
            $0.height.equalTo(200)
            $0.width.equalTo(600)
        }
    }
    
}

extension UIColor {
    class var background: UIColor?{return UIColor(named: "background")}
    class var Gradient1: UIColor?{return UIColor(named: "Gradient1")}
    class var Gradient2: UIColor?{return UIColor(named: "Gradient2")}
}
