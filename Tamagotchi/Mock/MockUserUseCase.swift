//
//  MockUserUseCase.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

final class MockUserUseCase: UserUseCase {

    private var mockIsLaunched: Bool = false
    private var mockUserName: String = "대장"

    func saveIsLaunchedValue(_ isLaunched: Bool) {
        mockIsLaunched = isLaunched
    }

    func loadIsLaunchedValue() -> Bool {
        return mockIsLaunched
    }

    func saveUserName(with name: String) {
        mockUserName = name
    }

    func loadUserName() -> String {
        return mockUserName
    }

    func resetUser() {
        mockIsLaunched = false
        mockUserName = "대장"
    }

}
