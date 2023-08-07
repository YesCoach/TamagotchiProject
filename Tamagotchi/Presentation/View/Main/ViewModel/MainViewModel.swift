//
//  MainViewModel.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/06.
//

import Foundation

protocol MainViewModelInput {

    func didRiceButtonTouched(count: Int)
    func didWaterButtonTouched(count: Int)
    func viewWillAppear()
}

protocol MainViewModelOutput {

    var tamagotchi: CustomObservable<Tamagotchi?> { get }
    var tamagotchhiStory: CustomObservable<String> { get }
    var userName: CustomObservable<String> { get }

}

protocol MainViewModel: MainViewModelInput, MainViewModelOutput { }

final class DefaultMainViewModel: MainViewModel {

    private let characterUseCase: CharacterUseCase
    private let userUseCase: UserUseCase

    init(
        characterUseCase: CharacterUseCase = DefaultCharacterUseCase(),
        userUseCase: UserUseCase = DefaultUserUseCase()
    ) {
        self.characterUseCase = characterUseCase
        self.userUseCase = userUseCase

        tamagotchi.value = characterUseCase.loadCharacter()
    }

    // MARK: - Output

    let tamagotchi: CustomObservable<Tamagotchi?> = .init(nil)
    let tamagotchhiStory: CustomObservable<String> = .init("")
    let userName: CustomObservable<String> = .init("")

}

// MARK: - Input

extension DefaultMainViewModel {

    func didRiceButtonTouched(count: Int = 1) {
        feedRice(count: count)
    }

    func didWaterButtonTouched(count: Int) {
        feedWater(count: count)
    }

    func viewWillAppear() {
        userName.value = userUseCase.loadUserName()
        createRandomTamagotchiStory()
    }

}

// MARK: - Private Methods

private extension DefaultMainViewModel {

    func feedRice(count: Int) {
        guard count < 100 else { return }
        
        tamagotchi.value?.rice += count
        if let tamagotchi = tamagotchi.value {
            characterUseCase.saveCharacter(with: tamagotchi)
        }
        createRandomTamagotchiStory()
    }

    func feedWater(count: Int) {
        guard count < 50 else { return }

        tamagotchi.value?.water += count
        if let tamagotchi = tamagotchi.value {
            characterUseCase.saveCharacter(with: tamagotchi)
        }
        createRandomTamagotchiStory()
    }

    func createRandomTamagotchiStory() {
        tamagotchhiStory.value = TamagotchiStory.randomStory()
    }
}
