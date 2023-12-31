//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/05.
//

import UIKit

final class SettingViewController: UIViewController {

    private let cellIdentifier = "SettingCell"

    // MARK: - UI Components

    @IBOutlet var tableView: UITableView!

    // MARK: - Properties

    private let viewModel: SettingViewModel

    // MARK: - Initializer

    init?(viewModel: SettingViewModel, coder: NSCoder) {
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }

}

// MARK: - Private Methods

private extension SettingViewController {

    func configureUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = .background
        view.backgroundColor = .background

        configureNavigationItem()
    }

    func configureNavigationItem() {
        navigationItem.title = "설정"
    }

    func bindingViewModel() {
        viewModel.dataList.bind { [weak self] _ in
            self?.tableView.reloadData()
        }
        viewModel.currentNickName.bind { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource 구현부

extension SettingViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataList.value.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.identifier,
            for: indexPath
        ) as? SettingTableViewCell
        else { return UITableViewCell() }

        let type = viewModel.dataList.value[indexPath.row]
        cell.configure(type: type, nickname: viewModel.currentNickName.value)

        return cell
    }

}

// MARK: - UITableViewDelegate 구현부
extension SettingViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = viewModel.dataList.value[indexPath.row]

        switch type {

        case .nameChange:
            let viewController = AppDIContainer()
                .makeDIContainer()
                .makeSettingNameChangeViewController()

            navigationController?.pushViewController(viewController, animated: true)

        case .tamagotchiChange:
            let viewController = AppDIContainer()
                .makeDIContainer()
                .makeCharacterSelectionViewController(state: .change)

            navigationController?.pushViewController(viewController, animated: true)

        case .dataReset:
            let alertController = UIAlertController(
                title: "데이터 초기화",
                message: "정말 다시 처음부터 시작하실 건가용?",
                preferredStyle: .alert
            )
            let nopeAction = UIAlertAction(title: "아냐!", style: .default)
            let confirmAction = UIAlertAction(title: "웅", style: .default) { [weak self] _ in
                self?.viewModel.willDataReset()

                let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                let sceneDelegate = windowScene?.delegate as? SceneDelegate

                let viewController = AppDIContainer()
                    .makeDIContainer()
                    .makeCharacterSelectionViewController(state: .initial)

                let nav = UINavigationController(rootViewController: viewController)

                sceneDelegate?.window?.rootViewController = nav
                sceneDelegate?.window?.makeKeyAndVisible()
            }

            [
                nopeAction, confirmAction
            ].forEach {
                alertController.addAction($0)
            }

            present(alertController, animated: true)
        }
    }

}
