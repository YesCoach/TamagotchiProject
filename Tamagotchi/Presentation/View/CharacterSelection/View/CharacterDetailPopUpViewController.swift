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

    // MARK: - Properties

    private let viewModel: CharacterDetailPopUpViewModel

    // MARK: - Initializer

    init?(
        viewModel: CharacterDetailPopUpViewModel,
        coder: NSCoder
    ) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindingViewModel()
    }

    // MARK: - Actions

    @IBAction func didCancelButtonTouched(_ sender: UIButton) {
        dismiss(animated: true)
    }

    @IBAction func didOkButtonTouched(_ sender: UIButton) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate

        viewModel.didOkButtonTouched()

        let viewController = AppDIContainer()
            .makeDIContainer()
            .makeMainViewController()

        let nav = UINavigationController(rootViewController: viewController)

        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }

}

// MARK: - Private Method

private extension CharacterDetailPopUpViewController {

    func configureUI() {
        imageView.contentMode = .scaleAspectFill

        nameButton.setupNameButton()
        separator.backgroundColor = .border
        bottomSeparator.backgroundColor = .separator

        infoLabel.setupTextStyleBody()
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center

        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = .cancleButton
        cancelButton.setTitleColor(.border, for: .normal)

        okButton.backgroundColor = .background
        okButton.setTitleColor(.border, for: .normal)

        view.backgroundColor = .black.withAlphaComponent(0.3)

        popUpview.layer.cornerRadius = 10.0
        popUpview.clipsToBounds = true
        popUpview.backgroundColor = .background
    }

    func bindingViewModel() {
        viewModel.thumbnailImageName.bind { [weak self] imageName in
            self?.imageView.image = .init(named: imageName)
        }
        viewModel.infoLabelText.bind { [weak self] text in
            self?.infoLabel.text = text
        }
        viewModel.nameButtonTitle.bind { [weak self] title in
            self?.nameButton.setTitle(title, for: .normal)
        }
        viewModel.okButtonTitle.bind { [weak self] title in
            self?.okButton.setTitle(title, for: .normal)
        }
    }

}
