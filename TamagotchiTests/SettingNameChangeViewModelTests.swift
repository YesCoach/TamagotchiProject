//
//  SettingNameChangeViewModelTests.swift
//  TamagotchiTests
//
//  Created by 박태현 on 2023/08/07.
//

import XCTest
@testable import Tamagotchi

final class SettingNameChangeViewModelTests: XCTestCase {

    var sut: SettingNameChangeViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DefaultSettingNameChangeViewModel(userUseCase: MockUserUseCase())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_didSaveButtonTouchedWithNewName_updateName() {
        // given
        let newName = "고래밥"

        // when
        sut.didSaveButtonTouched(newName: newName)

        // then
        XCTAssertTrue(sut.isNameChangeCompleted.value)
    }

    func test_didSaveButtonTouchedWithShortNewName_updateNameFailed() {
        // given
        let newName = "아"

        // when
        sut.didSaveButtonTouched(newName: newName)

        // then
        XCTAssertFalse(sut.isNameChangeCompleted.value)
        XCTAssertTrue(sut.isNewNameUnavailable.value)
    }

    func test_didSaveButtonTouchedWithLongNewName_updateNameFailed() {
        // given
        let newName = "가나다라마바사"

        // when
        sut.didSaveButtonTouched(newName: newName)

        // then
        XCTAssertFalse(sut.isNameChangeCompleted.value)
        XCTAssertTrue(sut.isNewNameUnavailable.value)
    }

    func test_viewDidLoad_currentNameIsLoaded() {
        // given
        let defaultName = "대장"

        // when
        sut.viewDidLoad()

        // then
        XCTAssertEqual(sut.currentName.value, defaultName)
    }
}
