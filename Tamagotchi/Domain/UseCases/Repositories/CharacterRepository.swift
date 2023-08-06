//
//  CharacterRepository.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

protocol CharacterRepository {

    func loadCharacter() -> Tamagotchi
    func saveCharacter(with data: Tamagotchi)
    func resetCharacter()
    func updateCharacterType(with type: TamagotchiType)

}
