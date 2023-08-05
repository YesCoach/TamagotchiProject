//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/05.
//

import UIKit

final class SettingViewController: UIViewController {

    static let identifier = "SettingViewController"
    private let cellIdentifier = "SettingCell"

    // MARK: - UI Components

    @IBOutlet var dismissButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!

    // MARK: - View LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Actions

    @IBAction func didDismissButtonTouched() {
        navigationController?.popViewController(animated: true)
    }
}

private extension SettingViewController {

    func configureUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)

        configureNavigationItem()
    }

    func configureNavigationItem() {
        navigationItem.title = "설정"
        dismissButton.image = .init(systemName: "chevron.left")
        dismissButton.tintColor = .border
    }

}

// MARK: - TableViewDataSource 구현부

extension SettingViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingType.allCases.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        else { return UITableViewCell() }

        guard let type = SettingType(rawValue: indexPath.row)
        else { return UITableViewCell() }

        cell.imageView?.image = .init(systemName: type.imageName)
        cell.textLabel?.text = type.title
        cell.textLabel?.font = .systemFont(ofSize: 14.0, weight: .regular)
        cell.accessoryType = .disclosureIndicator
        cell.tintColor = .border
        cell.detailTextLabel?.text = (type == .nameChange) ? UserDefaultsManager.currentNickname : nil

        return cell
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let type = SettingType(rawValue: indexPath.row) else { return }
        switch type {
        case .nameChange:
            guard let viewController = storyboard?.instantiateViewController(
                withIdentifier: SettingNameChangeViewController.identifier
            ) as? SettingNameChangeViewController
            else { return }

            navigationController?.pushViewController(viewController, animated: true)

        case .tamagotchiChange:
            guard let viewController = UIStoryboard(
                name: "Main",
                bundle: nil
            ).instantiateViewController(
                withIdentifier: CharacterSelectionViewController.identifier
            ) as? CharacterSelectionViewController
            else { return }

            viewController.configure(with: .change)

            navigationController?.pushViewController(viewController, animated: true)

        default: return
        }
    }
}
