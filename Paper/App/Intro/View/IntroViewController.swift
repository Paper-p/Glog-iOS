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

final class IntroViewController: BaseViewController<IntroViewModel> {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.glogGradient()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        self.navigationItem.backButton(title: "취소")
    }
    
    private func bindViewModel() {
        let input = IntroViewModel.Input(
            signInButtonTap: signInButton.rx.tap.asObservable(),
            signUpButtonTap: signUpButton.rx.tap.asObservable()
        )
        viewModel.transVC(input: input)
    }
    
    let bg = UIImageView().then {
        $0.image = UIImage(named: "bg.png")
    }
    
    let underText = UILabel().then {
        $0.text = "여기서 너의 생각을 \n 남들에게 이야기해봐"
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1)
        $0.font = UIFont.GlogFont(size: 18, family: .Bold)
    }
    
    let logo = UIImageView().then {
        $0.image = UIImage(named: "Logo.svg")
    }
    
    let nextLogo = UIImageView().then {
        $0.image = UIImage(named: "nextlogo.png")
    }
    
    let backgroundView = UIView().then {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.52)
        $0.layer.cornerRadius = 112
    }
    
    lazy var signInButton = UIButton().then {
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.GlogFont(size: 18, family: .ExtraBold)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    lazy var signUpButton = UIButton().then {
        let text = NSAttributedString(string: "회원가입")
        $0.setAttributedTitle(text, for: .normal)
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        $0.titleLabel?.font = UIFont.GlogFont(size: 18, family: .ExtraBold)
        $0.setTitleColor(UIColor(red: 23/255, green: 205/255, blue: 111/255, alpha: 1), for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.Gradient2!.cgColor
        $0.layer.cornerRadius = 10
    }
    
    override func addView() {
        [bg,backgroundView,underText,signInButton,signUpButton,nextLogo,logo].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        bg.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.top).offset(-(bounds.height) / 6.02)
        }
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
        signInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backgroundView.snp.bottom).offset((bounds.height) / 6.02)
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        signUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signInButton.snp.bottom).offset(16)
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        nextLogo.snp.makeConstraints {
            $0.top.equalTo(backgroundView.snp.top).offset((bounds.height) / 8.97)
            $0.leading.equalTo(view.snp.leading).offset((bounds.width) / 6.5)
        }
        logo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(backgroundView.snp.top).offset((bounds.height) / 8.97)
        }
    }
    
}
