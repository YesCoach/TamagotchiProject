//
//  UIButton+.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

extension UIButton {

    /// 다마고치 이름 버튼에 필요한 UI 설정을 적용합니다.
    func setupNameButton(_ text: String? = nil) {
        layer.cornerRadius = 5.0
        layer.borderColor = UIColor.border.cgColor
        layer.borderWidth = 0.5
        setTitleColor(.border, for: .normal)
        titleLabel?.setupTextStyleTitle()
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.numberOfLines = 1

        // TODO: - deprecated 메서드 보완하기

        titleEdgeInsets = .init(top: 4, left: 4, bottom: 4, right: 4)
        isEnabled = false

        if let text {
            setTitle(text, for: .normal)
        }
    }

}
