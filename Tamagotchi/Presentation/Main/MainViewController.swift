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

    private var tamagotchi: Tamagotchi?

    override func viewDidLoad() {
        super.viewDidLoad()
        tamagotchi = Tamagotchi(type: .ddakkeum, level: 1, rice: 1, water: 1)
        configureUI()
    }

    @IBAction func didRiceButtonTouched(_ sender: UIButton) {

    }

    @IBAction func didWaterButtonTouched(_ sender: UIButton) {

    }

}

private extension MainViewController {

    func configureUI() {
        guard let tamagotchi else { return }
        bubbleLabel.text = ""
        bubbleLabel.numberOfLines = 0
        bubbleLabel.setupTextStyleBody()

        tamagotchiImageView.image = .init(named: tamagotchi.imageName)
        tamagotchiImageView.contentMode = .scaleAspectFill

        nameButton.setupNameButton(tamagotchi.type.name)
        statusLabel.text = tamagotchi.info
        statusLabel.setupTextStyleSubTitle()

        configureButton()
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
}
