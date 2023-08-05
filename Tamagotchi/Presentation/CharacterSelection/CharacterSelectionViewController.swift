//
//  CharacterSelectionViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

enum CharacterSelectionStatus {
    case initial
    case change
}


final class CharacterSelectionViewController: UIViewController {

    static let identifier = "CharacterSelectionViewController"

    // MARK: - UI Components

    @IBOutlet var collectionView: UICollectionView!

    // MARK: - Properties
    private let data = TamagotchiType.allCases

    var status: CharacterSelectionStatus = .initial

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
    func configure(with status: CharacterSelectionStatus) {
        self.status = status
    }

}

// MARK: - Private Method

private extension CharacterSelectionViewController {

    func configureUI() {
        configureNavigationItem()
        configureCollectionView()
    }

    func configureNavigationItem() {
        navigationItem.title = (status == .change ? "다마고치 변경하기" : "다마고치 선택하기")
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
            // TODO: - 준비중이에요 얼럿 처리

            return
        }

        guard let viewController = UIStoryboard(
            name: "Main",
            bundle: nil
        ).instantiateViewController(
            withIdentifier: CharacterDetailPopUpViewController.identifier
        ) as? CharacterDetailPopUpViewController
        else { return }
        viewController.configure(with: type, status: status)
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }
}
