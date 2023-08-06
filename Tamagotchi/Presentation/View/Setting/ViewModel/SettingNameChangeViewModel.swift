//
//  SettingNameChangeViewModel.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/06.
//

import Foundation

protocol SettingNameChangeViewModelInput {
    func didSaveButtonTouched(newName: String)
}

protocol SettingNameChangeViewModelOutput {
    var isNewNameUnavailable: CustomObservable<Bool> { get }
    var isNameChangeCompleted: CustomObservable<Bool> { get }
}

protocol SettingNameChangeViewModel: SettingNameChangeViewModelInput,
                                     SettingNameChangeViewModelOutput {}

final class DefaultSettingNameChangeViewModel: SettingNameChangeViewModel {

    // MARK: - Output

    let isNewNameUnavailable: CustomObservable<Bool> = .init(false)
    let isNameChangeCompleted: CustomObservable<Bool> = .init(false)

}

// MARK: - Input

extension DefaultSettingNameChangeViewModel {

    func didSaveButtonTouched(newName: String) {
        let nicknameLength = newName.count
        guard nicknameLength > 1 && nicknameLength < 7
        else {
            isNewNameUnavailable.value = true
            isNewNameUnavailable.value = false
            return
        }

        UserDefaultsManager.currentNickname = newName
        isNameChangeCompleted.value = true
    }
}
