//
//  PostTableViewCell.swift
//  Paper
//
//  Created by 선민재 on 2022/12/12.
//

import UIKit
import SnapKit
import Then

class PostTableViewCell: UITableViewCell {
    static let identifier = "postCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    let backView = UIView().then {
        $0.tintColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.7)
        $0.layer.cornerRadius = 10
    }
    
    let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = UIFont.GlogFont(size: 18, family: .SemiBold)
        $0.textAlignment = .left
    }
    
    let subTitleLabel = UILabel().then {
        $0.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        $0.font = UIFont.GlogFont(size: 14, family: .Medium)
        $0.textAlignment = .left
    }
    
    func addView() {
        [backView,titleLabel,subTitleLabel].forEach {
            contentView.addSubview($0)
        }
    }
        
    func setLayout() {
        backView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(93)
        }
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(backView.snp.leading).offset(11)
            $0.top.equalTo(backView.snp.top).offset(12)
        }
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(backView.snp.leading).offset(11)
            $0.top.equalTo(titleLabel.snp.bottom).offset(7)
        }
    }
}
