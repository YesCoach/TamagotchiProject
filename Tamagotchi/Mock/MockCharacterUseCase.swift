//
//  MockCharacterUseCase.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

final class MockCharacterUseCase: CharacterUseCase {

    private var mockData: Tamagotchi = Tamagotchi()

    func loadCharacter() -> Tamagotchi {
        return mockData
    }

    func saveCharacter(with data: Tamagotchi) {
        mockData = data
    }

    func resetCharacter() {
        mockData = Tamagotchi()
    }

    func updateCharacterType(with type: TamagotchiType) {
        mockData.type = type
    }

}
