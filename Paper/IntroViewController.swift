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
    
    private func addView() {
        [backgroundView,underText].forEach {
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
    }
    
}

extension UIColor {
    class var background: UIColor?{return UIColor(named: "background")}
}
