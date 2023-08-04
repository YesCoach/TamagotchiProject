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

    @IBOutlet var bubbleImageView: UIImageView!
    @IBOutlet var bubbleLabel: UILabel!
    @IBOutlet var tamagotchiImageView: UIImageView!
    @IBOutlet var nameButton: UIButton!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var riceTextField: UITextField!
    @IBOutlet var waterTextField: UITextField!
    @IBOutlet var riceButton: UIButton!
    @IBOutlet var waterButton: UIButton!

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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tamagotchi = UserDefaultsManager.currentTamagotchi
    }

    // MARK: - Action

    @IBAction func didRiceButtonTouched(_ sender: UIButton) {
        feedRice()
    }

    @IBAction func didWaterButtonTouched(_ sender: UIButton) {
        feedWater()
    }

    @IBAction func didBackgroudViewTouched(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

// MARK: - Method

extension MainViewController {

    func configureData(with tamagotchi: Tamagotchi) {
        self.tamagotchi = tamagotchi
    }

}

// MARK: - Private Method

private extension MainViewController {

    func configureUI() {
        configureButton()

        bubbleLabel.text = ""
        bubbleLabel.numberOfLines = 0
        bubbleLabel.setupTextStyleBody()

        tamagotchiImageView.image = .init(named: tamagotchi.imageName)
        tamagotchiImageView.contentMode = .scaleAspectFill

        // TODO: - nameLabel Button 이슈 해결하기

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

    func feedRice() {
        if let count = Int(riceTextField.text!), count < 100 {
            tamagotchi.rice += count
            UserDefaultsManager.currentRice += count
        } else {
            tamagotchi.rice += 1
            UserDefaultsManager.currentRice += 1
        }
    }

    func feedWater() {
        if let count = Int(waterTextField.text!), count < 100 {
            tamagotchi.water += count
            UserDefaultsManager.currentWater += count
        } else {
            tamagotchi.water += 1
            UserDefaultsManager.currentWater += 1
        }
    }

}
