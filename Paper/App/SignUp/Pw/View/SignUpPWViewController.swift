//
//  SignUpPWViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/11/07.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then
import Lottie

class SignUpPWViewController: BaseViewController<SignUpPWViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.logoImage()
        bindViewModel()
        self.navigationItem.backButton(title: "취소")
    }
    
    override func viewDidLayoutSubviews() {
        nextButton.glogGradient()
    }
    
    private func bindViewModel() {
        let input = SignUpPWViewModel.Input(
            pwnextButtonTap: nextButton.rx.tap.asObservable()
        )
        viewModel.transVC(input: input)
    }
    
    lazy var pwTextField = UITextField().then {
        $0.backgroundColor = .textField
        $0.attributedPlaceholder = NSAttributedString(string: "사용하실 비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 1, green: 1, blue: 1, alpha: 0.48)])
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.48)
        $0.font = UIFont.GlogFont(size: 16, family: .Medium)
        $0.addLeftImage(UIImage(systemName: "lock.fill")!, x: 13, y:6)
        $0.layer.cornerRadius = 10
        $0.isSecureTextEntry = true
    }
    
    lazy var checkPWTextField = UITextField().then {
        $0.backgroundColor = .textField
        $0.attributedPlaceholder = NSAttributedString(string: "사용하실 비밀번호를 한번 더 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 1, green: 1, blue: 1, alpha: 0.48)])
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.48)
        $0.font = UIFont.GlogFont(size: 16, family: .Medium)
        $0.addLeftImage(UIImage(systemName: "lock.fill")!, x: 13, y:6)
        $0.layer.cornerRadius = 10
        $0.isSecureTextEntry = true
    }
    
    let signUpEmoji = LottieAnimationView(name: "SignUpEmoji").then {
        $0.loopMode = .loop
        $0.play()
    }
    
    let extext = UILabel().then {
        $0.text = "비밀번호는 8자리 이상 및 기호를 포함해주세요."
        $0.font = UIFont.GlogFont(size: 14, family: .Regular)
        $0.textColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1.0)
    }
    
    lazy var nextButton = UIButton().then {
        let text = NSAttributedString(string: "다음")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.GlogFont(size: 18, family: .ExtraBold)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    override func addView() {
        [signUpEmoji,pwTextField,checkPWTextField,nextButton,extext].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        signUpEmoji.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 4.99)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(134)
            $0.width.equalTo(134)
        }
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(signUpEmoji.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo((bounds.height) / 16.23)
            $0.trailing.leading.equalToSuperview().inset(12)
        }
        checkPWTextField.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo((bounds.height) / 16.23)
            $0.trailing.leading.equalToSuperview().inset(12)
        }
        nextButton.snp.makeConstraints {
            $0.top.equalTo(checkPWTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        extext.snp.makeConstraints {
            $0.top.equalTo(nextButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
}

