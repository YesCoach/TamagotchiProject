//
//  UIButtonConfiguration+.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

extension UIButton.Configuration {
    
    static func feedingButtonStyle() -> UIButton.Configuration {
        var config = UIButton.Configuration.plain()
        config.baseForegroundColor = .border
        config.baseBackgroundColor = .background
        config.imagePlacement = .leading
        config.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
        config.background.cornerRadius = 10.0
        config.background.strokeColor = .border

        return config
    }
}
