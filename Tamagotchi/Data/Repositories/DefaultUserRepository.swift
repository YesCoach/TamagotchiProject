//
//  DefaultUserRepository.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

final class DefaultUserRepository {

    // MARK: - Dependency

    private let userStorage: UserStorage

    // MARK: - Dependency Injection

    init(userStorage: UserStorage = UserDefaultsUser()) {
        self.userStorage = userStorage
    }

}

// MARK: - UserRepository 구현부

extension DefaultUserRepository: UserRepository {

    func saveIsLaunchedValue(_ isLaunched: Bool) {
        userStorage.saveIsLaunchedValue(isLaunched)
    }

    func loadIsLaunchedValue() -> Bool {
        return userStorage.loadIsLaunchedValue()
    }

    func saveUserName(with name: String) {
        userStorage.saveUserName(with: name)
    }

    func loadUserName() -> String {
        return userStorage.loadUserName()
    }

    func resetUser() {
        userStorage.resetUser()
    }

}
