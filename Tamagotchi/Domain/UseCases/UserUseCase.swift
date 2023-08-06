//
//  UserUseCase.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/06.
//

import Foundation

protocol UserUseCase {

    func saveIsLaunchedValue(_ isLaunched: Bool)
    func loadIsLaunchedValue() -> Bool
    func saveUserName(with name: String)
    func loadUserName() -> String
    func resetUser()

}

final class DefaultUserUseCase: UserUseCase {


}

extension DefaultUserUseCase {

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
