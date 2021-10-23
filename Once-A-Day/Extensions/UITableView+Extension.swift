//
//  UITableView+Extension.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import UIKit

extension UITableView {

	func registerByXib(type: UITableViewCell.Type, identifier: String? = nil) {
		register(UINib(nibName: type.reuseID, bundle: nil), forCellReuseIdentifier: identifier ?? type.reuseID)
	}

	func registerByCode(type: UITableViewCell.Type, identifier: String? = nil) {
		register(type, forCellReuseIdentifier: identifier ?? type.reuseID)
	}

	func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
		guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID,
											 for: indexPath) as? T else {
			fatalError()
		}
		return cell
	}
}
