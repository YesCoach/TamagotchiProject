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

        guard let viewController = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            identifier: MainViewController.identifier
        ) as? MainViewController
        else { return }

        let nav = UINavigationController(rootViewController: viewController)

        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }

}

// MARK: - Method

extension CharacterDetailPopUpViewController {

    func configure(with type: TamagotchiType) {
        self.tamagotchiType = type
    }

}

// MARK: - Private Method

private extension CharacterDetailPopUpViewController {

    func configureUI() {

        // TODO: - UI 리팩토링

        imageView.image = .init(named: tamagotchiType?.thumbnailImage ?? "noImage")
        imageView.contentMode = .scaleAspectFill

        nameButton.setupNameButton()
        nameButton.setupNameButton(tamagotchiType?.name)

        separator.backgroundColor = .border
        bottomSeparator.backgroundColor = .separator

        infoLabel.setupTextStyleBody()
        infoLabel.numberOfLines = 0
        infoLabel.text = tamagotchiType?.description

        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = .background
        cancelButton.setTitleColor(.border, for: .normal)

        okButton.setTitle("시작하기", for: .normal)
        okButton.backgroundColor = .background
        okButton.setTitleColor(.border, for: .normal)

        view.backgroundColor = .black.withAlphaComponent(0.3)

        popUpview.layer.cornerRadius = 10.0
        popUpview.clipsToBounds = true
    }
}
