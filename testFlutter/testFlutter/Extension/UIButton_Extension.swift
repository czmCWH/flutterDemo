//
//  UIButton_Extension.swift
//  testFlutter
//
//  Created by czm on 2021/8/6.
//

import UIKit

// MARK:- convenience init

extension UIButton {
    
    /// 使用`font & textColor & font`创建一个`custom UIButton`
    convenience init(title: String? = nil, titleColor: UIColor, font: UIFont, bgColor: UIColor? = nil, _ cornerRadius: CGFloat? = nil) {
        self.init(type: .custom)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        
        if let bgColor = bgColor {
            self.backgroundColor = bgColor
        }
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    /// 设置 `UIButton` 的外边框属性
    func setBtnBorder(borderWidth: CGFloat?, borderColor: UIColor?, cornerRadius: CGFloat?) {
        if let borderWidth = borderWidth, let borderColor = borderColor {
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        }
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
}
