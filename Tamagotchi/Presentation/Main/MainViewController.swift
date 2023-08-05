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

    private var tamagotchi: Tamagotchi {
        didSet {
            tamagotchiImageView.image = UIImage(named: tamagotchi.imageName)
            statusLabel.text = tamagotchi.info
        }
    }

    // MARK: - Initializer

    init?(tamagotchi: Tamagotchi, coder: NSCoder) {
        self.tamagotchi = tamagotchi
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureRandomBubbleLabel()
        configureNavigationItem()
    }

    // MARK: - Actions

    @IBAction func didRiceButtonTouched(_ sender: UIButton) {
        feedRice()
        configureRandomBubbleLabel()
    }

    @IBAction func didWaterButtonTouched(_ sender: UIButton) {
        feedWater()
        configureRandomBubbleLabel()
    }

    @IBAction func didBackgroudViewTouched(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    @IBAction func didSettingButtonTouched(_ sender: UIBarButtonItem) {
        guard let viewController = UIStoryboard(
            name: "Setting",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: SettingViewController.identifier
        ) as? SettingViewController
        else { return }

        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Private Method

private extension MainViewController {

    func configureUI() {
        configureButton()

        view.backgroundColor = .background
        contentView.backgroundColor = .background

        bubbleLabel.text = ""
        bubbleLabel.numberOfLines = 0
        bubbleLabel.setupTextStyleSubTitle()

        tamagotchiImageView.image = .init(named: tamagotchi.imageName)
        tamagotchiImageView.contentMode = .scaleAspectFill

        nameButton.setupNameButton(tamagotchi.type.name)

        statusLabel.text = tamagotchi.info
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
        navigationItem.title = "\(UserDefaultsManager.currentNickname)님의 다마고치"
        settingBarButtonItem.image = .init(systemName: "person.circle")
    }

    func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.border
        ]
        navigationController?.navigationBar.tintColor = .border
        navigationController?.navigationBar.barTintColor = .background
    }

    func configureRandomBubbleLabel() {
        bubbleLabel.text = TamagotchiStory.randomStory()
    }

    func feedRice() {
        if let count = Int(riceTextField.text!) {
            tamagotchi.rice += count < 100 ? count : 0
            UserDefaultsManager.currentRice += count < 100 ? count : 0
        } else {
            tamagotchi.rice += 1
            UserDefaultsManager.currentRice += 1
        }
        riceTextField.text = nil
    }

    func feedWater() {
        if let count = Int(waterTextField.text!) {
            tamagotchi.water += count < 50 ? count : 0
            UserDefaultsManager.currentWater += count < 50 ? count : 0
        } else {
            tamagotchi.water += 1
            UserDefaultsManager.currentWater += 1
        }
        waterTextField.text = nil
    }

}
