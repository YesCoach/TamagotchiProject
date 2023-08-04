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
    @IBOutlet var nameLabel: UILabel!

    // MARK: - Initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }

}

// MARK: - Methods

extension CharacterSelectionCell {

}

// MARK: - Private Methods

private extension CharacterSelectionCell {

    func configureUI() {
        imageView.layer.cornerRadius = 30.0
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1.0

        nameLabel.layer.cornerRadius = 10.0
        nameLabel.layer.borderColor = UIColor.lightGray.cgColor
        nameLabel.layer.borderWidth = 1.0
        nameLabel.font = .systemFont(ofSize: 14.0, weight: .bold)
        nameLabel.textColor = .gray
    }

}
