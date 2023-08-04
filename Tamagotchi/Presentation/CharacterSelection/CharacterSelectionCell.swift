//
//  CharacterSelectionCell.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

class CharacterSelectionCell: UICollectionViewCell {

    static let identifier = "CharacterSelectionCell"

    // MARK: - UI Components

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameButton: UIButton!

    // MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }

    override func prepareForReuse() {
        imageView.image = nil
        nameButton.setTitle(nil, for: .normal)
    }

}

// MARK: - Methods

extension CharacterSelectionCell {

    func configure(with type: TamagotchiType) {
        imageView.image = UIImage(named: type.thumbnailImage)
        nameButton.setTitle(type.name, for: .normal)
    }

    func configureEmpty() {
        imageView.image = UIImage(named: "noImage")
        nameButton.setTitle("준비중이에요", for: .normal)
    }
}

// MARK: - Private Methods

private extension CharacterSelectionCell {

    func configureUI() {
        imageView.layer.cornerRadius = 45.0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 2.0

        nameButton.setupNameButton()
    }

}
