//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import Foundation

struct Tamagotchi {
    var type: TamagotchiType = .bangsil
    var rice: Int = 0
    var water: Int = 0
}

extension Tamagotchi {

    /// 레벨 계산법에 따른 레벨을 계산해서 반환합니다.
    var level: Int {
        get {
            var value = ((Double(rice) / 5) + (Double(water) / 2)) / 10
            if value < 2 { return 1 }
            if value > 10 { return 10 }
            return Int(value)
        }
    }

    /// 해당 타마고치의 이미지 이름을 반환합니다.
    /// 이미지 이름: "\(타마고치 고유 번호)-\(level)"
    var imageName: String {
        return type.imageNameQuery + "\(level < 10 ? level : 9)"
    }


    /// 레벨, 밥알, 물방울 정보를 문자열로 반환합니다.
    /// 출력예시: "LV1 ∙ 밥알 0개 ∙ 물방울 0개"
    var info: String {
        return "LV\(level) ∙ 밥알 \(rice)개 ∙ 물방울 \(water)개"
    }
}
