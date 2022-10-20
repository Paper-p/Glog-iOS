//
//  ViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/08/30.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa

final class IntroViewController: UIViewController {
    let coordinator: IntroCoordinator
    
    let disposeBag = DisposeBag()
    
    private let bounds = UIScreen.main.bounds
    
    init(coordinator: IntroCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
    }

    deinit {
        print("Intro Deinit")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        
        addView()
        setLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let gradient = CAGradientLayer()
        gradient.frame = self.loginButton.bounds
        gradient.colors = [UIColor.Gradient1!.cgColor, UIColor.Gradient2!.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        loginButton.layer.insertSublayer(gradient, at: 0)
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
    }
    
    let underText = UILabel().then {
        $0.text = "여기서 너의 생각을 \n 남들에게 이야기해봐"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
        $0.font = UIFont(name: "Pretendard-Bold", size: 18)
    }
    
    let logo = UIImageView().then {
        $0.image = UIImage(named: "Logo.svg")
    }
    
    
    let backgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.52)
        $0.layer.cornerRadius = 112
    }
    lazy var loginButton = UIButton().then {
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-ExtraBold", size: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    lazy var signUpButton = UIButton().then {
        let text = NSAttributedString(string: "회원가입")
        $0.setAttributedTitle(text, for: .normal)
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        $0.titleLabel?.font = UIFont(name: "Pretendard-ExtraBold", size: 18)
        $0.setTitleColor(UIColor(red: 23/255, green: 205/255, blue: 111/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.Gradient2!.cgColor
        $0.layer.cornerRadius = 10
        $0.rx.tap
            .bind(with: self) { owner, _ in
                owner.coordinator.pushSignInVC()
                print(owner.coordinator)
            }
            .disposed(by: disposeBag)
    }
    
    private func addView() {
        [backgroundView,underText,loginButton,signUpButton,logo].forEach {
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
            $0.top.equalTo(backgroundView.snp.bottom).offset((bounds.height) / 6.02)
            $0.height.equalTo((bounds.height) / 12.78)
            $0.width.equalTo((bounds.width) / 1.06)
        }
        signUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(16)
            $0.height.equalTo((bounds.height) / 12.78)
            $0.width.equalTo((bounds.width) / 1.06)
        }
        logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backgroundView.snp.top).offset((bounds.height) / 8.97)
        }
    }
    
}

extension UIColor {
    class var backgroundColor: UIColor?{return UIColor(named: "backgroundColor")}
    class var Gradient1: UIColor?{return UIColor(named: "Gradient1")}
    class var Gradient2: UIColor?{return UIColor(named: "Gradient2")}
}
