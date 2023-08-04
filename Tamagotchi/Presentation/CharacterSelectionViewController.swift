//
//  CharacterSelectionViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

final class CharacterSelectionViewController: UIViewController {

    static let identifier = "CharacterSelectionViewController"

    // MARK: - UI Components

    @IBOutlet var collectionView: UICollectionView!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }

}

// MARK: - DataSource

extension CharacterSelectionViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 20
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

        return cell
    }
}

// MARK: - Private Method

private extension CharacterSelectionViewController {

    func configureUI() {
        configureNavigationItem()
        configureCollectionView()
    }

    func configureNavigationItem() {
        navigationItem.title = "다마고치 선택하기"
    }

    func configureCollectionView() {
        let nib = UINib(nibName: CharacterSelectionCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CharacterSelectionCell.identifier)
        collectionView.dataSource = self

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
