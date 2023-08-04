//
//  CharacterSelectionViewController.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

final class CharacterSelectionViewController: UIViewController {

    static let identifier = "CharacterSelectionViewController"

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }


}

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
    }
}
