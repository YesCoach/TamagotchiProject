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
    var invalidFeedingAlertMessage: CustomObservable<String?> { get }

}

protocol MainViewModel: MainViewModelInput, MainViewModelOutput { }

final class DefaultMainViewModel: MainViewModel {

    enum TamagotchiFeedingError: Error {
        case exceedMaximum
    }

    enum TamagotchiFeedType {
        case rice
        case water

        var feedLimit: Int {
            switch self {
            case .rice: return 100
            case .water: return 50
            }
        }
    }

    // MARK: - Dependency

    private let characterUseCase: CharacterUseCase
    private let userUseCase: UserUseCase

    // MARK: - Output

    let tamagotchi: CustomObservable<Tamagotchi?> = .init(nil)
    let tamagotchhiStory: CustomObservable<String> = .init("")
    let userName: CustomObservable<String> = .init("")
    let invalidFeedingAlertMessage: CustomObservable<String?> = .init(nil)

    // MARK: - Dependency Injection

    init(
        characterUseCase: CharacterUseCase = DefaultCharacterUseCase(),
        userUseCase: UserUseCase = DefaultUserUseCase()
    ) {
        self.characterUseCase = characterUseCase
        self.userUseCase = userUseCase

        tamagotchi.value = characterUseCase.loadCharacter()
    }

}

// MARK: - Input

extension DefaultMainViewModel {

    func didRiceButtonTouched(count: Int = 1) {
        do {
            try feedRice(count: count)
        } catch {
            invalidFeedingAlertMessage.value =
            "밥은 한번에 최대 \(TamagotchiFeedType.rice.feedLimit)개 만큼만 먹을 수 있어요!"
        }
    }

    func didWaterButtonTouched(count: Int = 1) {
        do {
            try feedWater(count: count)
        } catch {
            invalidFeedingAlertMessage.value =
            "물은 한번에 최대 \(TamagotchiFeedType.water.feedLimit)개 만큼만 먹을 수 있어요!"
        }
    }

    func viewWillAppear() {
        userName.value = userUseCase.loadUserName()
        createRandomTamagotchiStory()
    }

}

// MARK: - Private Methods

private extension DefaultMainViewModel {

    func feedRice(count: Int) throws {
        guard count < TamagotchiFeedType.rice.feedLimit else {
            throw TamagotchiFeedingError.exceedMaximum
        }

        tamagotchi.value?.rice += count
        if let tamagotchi = tamagotchi.value {
            characterUseCase.saveCharacter(with: tamagotchi)
        }
        createRandomTamagotchiStory()
    }

    func feedWater(count: Int) throws {
        guard count < TamagotchiFeedType.water.feedLimit else {
            throw TamagotchiFeedingError.exceedMaximum
        }

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
