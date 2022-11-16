//
//  PageUI.swift
//  Paper
//
//  Created by 선민재 on 2022/11/07.
//

import UIKit

extension UITextField {
    func addLeftImage(_ image: UIImage, x: Float, y: Float) {
        let iconView = UIImageView(frame:CGRect(x: CGFloat(x), y: CGFloat(y), width: image.size.width, height: image.size.height))
        iconView.image = image
        iconView.tintColor = .icon
        let iconContainerView: UIView = UIView(frame:CGRect(x: 0, y: 0, width: 38, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
