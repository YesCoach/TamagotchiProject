//
//  CharacterSelectionViewModelTests.swift
//  TamagotchiTests
//
//  Created by 박태현 on 2023/08/07.
//

import XCTest
@testable import Tamagotchi

final class CharacterSelectionViewModelTests: XCTestCase {

    var sut: CharacterSelectionViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.setUpWithError()
        sut = nil
    }

    func test_viewDidLoadWhenInitialState_titleIsInitialStateTitle() {
        sut = DefaultCharacterSelectionViewModel(state: .initial)

        // given

        // when
        sut.viewDidLoad()

        // then
        XCTAssertEqual(sut.navigationItemTitle.value, CharacterSelectionState.initial.title)
    }

    func test_viewDidLoadWhenChangeState_titleIsChangeStateTitle() {
        sut = DefaultCharacterSelectionViewModel(state: .change)

        // given

        // when
        sut.viewDidLoad()

        // then
        XCTAssertEqual(sut.navigationItemTitle.value, CharacterSelectionState.change.title)
    }

    func test_viewDidLoad_outputViewStateIsApplied() {

        // given
        let state = CharacterSelectionState.change
        sut = DefaultCharacterSelectionViewModel(state: state)

        // when
        sut.viewDidLoad()

        // then
        XCTAssertEqual(sut.viewState.value, state)
    }

}
