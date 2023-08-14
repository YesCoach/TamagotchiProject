//
//  UIAlertController+.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/05.
//

import UIKit.UIAlertController

extension UIAlertController {


    /// 얼럿 문구와 확인 버튼으로 구성된 UIAlertController 인스턴스를 생성합니다.
    /// - Parameters:
    ///   - title: 얼럿 타이틀
    ///   - message: 얼럿 메시지
    /// - Returns: 확인 버튼을 담고있는 얼럿 컨트롤러
    static func simpleConfirmAlert(title: String = "", message: String = "") -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default)

        alert.addAction(action)
        return alert
    }
}
