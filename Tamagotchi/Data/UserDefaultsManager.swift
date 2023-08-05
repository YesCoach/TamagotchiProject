//
//  UserDefaultsManager.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import Foundation

enum UserDefaultsKey: String {
    case typeKey
    case levelKey
    case riceKey
    case waterKey
    case nicknameKey
}

final class UserDefaultsManager {

    /// UserDefaults에 저장된 정보를 바탕으로 Tamagotchi 인스턴스를 생성해서 반환합니다.
    /// 값을 저장하면, 다마고치의 각 프로퍼티들이 UserDefaults에 저장됩니다.
    static var currentTamagotchi: Tamagotchi {
        get {
            return Tamagotchi(
                type: .init(rawValue: currentType) ?? .bangsil,
                rice: currentRice,
                water: currentWater
            )
        }
        set {
            currentType = newValue.type.rawValue
            currentLevel = newValue.level
            currentRice = newValue.rice
            currentWater = newValue.water
        }
    }


    @UserDefault(key: UserDefaultsKey.typeKey.rawValue, defaultValue: 0)
    /// 현재 다마고치의 타입입니다. TamagotchiType의 rawValue로 사용하세요.
    static var currentType: Int

    @UserDefault(key: UserDefaultsKey.levelKey.rawValue, defaultValue: 0)
    /// 현재 다마고치의 레벨입니다.
    static var currentLevel: Int

    @UserDefault(key: UserDefaultsKey.riceKey.rawValue, defaultValue: 0)
    /// 현재 다마고치의 밥알 갯수입니다.
    static var currentRice: Int

    @UserDefault(key: UserDefaultsKey.waterKey.rawValue, defaultValue: 0)
    /// 현재 다마고치의 물방울 갯수입니다.
    static var currentWater: Int

    @UserDefault(key: UserDefaultsKey.nicknameKey.rawValue, defaultValue: "대장")
    /// 현재 유저의 닉네임입니다. default는 "대장" 입니다.
    static var currentNickname: String

    /// UserDefaults에 저장된 유저 데이터를 리셋합니다.
    static func resetUserData() {
        currentType = 0
        currentLevel = 0
        currentRice = 0
        currentWater = 0
        currentNickname = "대장"
    }
}
