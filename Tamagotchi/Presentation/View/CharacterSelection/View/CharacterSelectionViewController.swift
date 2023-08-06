//
//  CharacterSelectionViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

enum CharacterSelectionState {
    case initial
    case change
}


final class CharacterSelectionViewController: UIViewController {

    static let identifier = "CharacterSelectionViewController"

    // MARK: - UI Components

    @IBOutlet var collectionView: UICollectionView!

    // MARK: - Properties
    private let data = TamagotchiType.allCases

    var status: CharacterSelectionState = .initial

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }

}

// MARK: - Methods

extension CharacterSelectionViewController {

    /// 다마고치 선택 화면의 종류를 설정합니다.
    /// - Parameter status: .initial: 시작하기, .change: 변경하기
    func configure(with status: CharacterSelectionState) {
        self.status = status
    }

}

// MARK: - Private Method

private extension CharacterSelectionViewController {

    func configureUI() {
        configureNavigationItem()
        configureCollectionView()
        configureStatusBarColor(with: .background)
        collectionView.backgroundColor = .background
    }

    func configureNavigationItem() {
        navigationItem.title = (status == .change ? "다마고치 변경하기" : "다마고치 선택하기")
        navigationController?.navigationBar.barTintColor = .background
        navigationController?.navigationBar.backgroundColor = .background
    }

    func configureCollectionView() {
        let nib = UINib(nibName: CharacterSelectionCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CharacterSelectionCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self

        let layout = UICollectionViewFlowLayout()
        let spacing = 16.0
        let width = UIScreen.main.bounds.width - (spacing * 4)

        layout.itemSize = .init(width: width / 3, height: width / 2.5)
        layout.sectionInset = UIEdgeInsets(
            top: spacing,
            left: spacing,
            bottom: spacing,
            right: spacing
        )
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical

        collectionView.collectionViewLayout = layout
    }

}

// MARK: - UICollectionViewDataSource 구현부

extension CharacterSelectionViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return data.count + 20
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterSelectionCell.identifier,
            for: indexPath
        ) as? CharacterSelectionCell
        else { return UICollectionViewCell() }

        let row = indexPath.row
        if let type = TamagotchiType(rawValue: row) {
            cell.configure(with: type)
        } else {
            cell.configureEmpty()
        }

        return cell
    }

}

// MARK: - UICollectionViewDelegate 구현부

extension CharacterSelectionViewController: UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        guard let type = TamagotchiType(rawValue: indexPath.row)
        else {
            let alert = UIAlertController.simpleConfirmAlert(
                title: "준비중이에요!",
                message: "새로운 친구를 기대해주세요ㅎㅎ"
            )
            present(alert, animated: true)
            return
        }

        let viewController = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            identifier: CharacterDetailPopUpViewController.identifier,
            creator: { [weak self] coder in
                let viewController = CharacterDetailPopUpViewController(
                    viewModel: DefaultCharacterDetailPopUpViewModel(
                        type: type,
                        state: self?.status ?? .change
                    ),
                    coder: coder
                )
                return viewController
            }
        )

        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }
}
