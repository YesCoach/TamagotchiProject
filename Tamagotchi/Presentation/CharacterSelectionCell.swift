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
        nameButton.setTitle(type.description, for: .normal)
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

        nameButton.layer.cornerRadius = 5.0
        nameButton.layer.borderColor = UIColor.border.cgColor
        nameButton.layer.borderWidth = 0.5
        nameButton.setTitleColor(.border, for: .normal)
        nameButton.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .bold)
        nameButton.titleLabel?.adjustsFontSizeToFitWidth = true
        nameButton.titleLabel?.numberOfLines = 1

        // TODO: - deprecated 메서드 보완하기

        nameButton.titleEdgeInsets = .init(top: 4, left: 4, bottom: 4, right: 4)
        nameButton.setTitle("따끔따끔 다마고치", for: .normal)
        nameButton.isEnabled = false
    }

}
