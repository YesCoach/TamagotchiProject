//
//  CharacterUseCase.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/06.
//

import Foundation

protocol CharacterUseCase {

    func loadCharacter() -> Tamagotchi
    func saveCharacter(with data: Tamagotchi)
    func resetCharacter()
    func updateCharacterType(with type: TamagotchiType)

}

final class DefaultCharacterUseCase: CharacterUseCase {

}

extension DefaultCharacterUseCase {

    func loadCharacter() -> Tamagotchi {
        return UserDefaultsManager.currentTamagotchi
    }

    func saveCharacter(with data: Tamagotchi) {
        UserDefaultsManager.currentTamagotchi = data
    }

    func updateCharacterType(with type: TamagotchiType) {
        UserDefaultsManager.currentType = type.rawValue
    }

    func resetCharacter() {
        UserDefaultsManager.resetCharacterData()
    }

}
