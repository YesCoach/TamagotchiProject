//
//  AppDIContainer.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import Foundation

final class AppDIContainer {

    // MARK: - DIContainers

    func makeDIContainer() -> DIContainer {

        let dependencies = DIContainer.Dependencies()
        
        return DIContainer(dependencies: dependencies)
    }
    
}

