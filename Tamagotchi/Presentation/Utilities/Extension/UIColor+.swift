//
//  UIColor+.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit.UIColor

extension UIColor {

    /// 프로젝트 지정 배경 색상입니다.
    static var background: UIColor {
        return UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }

    /// 프로젝트 지정 폰트, 테두리 색상입니다.
    static var border: UIColor {
        return UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }

    /// 다마고치 선택 팝업의 취소버튼 배경 색상입니다.
    static var cancleButton: UIColor {
        return UIColor(red: 233/255, green: 237/255, blue: 239/255, alpha: 1)
    }
}
