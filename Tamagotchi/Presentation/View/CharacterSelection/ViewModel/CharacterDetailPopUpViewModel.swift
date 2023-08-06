//
//  CharacterDetailPopUpViewModel.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/06.
//

import Foundation

protocol CharacterDetailPopUpViewModelInput {

    func didOkButtonTouched()

}

protocol CharacterDetailPopUpViewModelOutput {

    var thumbnailImageName: CustomObservable<String> { get }
    var nameButtonTitle: CustomObservable<String?> { get }
    var infoLabelText: CustomObservable<String?> { get }
    var okButtonTitle: CustomObservable<String?> { get }

}

protocol CharacterDetailPopUpViewModel: CharacterDetailPopUpViewModelInput,
                                        CharacterDetailPopUpViewModelOutput { }

final class DefaultCharacterDetailPopUpViewModel: CharacterDetailPopUpViewModel {

    private let tamagotchiType: TamagotchiType
    private let state: CharacterSelectionState

    // MARK: - Output

    let thumbnailImageName: CustomObservable<String> = .init("noImage")
    let nameButtonTitle: CustomObservable<String?> = .init(nil)
    let infoLabelText: CustomObservable<String?> = .init(nil)
    let okButtonTitle: CustomObservable<String?> = .init(nil)

    // MARK: - Initialize

    init(type: TamagotchiType, state: CharacterSelectionState) {
        self.tamagotchiType = type
        self.state = state

        thumbnailImageName.value = tamagotchiType.thumbnailImage
        nameButtonTitle.value = tamagotchiType.name
        infoLabelText.value = tamagotchiType.description
        okButtonTitle.value = state == .initial ? "시작하기" : "변경하기"
    }

}

// MARK: - Input

extension DefaultCharacterDetailPopUpViewModel {

    func didOkButtonTouched() {
        UserDefaultsManager.currentType = tamagotchiType.rawValue
        UserDefaultsManager.isLaunched = true
    }

}
