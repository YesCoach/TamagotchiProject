//
//  CharacterSelectionViewModel.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/06.
//

import Foundation

protocol CharacterSelectionViewModelInput {
    func viewDidLoad()

}

protocol CharacterSelectionViewModelOutput {
    var dataList: CustomObservable<[TamagotchiType]> { get }
    var navigationItemTitle: CustomObservable<String> { get }
    var viewState: CustomObservable<CharacterSelectionState> { get }
}

protocol CharacterSelectionViewModel: CharacterSelectionViewModelInput,
                                      CharacterSelectionViewModelOutput { }

final class DefaultCharacterSelectionViewModel: CharacterSelectionViewModel {

    // MARK: - Properties

    private let state: CharacterSelectionState

    // MARK: - Output

    let dataList: CustomObservable<[TamagotchiType]> = .init(TamagotchiType.allCases)
    let navigationItemTitle: CustomObservable<String> = .init("")
    let viewState: CustomObservable<CharacterSelectionState> = .init(.initial)

    // MARK: - Initializer

    init(state: CharacterSelectionState) {
        self.state = state
    }

}

// MARK: - Input

extension DefaultCharacterSelectionViewModel {

    func viewDidLoad() {
        configureNaivgationItemTitle()
        viewState.value = state
    }

}

// MARK: - Private Methods

private extension DefaultCharacterSelectionViewModel {

    func configureNaivgationItemTitle() {
        navigationItemTitle.value = state.title
    }

}

