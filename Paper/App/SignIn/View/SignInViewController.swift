//
//  SiginInViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/10/20.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit
import Then

class SignInViewController: BaseViewController<SignInViewModel> {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addGradient(signInButton)
    }
    
    let signInLogo = UIImageView().then {
        $0.image = UIImage(named: "signInLogo.svg")
    }
    
    let underText = UILabel().then {
        $0.text = "다시 온걸 환영해요!"
        $0.textColor = .white
         $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }
    
    lazy var idTextField = UITextField().then {
        $0.backgroundColor = .textField
        $0.attributedPlaceholder = NSAttributedString(string: "아이디를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 1, green: 1, blue: 1, alpha: 0.48)])
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.48)
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.addLeftImage(UIImage(systemName: "person.fill")!, x: 13, y:7)
        $0.layer.cornerRadius = 10
    }
    
    lazy var pwTextField = UITextField().then {
        $0.backgroundColor = .textField
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 1, green: 1, blue: 1, alpha: 0.48)])
        $0.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 0.48)
        $0.font = UIFont(name: "Pretendard-Medium", size: 16)
        $0.addLeftImage(UIImage(systemName: "lock.fill")!, x: 13, y: 6)
        $0.layer.cornerRadius = 10
    }
    
    lazy var signInButton = UIButton().then {
        let text = NSAttributedString(string: "로그인")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-ExtraBold", size: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    override func addView() {
        [signInLogo,underText, idTextField,pwTextField, signInButton].forEach {
            view.addSubview($0)
        }
    }
    
    override func setLayout() {
        signInLogo.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 4.56)
            $0.leading.equalTo(view.snp.leading).offset((bounds.width) / 3.51)
            $0.trailing.equalTo(view.snp.trailing).inset((bounds.width) / 5.45)
        }
        
        underText.snp.makeConstraints {
            $0.top.equalTo(signInLogo.snp.bottom).offset(19.58)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(underText.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
            $0.height.equalTo((bounds.height) / 16.23)
            $0.trailing.leading.equalToSuperview().inset(12)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo((bounds.height) / 16.23)
            $0.trailing.leading.equalToSuperview().inset(12)
        }
        
        signInButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset((bounds.height) / 26.375)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        
    }

}
