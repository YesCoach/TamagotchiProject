//
//  UILabel+.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

extension UILabel {

    /// 폰트와 색상을 타이틀 속성으로 적용합니다.
    /// font size: 15, .regular
    /// textColor: .border
    func setupTextStyleTitle() {
        font = .systemFont(ofSize: 15, weight: .bold)
        textColor = .border
    }

    /// 폰트와 색상을 서브타이틀 속성으로 적용합니다.
    /// font size: 13, .regular
    /// textColor: .border
    func setupTextStyleSubTitle() {
        font = .systemFont(ofSize: 14, weight: .bold)
        textColor = .border
    }

    /// 폰트와 색상을 본문 속성으로 적용합니다.
    /// font size: 13, .regular
    /// textColor: .border
    func setupTextStyleBody() {
        font = .systemFont(ofSize: 13, weight: .regular)
        textColor = .border
    }
}
