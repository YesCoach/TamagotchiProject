//
//  UITextField+.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit.UITextField

extension UITextField {

    /// TextField의 하단에 border를 적용합니다
    func setupBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(
            x: 0,
            y: self.frame.size.height - 1,
            width: self.frame.size.width,
            height: 0.5
        )
        bottomLine.backgroundColor = UIColor.border.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }

}
