//
//  CharacterSelectionCell.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/04.
//

import UIKit

class CharacterSelectionCell: UICollectionViewCell {

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
        contentView.backgroundColor = .background

        imageView.image = UIImage(named: type.thumbnailImage)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.backgroundColor = UIColor.background.cgColor
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
        nameButton.setupNameButton()
    }

}
