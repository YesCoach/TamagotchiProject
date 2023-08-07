//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

final class MainViewController: UIViewController {

    static let identifier = "MainViewController"

    // MARK: - UI Components

    @IBOutlet var contentView: UIView!
    @IBOutlet var bubbleImageView: UIImageView!
    @IBOutlet var bubbleLabel: UILabel!
    @IBOutlet var tamagotchiImageView: UIImageView!
    @IBOutlet var nameButton: UIButton!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var riceTextField: UITextField!
    @IBOutlet var waterTextField: UITextField!
    @IBOutlet var riceButton: UIButton!
    @IBOutlet var waterButton: UIButton!
    @IBOutlet var settingBarButtonItem: UIBarButtonItem!

    private let viewModel: MainViewModel

    // MARK: - Initializer

    init?(viewModel: MainViewModel, coder: NSCoder) {
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
        viewModel.viewDidLoad()
        bindingViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureRandomBubbleLabel()
        viewModel.viewWillAppear()
    }

    // MARK: - Actions

    @IBAction func didRiceButtonTouched(_ sender: UIButton) {
        viewModel.didRiceButtonTouched(count: Int(riceTextField.text!) ?? 1)
        riceTextField.text = nil
        configureRandomBubbleLabel()
    }

    @IBAction func didWaterButtonTouched(_ sender: UIButton) {
        viewModel.didWaterButtonTouched(count: Int(waterTextField.text!) ?? 1)
        waterTextField.text = nil
        configureRandomBubbleLabel()
    }

    @IBAction func didBackgroudViewTouched(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func didSettingButtonTouched(_ sender: UIBarButtonItem) {
        let viewController = AppDIContainer()
            .makeDIContainer()
            .makeSettingViewController()

        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Method

extension MainViewController {

    func bindingViewModel() {
        viewModel.tamagotchi.bind { [weak self] tamagotchi in
            if let tamagotchi {
                self?.tamagotchiImageView.image = .init(named: tamagotchi.imageName)
                self?.nameButton.setTitle(tamagotchi.type.name, for: .normal)
                self?.statusLabel.text = tamagotchi.info
            }
        }
        viewModel.tamagotchhiStory.bind { [weak self] tamagotchiStory in
            self?.bubbleLabel.text = tamagotchiStory
        }
        viewModel.userName.bind { [weak self] name in
            self?.navigationItem.title = "\(name)님의 다마고치"
        }
    }

}

// MARK: - Private Method

private extension MainViewController {

    func configureUI() {
        configureButton()
        configureNavigationBar()
        configureNavigationItem()

        view.backgroundColor = .background
        contentView.backgroundColor = .background

        bubbleLabel.text = ""
        bubbleLabel.numberOfLines = 0
        bubbleLabel.setupTextStyleSubTitle()

        tamagotchiImageView.contentMode = .scaleAspectFill
        nameButton.setupNameButton()
        statusLabel.setupTextStyleSubTitle()

        riceTextField.setupBottomBorder()
        riceTextField.placeholder = "밥주세용"
        riceTextField.textAlignment = .center
        riceTextField.keyboardType = .numberPad

        waterTextField.setupBottomBorder()
        waterTextField.placeholder = "물주세용"
        waterTextField.textAlignment = .center
        waterTextField.keyboardType = .numberPad
    }

    func configureButton() {
        var config = UIButton.Configuration.feedingButtonStyle()
        config.image = .init(systemName: "drop.circle")
        config.title = "밥먹기"
        riceButton.configuration = config

        config.image = .init(systemName: "leaf.circle")
        config.title = "물먹기"
        waterButton.configuration = config
    }

    func configureNavigationItem() {
        settingBarButtonItem.image = .init(systemName: "person.circle")
        navigationItem.backButtonTitle = ""
    }

    func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.border
        ]
        navigationController?.navigationBar.tintColor = .border
        navigationController?.navigationBar.barTintColor = .background
    }

    func configureRandomBubbleLabel() {
        viewModel.willTamagotchiStoryChange()
    }
}
