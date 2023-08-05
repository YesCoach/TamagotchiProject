//
//  SettingType.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/05.
//

import Foundation

enum SettingType: Int, CaseIterable {
    case nameChange
    case tamagotchiChange
    case dataReset
}

extension SettingType {
    var title: String {
        switch self {
        case .nameChange: return "내 이름 설정하기"
        case .tamagotchiChange: return "다마고치 변경하기"
        case .dataReset: return "데이터 초기화"
        }
    }

    var imageName: String {
        switch self {
        case .nameChange: return "pencil"
        case .tamagotchiChange: return "moon.fill"
        case .dataReset: return "arrow.clockwise"
        }
    }
}
