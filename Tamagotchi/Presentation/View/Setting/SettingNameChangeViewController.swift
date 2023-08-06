//
//  SettingNameChangeViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/05.
//

import UIKit

final class SettingNameChangeViewController: UIViewController {

    static let identifier = "SettingNameChangeViewController"

    // MARK: - UI Components

    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

    }

    // MARK: - Actions

    @IBAction func didSaveButtonTouched(_ sender: UIBarButtonItem) {
        let nicknameLength = nickNameTextField.text!.count
        guard nicknameLength > 1 && nicknameLength < 7
        else {
            let alertController = UIAlertController.simpleConfirmAlert(
                message: "이름은 2글자 이상 6글자 이하까지 가능해요!"
            )
            present(alertController, animated: true)
            return
        }

        UserDefaultsManager.currentNickname = nickNameTextField.text!
        navigationController?.popViewController(animated: true)
    }

    @IBAction func didKeyboardReturnEntered(_ sender: UITextField) {
        view.endEditing(true)
        didSaveButtonTouched(saveBarButtonItem)
    }

    @IBAction func didBackgroundViewTouched(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}

// MARK: - Private Method

extension SettingNameChangeViewController {

    func configureUI() {
        configureNavigationItem()

        view.backgroundColor = .background

        nickNameTextField.setupBottomBorder()
        nickNameTextField.placeholder = "\(UserDefaultsManager.currentNickname)님 이름을 알려주세요!"
    }

    func configureNavigationItem() {
        navigationItem.title = "\(UserDefaultsManager.currentNickname)님 이름 정하기"
        navigationItem.backBarButtonItem?.tintColor = .border
        saveBarButtonItem.title = "저장"
        saveBarButtonItem.tintColor = .border
    }

}
