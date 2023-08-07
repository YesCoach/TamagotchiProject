//
//  CharacterDetailPopUpViewModelTests.swift
//  TamagotchiTests
//
//  Created by 박태현 on 2023/08/07.
//

import XCTest
@testable import Tamagotchi

final class CharacterDetailPopUpViewModelTests: XCTestCase {

    var sut: CharacterDetailPopUpViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
        sut = nil
    }

    func test_didOkButtonTouched_tamagotchiTypeUpdated() {

        // given
        let type = TamagotchiType.ddakkeum
        let mockCharacterUseCase = MockCharacterUseCase()
        sut = DefaultCharacterDetailPopUpViewModel(
            characterUseCase: mockCharacterUseCase,
            userUseCase: MockUserUseCase(),
            type: type,
            state: .initial
        )

        // when
        sut.didOkButtonTouched()

        // then

        XCTAssertEqual(type, mockCharacterUseCase.loadCharacter().type)
    }

    func test_didViewModelInitialized_thumbnailImageNameIsInitialized() {

        // given
        let type = TamagotchiType.banjjak
        let state = CharacterSelectionState.change

        // when
        sut = DefaultCharacterDetailPopUpViewModel(
            characterUseCase: MockCharacterUseCase(),
            userUseCase: MockUserUseCase(),
            type: type,
            state: state
        )

        // then
        XCTAssertEqual(sut.thumbnailImageName.value, type.thumbnailImage)
    }

    func test_didViewModelInitialized_nameButtonTitleIsInitialized() {

        // given
        let type = TamagotchiType.bangsil
        let state = CharacterSelectionState.initial

        // when
        sut = DefaultCharacterDetailPopUpViewModel(
            characterUseCase: MockCharacterUseCase(),
            userUseCase: MockUserUseCase(),
            type: type,
            state: state
        )

        // then
        XCTAssertEqual(sut.nameButtonTitle.value, type.name)
    }

    func test_didViewModelInitialized_infoLabelTextIsInitialized() {

        // given
        let type = TamagotchiType.ddakkeum
        let state = CharacterSelectionState.initial

        // when
        sut = DefaultCharacterDetailPopUpViewModel(
            characterUseCase: MockCharacterUseCase(),
            userUseCase: MockUserUseCase(),
            type: type,
            state: state
        )

        // then
        XCTAssertEqual(sut.infoLabelText.value, type.description)
    }

    func test_didViewModelInitialized_okButtonTitleIsInitialized() {

        // given
        let type = TamagotchiType.banjjak
        let state = CharacterSelectionState.change

        // when
        sut = DefaultCharacterDetailPopUpViewModel(
            characterUseCase: MockCharacterUseCase(),
            userUseCase: MockUserUseCase(),
            type: type,
            state: state
        )

        // then
        XCTAssertEqual(sut.okButtonTitle.value, state.buttonTitle)
    }


}
