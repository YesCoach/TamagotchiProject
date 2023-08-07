//
//  MainViewModelTests.swift
//  TamagotchiTests
//
//  Created by 박태현 on 2023/08/07.
//

import XCTest
@testable import Tamagotchi

final class MainViewModelTests: XCTestCase {

    var sut: MainViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = DefaultMainViewModel(
            characterUseCase: MockCharacterUseCase(),
            userUseCase: MockUserUseCase()
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

    func test_didRiceButtonTouchedWith3_riceIncrease3() {
        // given
        let count = 3

        // when
        sut.didRiceButtonTouched(count: count)

        // then
        XCTAssertEqual(sut.tamagotchi.value!.rice, count)
    }

    func test_didRiceButtonTouchedWith100_riceNotIncrease() {
        // given
        let count = 100

        // when
        sut.didRiceButtonTouched(count: count)

        // then
        XCTAssertEqual(sut.tamagotchi.value!.rice, 0)
    }

    func test_didWaterButtonTouchedWith3_waterIncrease3() {
        // given
        let count = 3

        // when
        sut.didWaterButtonTouched(count: count)

        // then
        XCTAssertEqual(sut.tamagotchi.value!.water, count)
    }

    func test_didWaterButtonTouchedWith50_waterNotIncrease() {
        // given
        let count = 100

        // when
        sut.didWaterButtonTouched(count: count)

        // then
        XCTAssertEqual(sut.tamagotchi.value!.water, 0)
    }

    func test_willTamagotchiStoryChange_StoryValueNotNil() {
        // given
        let defaultValue = ""

        // when
        sut.willTamagotchiStoryChange()

        // then
        XCTAssertNotEqual(sut.tamagotchhiStory.value, defaultValue)
    }

    func test_viewWillAppear_userNameWillLoaded() {
        // given
        let defaultName = "대장"

        // when
        sut.viewWillAppear()

        // then
        XCTAssertEqual(sut.userName.value, defaultName)
    }
}

// MARK: - Mock Type

extension MainViewModelTests {

    final class MockCharacterUseCase: CharacterUseCase {

        private var mockData: Tamagotchi = Tamagotchi()

        func loadCharacter() -> Tamagotchi {
            return mockData
        }

        func saveCharacter(with data: Tamagotchi) {
            mockData = data
        }

        func resetCharacter() {
            mockData = Tamagotchi()
        }

        func updateCharacterType(with type: TamagotchiType) {
            mockData.type = type
        }

    }

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
}
