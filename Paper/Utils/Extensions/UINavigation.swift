//
//  ButtonSetting.swift
//  Paper
//
//  Created by 선민재 on 2022/11/07.
//

import UIKit

extension UINavigationItem {
    func backButton(title:String = "취소") {
        let backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        backBarButtonItem.tintColor = UIColor.white
        self.backBarButtonItem = backBarButtonItem
    }
    func logoImage() {
        let logo = UIImage(named: "navLogo.png")
        self.titleView = UIImageView(image: logo)
    }
}
