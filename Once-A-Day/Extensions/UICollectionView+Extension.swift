//
//  UICollectionView+Extension.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import UIKit

extension UICollectionView {

	func registerByXib(type: UICollectionViewCell.Type, identifier: String? = nil) {
		register(UINib(nibName: type.reuseID, bundle: nil), forCellWithReuseIdentifier: identifier ?? type.reuseID)
	}

	func registerByCode(type: UICollectionViewCell.Type, identifier: String? = nil) {
		register(type, forCellWithReuseIdentifier: identifier ?? type.reuseID)
	}

	func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UICollectionViewCell {
		guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.reuseID,
											 for: indexPath) as? T else {
			fatalError()
		}
		return cell
	}
}
