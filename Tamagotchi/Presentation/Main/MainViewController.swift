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

    private var character: Tamagotchi?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didRiceButtonTouched(_ sender: UIButton) {

    }

    @IBAction func didWaterButtonTouched(_ sender: UIButton) {

    }

}

private extension MainViewController {

    func configureUI() {

    }
}
