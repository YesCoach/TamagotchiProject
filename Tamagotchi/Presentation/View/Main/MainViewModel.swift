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
    func willTamagotchiStoryChange()

}

protocol MainViewModelOutput {

    var tamagotchi: CustomObservable<Tamagotchi> { get }
    var tamagotchhiStory: CustomObservable<String> { get }

}

protocol MainViewModel: MainViewModelInput, MainViewModelOutput { }

final class DefaultMainViewModel: MainViewModel {

    // MARK: - Output

    let tamagotchi: CustomObservable<Tamagotchi> = CustomObservable(
        UserDefaultsManager.currentTamagotchi
    )
    let tamagotchhiStory: CustomObservable<String> = CustomObservable("")

    // MARK: - Input

    func didRiceButtonTouched(count: Int = 1) {
        feedRice(count: count)
    }

    func didWaterButtonTouched(count: Int) {
        feedWater(count: count)
    }

    func willTamagotchiStoryChange() {
        tamagotchhiStory.value = TamagotchiStory.randomStory()
    }
}

private extension DefaultMainViewModel {

    func feedRice(count: Int) {
        let count = count < 100 ? count : 0
        tamagotchi.value.rice += count
        UserDefaultsManager.currentRice += count
    }

    func feedWater(count: Int) {
        let count = count < 100 ? count : 0
        tamagotchi.value.water += count
        UserDefaultsManager.currentWater += count
    }
}
