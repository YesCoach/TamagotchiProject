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

    private let status: CharacterSelectionState

    init(status: CharacterSelectionState) {
        self.status = status
    }

    // MARK: - Output

    let dataList: CustomObservable<[TamagotchiType]> = .init(TamagotchiType.allCases)
    let navigationItemTitle: CustomObservable<String> = .init("")
    let viewState: CustomObservable<CharacterSelectionState> = .init(.initial)

}

// MARK: - Input

extension DefaultCharacterSelectionViewModel {

    func viewDidLoad() {
        configureNaivgationItemTitle()
        viewState.value = status
    }

}

private extension DefaultCharacterSelectionViewModel {

    func configureNaivgationItemTitle() {
        navigationItemTitle.value = status == .initial ? "다마고치 선택하기" : "다마고치 변경하기"
    }

}

