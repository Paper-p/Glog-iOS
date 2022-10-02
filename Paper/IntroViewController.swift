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
        view.backgroundColor = .background
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
    
    private func addView() {
        [underText].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        underText.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
}

extension UIColor {
    class var background: UIColor?{return UIColor(named: "background")}
}
