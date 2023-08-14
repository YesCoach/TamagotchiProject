//
//  SettingTableViewCell.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/15.
//

import UIKit

final class SettingTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }

}

private extension SettingTableViewCell {

    func configureUI() {
        textLabel?.font = .systemFont(ofSize: 14.0, weight: .regular)
        accessoryType = .disclosureIndicator
        tintColor = .border
        backgroundColor = .background
    }

}

extension SettingTableViewCell {

    func configure(type: SettingType, nickname: String) {
        imageView?.image = .init(systemName: type.imageName)
        textLabel?.text = type.title
        detailTextLabel?.text = (type == .nameChange) ? nickname : nil
    }

}
