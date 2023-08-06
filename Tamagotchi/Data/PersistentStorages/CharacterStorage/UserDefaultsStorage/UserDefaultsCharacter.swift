//
//  UserDefaultsCharacter.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

final class UserDefaultsCharacter {

    // TODO: - UserDefaults DI 구현

}

extension UserDefaultsCharacter: CharacterStorage {

    func loadCharacter() -> Tamagotchi {
        return UserDefaultsManager.currentTamagotchi
    }

    func saveCharacter(with data: Tamagotchi) {
        UserDefaultsManager.currentTamagotchi = data
    }

    func resetCharacter() {
        UserDefaultsManager.resetCharacterData()
    }

    func updateCharacterType(with type: TamagotchiType) {
        UserDefaultsManager.currentType = type.rawValue
    }

}

