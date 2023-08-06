//
//  SettingViewModel.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/06.
//

import Foundation

protocol SettingViewModelInput {
    func viewWillAppear()
    func willDataReset()
}

protocol SettingViewModelOutput {
    var dataList: CustomObservable<[SettingType]> { get }
    var currentNickName: CustomObservable<String> { get }
}

protocol SettingViewModel: SettingViewModelInput, SettingViewModelOutput { }

final class DefaultSettingViewModel: SettingViewModel {

    // MARK: - Output

    let dataList: CustomObservable<[SettingType]> = .init(SettingType.allCases)
    let currentNickName: CustomObservable<String> = .init("")

}

// MARK: - Input

extension DefaultSettingViewModel {

    func viewWillAppear() {
        currentNickName.value = UserDefaultsManager.currentNickname
    }

    func willDataReset() {
        UserDefaultsManager.resetUserData()
    }

}
