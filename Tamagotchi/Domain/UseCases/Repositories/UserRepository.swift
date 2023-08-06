//
//  UserRepository.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

protocol UserRepository {

    func saveIsLaunchedValue(_ isLaunched: Bool)
    func loadIsLaunchedValue() -> Bool
    func saveUserName(with name: String)
    func loadUserName() -> String
    func resetUser()

}
