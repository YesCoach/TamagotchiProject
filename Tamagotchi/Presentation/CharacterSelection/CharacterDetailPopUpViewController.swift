//
//  CharacterDetailPopUpViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

final class CharacterDetailPopUpViewController: UIViewController {

    static let identifier = "CharacterDetailPopUpViewController"

    // MARK: - UI Components

    @IBOutlet var popUpview: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameButton: UIButton!
    @IBOutlet var separator: UIView!
    @IBOutlet var infoLabel: UILabel!

    @IBOutlet var bottomSeparator: UIView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var okButton: UIButton!

    private var tamagotchiType: TamagotchiType?
    private var characterSelectionStatus: CharacterSelectionStatus?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Actions

    @IBAction func didCancelButtonTouched(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func didOkButtonTouched(_ sender: UIButton) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate

        guard let tamagotchiType else { return }

        UserDefaultsManager.currentType = tamagotchiType.rawValue

        let viewController = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            identifier: MainViewController.identifier,
            creator: { coder in
                let viewController = MainViewController(
                    tamagotchi: UserDefaultsManager.currentTamagotchi,
                    coder: coder
                )
                return viewController
            }
        )

        UserDefaultsManager.isLaunched = true
        let nav = UINavigationController(rootViewController: viewController)

        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }

}

// MARK: - Method

extension CharacterDetailPopUpViewController {

    func configure(with type: TamagotchiType, status: CharacterSelectionStatus) {
        self.tamagotchiType = type
        self.characterSelectionStatus = status
    }

}

// MARK: - Private Method

private extension CharacterDetailPopUpViewController {

    func configureUI() {

        imageView.image = .init(named: tamagotchiType?.thumbnailImage ?? "noImage")
        imageView.contentMode = .scaleAspectFill

        nameButton.setupNameButton(tamagotchiType?.name)

        separator.backgroundColor = .border
        bottomSeparator.backgroundColor = .separator

        infoLabel.setupTextStyleBody()
        infoLabel.numberOfLines = 0
        infoLabel.text = tamagotchiType?.description
        infoLabel.textAlignment = .center

        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = .cancleButton
        cancelButton.setTitleColor(.border, for: .normal)

        okButton.setTitle(characterSelectionStatus == .initial ? "시작하기" : "변경하기", for: .normal)
        okButton.backgroundColor = .background
        okButton.setTitleColor(.border, for: .normal)

        view.backgroundColor = .black.withAlphaComponent(0.3)

        popUpview.layer.cornerRadius = 10.0
        popUpview.clipsToBounds = true
        popUpview.backgroundColor = .background
    }
}
