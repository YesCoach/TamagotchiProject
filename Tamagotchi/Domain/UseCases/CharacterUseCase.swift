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

final class DefaultCharacterUseCase {

    private let characterRepository: CharacterRepository

    init(characterRepository: CharacterRepository = DefaultCharacterRepository()) {
        self.characterRepository = characterRepository
    }

}

extension DefaultCharacterUseCase: CharacterUseCase {

    func loadCharacter() -> Tamagotchi {
        return characterRepository.loadCharacter()
    }

    func saveCharacter(with data: Tamagotchi) {
        characterRepository.saveCharacter(with: data)
    }

    func updateCharacterType(with type: TamagotchiType) {
        characterRepository.updateCharacterType(with: type)
    }

    func resetCharacter() {
        characterRepository.resetCharacter()
    }

}
