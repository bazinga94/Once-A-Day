//
//  Reusable.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit

protocol Reusable {
	static var reuseID: String {get}
}

extension Reusable {
	static var reuseID: String {
		return String(describing: self)
	}
}

extension UITableViewCell: Reusable {}

extension UICollectionViewCell: Reusable {}
