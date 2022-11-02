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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.topItem?.title = "취소"
    }
    
    let signInLogo = UIImageView().then {
        $0.image = UIImage(named: "signInLogo.svg")
    }
    
    let underText = UILabel().then {
        $0.text = "다시 온걸 환영해요!"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 20)
    }
    
    override func addView() {
        [signInLogo,underText].forEach {
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
    }

}
