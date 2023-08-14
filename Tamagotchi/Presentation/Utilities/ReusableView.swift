//
//  ReusableView.swift
//  Tamagotchi
//
//  Created by 박태현 on 2023/08/14.
//

import UIKit

protocol ReusableView {

    static var identifier: String { get }

}

extension UIViewController: ReusableView {

    static var identifier: String { return String(describing: self) }

}

extension UICollectionViewCell: ReusableView {

    static var identifier: String { return String(describing: self) }

}

extension UITableViewCell: ReusableView {

    static var identifier: String { return String(describing: self) }

}
