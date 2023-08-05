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
    static var currentType: Int

    @UserDefault(key: UserDefaultsKey.levelKey.rawValue, defaultValue: 0)
    static var currentLevel: Int

    @UserDefault(key: UserDefaultsKey.riceKey.rawValue, defaultValue: 0)
    static var currentRice: Int

    @UserDefault(key: UserDefaultsKey.waterKey.rawValue, defaultValue: 0)
    static var currentWater: Int

    @UserDefault(key: UserDefaultsKey.nicknameKey.rawValue, defaultValue: "")
    static var currentNickname: String
}
