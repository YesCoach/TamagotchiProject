//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/05.
//

import UIKit

final class SettingViewController: UIViewController {

    static let identifier = "SettingViewController"

    @IBOutlet var dismissButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    @IBAction func didDismissButtonTouched() {
        navigationController?.popViewController(animated: true)
    }
}

private extension SettingViewController {
    func configureUI() {
        configureNavigationItem()
    }

    func configureNavigationItem() {
        navigationItem.title = "설정"
        dismissButton.image = .init(systemName: "chevron.left")
        dismissButton.tintColor = .border
    }
}
