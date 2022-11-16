//
//  MainViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/11/16.
//

import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit
import Lottie

class MainViewController: BaseViewController<MainViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.mainLogoImage()
        self.navigationItem.mainProfileImage()
    }
    
    override func viewDidLayoutSubviews() {
        writeButton.glogGradient()
    }
    
    let mainLottie = LottieAnimationView(name: "SignUpEmoji").then {
        $0.loopMode = .loop
        $0.play()
    }
    
    let mainText = UILabel().then {
        $0.text = "너의 생각을 \n글로 표현해봐!"
        $0.font = UIFont(name: "Pretendard-Bold", size: 40)
        $0.textColor = .white
        $0.numberOfLines = 2
    }
    
    lazy var writeButton = UIButton().then {
        let text = NSAttributedString(string: "게시글 작성하러 가기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Pretendard-ExtraBold", size: 18)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    override func addView() {
        [mainLottie,mainText,writeButton].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        mainLottie.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 6.59)
            $0.trailing.equalToSuperview().inset(13)
            $0.height.equalTo(134)
            $0.width.equalTo(134)
        }
        mainText.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 5.7)
            $0.leading.equalToSuperview().offset(12)
        }
        writeButton.snp.makeConstraints {
            $0.top.equalTo(mainText.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
    }

}
