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

    private let characterUseCase: CharacterUseCase
    private let userUseCase: UserUseCase

    private let tamagotchiType: TamagotchiType
    private let state: CharacterSelectionState

    // MARK: - Output

    let thumbnailImageName: CustomObservable<String> = .init("noImage")
    let nameButtonTitle: CustomObservable<String?> = .init(nil)
    let infoLabelText: CustomObservable<String?> = .init(nil)
    let okButtonTitle: CustomObservable<String?> = .init(nil)

    // MARK: - Dependency Injection

    init(
        characterUseCase: CharacterUseCase = DefaultCharacterUseCase(),
        userUseCase: UserUseCase = DefaultUserUseCase(),
        type: TamagotchiType,
        state: CharacterSelectionState
    ) {
        self.characterUseCase = characterUseCase
        self.userUseCase = userUseCase
        self.tamagotchiType = type
        self.state = state

        thumbnailImageName.value = tamagotchiType.thumbnailImage
        nameButtonTitle.value = tamagotchiType.name
        infoLabelText.value = tamagotchiType.description
        okButtonTitle.value = state.buttonTitle
    }

}

// MARK: - Input

extension DefaultCharacterDetailPopUpViewModel {

    func didOkButtonTouched() {
        characterUseCase.updateCharacterType(with: tamagotchiType)
        userUseCase.saveIsLaunchedValue(true)
    }

}
