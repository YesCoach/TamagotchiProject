//
//  UserDefaultsUser.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

final class UserDefaultsUser {

    // TODO: - UserDefaults DI 구현

}

extension UserDefaultsUser: UserStorage {

    func saveIsLaunchedValue(_ isLaunched: Bool) {
        UserDefaultsManager.isLaunched = isLaunched
    }

    func loadIsLaunchedValue() -> Bool {
        return UserDefaultsManager.isLaunched
    }

    func saveUserName(with name: String) {
        UserDefaultsManager.currentNickname = name
    }

    func loadUserName() -> String {
        return UserDefaultsManager.currentNickname
    }

    func resetUser() {
        UserDefaultsManager.resetUserData()
    }

}
