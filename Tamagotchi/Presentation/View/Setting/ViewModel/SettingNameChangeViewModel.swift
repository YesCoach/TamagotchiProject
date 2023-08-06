//
//  SettingNameChangeViewModel.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/06.
//

import Foundation

protocol SettingNameChangeViewModelInput {
    func didSaveButtonTouched(newName: String)
    func viewDidLoad()
}

protocol SettingNameChangeViewModelOutput {
    var isNewNameUnavailable: CustomObservable<Bool> { get }
    var isNameChangeCompleted: CustomObservable<Bool> { get }
    var currentName: CustomObservable<String> { get }
}

protocol SettingNameChangeViewModel: SettingNameChangeViewModelInput,
                                     SettingNameChangeViewModelOutput {}


final class DefaultSettingNameChangeViewModel: SettingNameChangeViewModel {

    private let userUseCase: UserUseCase

    // MARK: - Output

    let isNewNameUnavailable: CustomObservable<Bool> = .init(false)
    let isNameChangeCompleted: CustomObservable<Bool> = .init(false)
    let currentName: CustomObservable<String> = .init("")

    // MARK: - Dependency Injection

    init(userUseCase: UserUseCase = DefaultUserUseCase()) {
        self.userUseCase = userUseCase
    }

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

        userUseCase.saveUserName(with: newName)
        isNameChangeCompleted.value = true
    }

    func viewDidLoad() {
        currentName.value = userUseCase.loadUserName()
    }

}
