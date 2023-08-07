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

    private let viewModel: CharacterSelectionViewModel

    // MARK: - Initializer

    init?(viewModel: CharacterSelectionViewModel, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.viewDidLoad()
        bindingViewModel()
        configureUI()
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

    func bindingViewModel() {
        viewModel.navigationItemTitle.bind { [weak self] title in
            self?.navigationItem.title = title
        }
        viewModel.dataList.bind { [weak self] _ in
            self?.collectionView.reloadData()
        }
    }

}

// MARK: - UICollectionViewDataSource 구현부

extension CharacterSelectionViewController: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel.dataList.value.count + 20
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

        if viewModel.dataList.value.count > indexPath.row {
            let type = viewModel.dataList.value[indexPath.row]
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
        guard indexPath.row < viewModel.dataList.value.count else {
            let alert = UIAlertController.simpleConfirmAlert(
                title: "준비중이에요!",
                message: "새로운 친구를 기대해주세요ㅎㅎ"
            )
            present(alert, animated: true)
            return
        }

        let type = viewModel.dataList.value[indexPath.row]
        let state = viewModel.viewState.value

        let viewController = AppDIContainer()
            .makeDIContainer()
            .makeCharacterDetailPopUpViewController(
                type: type,
                state: state
            )
        
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }

}
