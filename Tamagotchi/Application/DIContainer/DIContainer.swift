//
//  DIContainer.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/07.
//

import UIKit

final class DIContainer {

    struct Dependencies {

    }

    private let dependencies: Dependencies

    // MARK: - Persistent Storage

    lazy var userStorage: UserStorage = UserDefaultsUser()
    lazy var characterStorage: CharacterStorage = UserDefaultsCharacter()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

extension DIContainer {

    // MARK: - Repositories

    func makeCharacterRepository() -> CharacterRepository {
        return DefaultCharacterRepository(characterStorage: characterStorage)
    }

    func makeUserRepository() -> UserRepository {
        return DefaultUserRepository(userStorage: userStorage)
    }

    // MARK: - UseCases

    func makeCharacterUseCase() -> CharacterUseCase {
        return DefaultCharacterUseCase(characterRepository: makeCharacterRepository())
    }

    func makeUserUseCase() -> UserUseCase {
        return DefaultUserUseCase(userRepository: makeUserRepository())
    }

    // MARK: - ViewModels

    func makeMainViewModel() -> MainViewModel {
        return DefaultMainViewModel(
            characterUseCase: makeCharacterUseCase(),
            userUseCase: makeUserUseCase()
        )
    }

    func makeCharacterSelectionViewModel(
        state: CharacterSelectionState
    ) -> CharacterSelectionViewModel {
        return DefaultCharacterSelectionViewModel(state: state)
    }

    func makeCharacterDetailPopUpViewModel(
        type: TamagotchiType,
        state: CharacterSelectionState
    ) -> CharacterDetailPopUpViewModel {
        return DefaultCharacterDetailPopUpViewModel(
            characterUseCase: makeCharacterUseCase(),
            userUseCase: makeUserUseCase(),
            type: type,
            state: state
        )
    }

    func makeSettingViewModel() -> SettingViewModel {
        return DefaultSettingViewModel(
            characterUseCase: makeCharacterUseCase(),
            userUseCase: makeUserUseCase()
        )
    }

    func makeSettingNameChangeViewModel() -> SettingNameChangeViewModel {
        return DefaultSettingNameChangeViewModel(userUseCase: makeUserUseCase())
    }

    // MARK: - ViewControllers

    func makeMainViewController() -> MainViewController {
        guard let mainViewController = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            identifier: MainViewController.identifier,
            creator: { coder in
                let viewController = MainViewController(
                    viewModel: self.makeMainViewModel(),
                    coder: coder
                )
                return viewController
            }
        ) as? MainViewController
        else { fatalError("Invalid Init") }

        return mainViewController
    }

    func makeCharacterSelectionViewController(
        state: CharacterSelectionState
    ) -> CharacterSelectionViewController {
        guard let characterSelectionViewController = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            identifier: CharacterSelectionViewController.identifier,
            creator: { coder in
                let viewController = CharacterSelectionViewController(
                    viewModel: self.makeCharacterSelectionViewModel(state: state),
                    coder: coder
                )
                return viewController
            }
        ) as? CharacterSelectionViewController
        else { fatalError("Invalid Init") }

        return characterSelectionViewController
    }

    func makeCharacterDetailPopUpViewController(
        type: TamagotchiType,
        state: CharacterSelectionState
    ) -> CharacterDetailPopUpViewController {
        guard let characterDetailPopUpViewController = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            identifier: CharacterDetailPopUpViewController.identifier,
            creator: { coder in
                let viewController = CharacterDetailPopUpViewController(
                    viewModel: self.makeCharacterDetailPopUpViewModel(
                        type: type,
                        state: state
                    ),
                    coder: coder
                )
                return viewController
            }
        ) as? CharacterDetailPopUpViewController
        else { fatalError("Invalid Init") }

        return characterDetailPopUpViewController
    }

    func makeSettingViewController() -> SettingViewController {
        guard let settingViewController = UIStoryboard(
            name: "Setting",
            bundle: nil
        ).instantiateViewController(
            identifier: SettingViewController.identifier,
            creator: { coder in
                let viewController = SettingViewController(
                    viewModel: self.makeSettingViewModel(),
                    coder: coder
                )
                return viewController
            }
        ) as? SettingViewController
        else { fatalError("Invalid Init") }

        return settingViewController
    }

    func makeSettingNameChangeViewController() -> SettingNameChangeViewController {
        guard let settingNameChangeViewController = UIStoryboard(
            name: "Setting",
            bundle: nil
        ).instantiateViewController(
            identifier: SettingNameChangeViewController.identifier,
            creator: { coder in
                let viewController = SettingNameChangeViewController(
                    viewModel: self.makeSettingNameChangeViewModel(),
                    coder: coder
                )
                return viewController
            }
        ) as? SettingNameChangeViewController
        else { fatalError("Invalid Init") }

        return settingNameChangeViewController
    }

}
