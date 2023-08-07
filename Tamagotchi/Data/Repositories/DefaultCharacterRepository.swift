//
//  DefaultCharacterRepository.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

final class DefaultCharacterRepository {

    // MARK: - Dependency

    private let characterStorage: CharacterStorage

    // MARK: - Dependency Injection

    init(characterStorage: CharacterStorage = UserDefaultsCharacter()) {
        self.characterStorage = characterStorage
    }

}

// MARK: - CharacterRepository 구현부

extension DefaultCharacterRepository: CharacterRepository {

    func loadCharacter() -> Tamagotchi {
        return characterStorage.loadCharacter()
    }

    func saveCharacter(with data: Tamagotchi) {
        return characterStorage.saveCharacter(with: data)
    }

    func resetCharacter() {
        return characterStorage.resetCharacter()
    }

    func updateCharacterType(with type: TamagotchiType) {
        return characterStorage.updateCharacterType(with: type)
    }

}
