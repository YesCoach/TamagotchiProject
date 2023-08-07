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

final class DefaultUserUseCase {

    // MARK: - Dependency

    private let userRepository: UserRepository

    // MARK: - Dependency Injection

    init(userRepository: UserRepository = DefaultUserRepository()) {
        self.userRepository = userRepository
    }

}

// MARK: - UserUseCase 구현부

extension DefaultUserUseCase: UserUseCase {

    func saveIsLaunchedValue(_ isLaunched: Bool) {
        userRepository.saveIsLaunchedValue(isLaunched)
    }

    func loadIsLaunchedValue() -> Bool {
        return userRepository.loadIsLaunchedValue()
    }

    func saveUserName(with name: String) {
        userRepository.saveUserName(with: name)
    }

    func loadUserName() -> String {
        return userRepository.loadUserName()
    }

    func resetUser() {
        return userRepository.resetUser()
    }

}
