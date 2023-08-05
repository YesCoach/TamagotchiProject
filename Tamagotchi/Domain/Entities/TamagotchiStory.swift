//
//  TamagotchiStory.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/05.
//

import Foundation

struct TamagotchiStory {


    /// 다마고치의 이야기를 랜덤으로 반환합니다.
    /// - Returns: 다마고치 이야기 문자열
    static func randomStory() -> String {
        let data: [String] = [
            "오늘은 왠지 기분이 좋아용",
            "배고파요 ㅠㅠ 밥 먹고 싶어요",
            "목말라요~~~~~",
            "초밥 먹고 싶어요 줄무니전갱이로,,",
            "참치 대뱃살 기름 좔좔",
            "복습 아직 안하셨다구요? 지금 잠이 오세여? \(UserDefaultsManager.currentNickname)님??",
            "\(UserDefaultsManager.currentNickname)님 오늘 과제 하셨어용?",
            "\(UserDefaultsManager.currentNickname)님 오늘 깃허브 푸시 하셨어영?",
            "\(UserDefaultsManager.currentNickname)님 오늘 과제 하셨어용?",
            "\(UserDefaultsManager.currentNickname)님, 밥주세요",
            "굿 모는, \(UserDefaultsManager.currentNickname)님",
            "밥과 물을 잘먹었더니 레벨업 했어요 고마워요 \(UserDefaultsManager.currentNickname)님"
        ]
        return data.randomElement() ?? ""
    }

}
