//
//  UIColor_Extension.swift
//  testFlutter
//
//  Created by czm on 2021/8/6.
//

import UIKit

extension UIColor {
    
    // 快捷构造器-RGBA色值
    convenience init(_ r: Int, _ g: Int, _ b: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue:CGFloat(b)/255.0, alpha:a)
    }
    
    // 使用十六进制颜色码生成`UIColor`对象, eg:`UIColor(0xFF2D3A)`
    convenience init(_ hex: Int, _ a: CGFloat = 1.0) {
        assert(
            0...0xFFFFFF ~= hex,
            "UIColor+Hex: Hex value given to UIColor initializer should only include RGB values, i.e. the hex value should have six digits." //swiftlint:disable:this line_length
        )
        let red = (hex & 0xFF0000) >> 16
        let green = (hex & 0x00FF00) >> 8
        let blue = (hex & 0x0000FF)
        self.init(red, green, blue, a: a)
    }
    
    // 将 UIColor 转换为 UIImage
    public func toImage() -> UIImage{
        
        let size = CGSize(width: 1, height: 1)
        
        UIGraphicsBeginImageContext(size)
        
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(self.cgColor)
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        context?.fill(rect)
        
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return theImage!
    }
}
