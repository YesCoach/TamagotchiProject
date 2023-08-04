//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import Foundation

struct Tamagotchi {
    var type: TamagotchiType
    var level: Int
    var rice: Int
    var water: Int
}

extension Tamagotchi {

    /// 해당 타마고치의 이미지 이름을 반환합니다.
    /// 이미지 이름: "\(타마고치 고유 번호)-\(level)"
    var imageName: String {
        get {
            return type.imageQuery + "\(level)"
        }
    }
}
