//
//  UIViewController+.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/06.
//

import UIKit

extension UIViewController {

    /// Status Bar의 배경 색상을 설정합니다.
    /// - Parameter color: 설정할 색상 값
    func configureStatusBarColor(with color: UIColor) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene

        if let statusBarManager = windowScene?.statusBarManager {
            let statusBarFrame = statusBarManager.statusBarFrame
            let statusBarView = UIView(frame: statusBarFrame)
            statusBarView.backgroundColor = color
            windowScene?.windows.first?.addSubview(statusBarView)
        }

    }
}
