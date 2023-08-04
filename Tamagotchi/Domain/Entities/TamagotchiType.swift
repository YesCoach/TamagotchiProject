//
//  TamagotchiType.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import Foundation

enum TamagotchiType: Int, CaseIterable {

    case ddakkeum = 0
    case bangsil = 1
    case banjjak = 2

}

extension TamagotchiType {

    var name: String {
        switch self {
        case .ddakkeum: return "따끔따끔 다마고치"
        case .bangsil: return "방실방실 다마고치"
        case .banjjak: return "반짝반짝 다마고치"
        }
    }

    /// 다마고치의 소개글을 반환합니다.
    var description: String {
        switch self {
        case .ddakkeum: return
            """
            저는 선인장 다마고치 입니다. 키는 2cm 몸무게는 150g 이에요.
            성격은 소심하지만 마음은 따뜻해요.
            열심히 잘 먹고 잘 클 자신은 있답니다.
            반가워요 주인님!
            """
        case .bangsil: return
            """
            저는 방실방실 다마고치입니당 키는 100km 몸무게는 150톤이에용
            성격은 화끈하고 날라다닙니당~!
            열심히 잘 먹고 잘 클 자신은 있답니당 방실방실!
            """
        case .banjjak: return
            """
            저는 반짝반짝 다마고치입니당 키는 119km 몸무게는 114톤이에용
            성격은 외향적이지만 소심해요.
            뭐든 잘 먹습니다. 키운 보람이 있으실거에요.
            """
        }
    }

    /// imageQuery에 현재 레벨을 붙이면 이미지 에셋의 이름이 됩니다.
    /// ex) .ddakkeum.imageQuery + \(level) = "1-1"(따끔이의 1레벨 이미지)
    var imageQuery: String {
        return "\(self.rawValue + 1)-"
    }

    /// 캐릭터 선택창에서 사용할 썸네일 이미지입니다.
    var thumbnailImage: String {
        return "\(self.rawValue + 1)-6"
    }

}
