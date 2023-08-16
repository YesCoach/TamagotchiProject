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

    var isNameChangeCompleted: CustomObservable<Bool> { get }
    var invalidNewNameErrorMessage: CustomObservable<String?> { get }
    var currentName: CustomObservable<String> { get }

}

protocol SettingNameChangeViewModel: SettingNameChangeViewModelInput,
                                     SettingNameChangeViewModelOutput {}


final class DefaultSettingNameChangeViewModel: SettingNameChangeViewModel {

    enum NicknameError: Error {
        case exceedMaximumLength
        case lessThanMinimumLength

        var message: String {
            switch self {
            case .exceedMaximumLength: return "이름은 6자를 넘길 수 없어요!"
            case .lessThanMinimumLength: return "이름은 최소 2자 이상이여야 합니다!"
            }
        }
    }

    // MARK: - Dependency

    private let userUseCase: UserUseCase

    // MARK: - Output

    let isNameChangeCompleted: CustomObservable<Bool> = .init(false)
    let invalidNewNameErrorMessage: CustomObservable<String?> = .init(nil)
    let currentName: CustomObservable<String> = .init("")

    // MARK: - Dependency Injection

    init(userUseCase: UserUseCase = DefaultUserUseCase()) {
        self.userUseCase = userUseCase
    }

}

// MARK: - Input

extension DefaultSettingNameChangeViewModel {

    func didSaveButtonTouched(newName: String) {
        do {
            try saveUserNewNickname(newName: newName)
        } catch NicknameError.lessThanMinimumLength {
            invalidNewNameErrorMessage.value = NicknameError.lessThanMinimumLength.message
        } catch NicknameError.exceedMaximumLength {
            invalidNewNameErrorMessage.value = NicknameError.exceedMaximumLength.message
        } catch { }
    }

    func viewDidLoad() {
        currentName.value = userUseCase.loadUserName()
    }

}

private extension DefaultSettingNameChangeViewModel {

    func saveUserNewNickname(newName: String) throws {
        let nicknameLength = newName.count
        guard nicknameLength < 7 else { throw NicknameError.exceedMaximumLength }
        guard nicknameLength > 1 else { throw NicknameError.lessThanMinimumLength }

        userUseCase.saveUserName(with: newName)
        isNameChangeCompleted.value = true
    }
}
