//
//  DefaultUserRepository.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

final class DefaultUserRepository {

    private let userStorage: UserStorage

    init(userStorage: UserStorage = UserDefaultsUser()) {
        self.userStorage = userStorage
    }

}

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
