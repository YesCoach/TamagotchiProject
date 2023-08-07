//
//  SettingViewModelTests.swift
//  TamagotchiTests
//
//  Created by 박태현 on 2023/08/07.
//

import XCTest
@testable import Tamagotchi

final class SettingViewModelTests: XCTestCase {

    var sut: SettingViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = DefaultSettingViewModel(
            characterUseCase: MockCharacterUseCase(),
            userUseCase: MockUserUseCase()
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

    func test_viewWillAppear_userNameIsLoad() {
        // given
        let defaultUserName = "대장"

        // when
        sut.viewWillAppear()

        // then
        XCTAssertEqual(sut.currentNickName.value, defaultUserName)
    }

    // TODO: - UseCase의 Reset 로직 리팩토링하기

    func test_willDataRest_characterDataReset() {
        // given
        let tamagotchi = Tamagotchi(type: .ddakkeum, rice: 20, water: 20)
        let mockCharacterUseCase = MockCharacterUseCase()
        mockCharacterUseCase.saveCharacter(with: tamagotchi)

        sut = DefaultSettingViewModel(
            characterUseCase: mockCharacterUseCase,
            userUseCase: MockUserUseCase()
        )

        // when
        sut.willDataReset()

        // then
        XCTAssertEqual(mockCharacterUseCase.loadCharacter().rice, tamagotchi.rice)
    }

}
