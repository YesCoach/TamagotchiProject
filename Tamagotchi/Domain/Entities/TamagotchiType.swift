//
//  TamagotchiType.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import Foundation

enum TamagotchiType: Int, CaseIterable {
    case ddakkeum = 1
    case bangsil = 2
    case banjjak = 3
}

extension TamagotchiType {
    var description: String {
        switch self {
        case .ddakkeum: return "따끔따끔 다마고치"
        case .bangsil: return "방실방실 다마고치"
        case .banjjak: return "반짝반짝 다마고치"
        }
    }

    /// imageQuery에 현재 레벨을 붙이면 이미지 에셋의 이름이 됩니다.
    /// ex) .ddakkeum.imageQuery + \(level) = "1-1"(따끔이의 1레벨 이미지)
    var imageQuery: String {
        return "\(self.rawValue)-"
    }

    /// 캐릭터 선택창에서 사용할 썸네일 이미지입니다.
    var thumbnailImage: String {
        return "\(self.rawValue)-6"
    }
}
