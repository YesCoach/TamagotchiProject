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

    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!

    // MARK: - Properties

    private let viewModel: SettingNameChangeViewModel

    // MARK: - Initializer

    init?(viewModel: SettingNameChangeViewModel, coder: NSCoder) {
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

    // MARK: - Actions

    @IBAction func didSaveButtonTouched(_ sender: UIBarButtonItem) {
        viewModel.didSaveButtonTouched(newName: nicknameTextField.text!)
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
        nicknameTextField.setupBottomBorder()
    }

    func configureNavigationItem() {
        navigationItem.backBarButtonItem?.tintColor = .border
        saveBarButtonItem.title = "저장"
        saveBarButtonItem.tintColor = .border
    }

    func bindingViewModel() {
        viewModel.currentName.bind { [weak self] name in
            self?.nicknameTextField.placeholder = "\(name)님 이름을 알려주세요!"
            self?.navigationItem.title = "\(name)님 이름 정하기"
        }
        viewModel.isNewNameUnavailable.bind { [weak self] isUnavailable in
            if isUnavailable {
                let alertController = UIAlertController.simpleConfirmAlert(
                    message: "이름은 2글자 이상 6글자 이하까지 가능해요!"
                )
                self?.present(alertController, animated: true)
            }
        }
        viewModel.isNameChangeCompleted.bind { [weak self] isCompleted in
            if isCompleted {
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }

}
