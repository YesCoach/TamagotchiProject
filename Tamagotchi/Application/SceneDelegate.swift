//
//  SceneDelegate.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {

        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)

        if UserDefaultsManager.isLaunched == false {
            let viewController = AppDIContainer()
                .makeDIContainer()
                .makeCharacterSelectionViewController(state: .initial)

            window?.rootViewController = UINavigationController(rootViewController: viewController)
        } else {
            let viewController = AppDIContainer()
                .makeDIContainer()
                .makeMainViewController()

            window?.rootViewController = UINavigationController(rootViewController: viewController)
        }
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

}

