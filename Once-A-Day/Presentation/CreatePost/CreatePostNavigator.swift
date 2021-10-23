//
//  CreatePostNavigator.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit

protocol CreatePostNavigator {
	func toCreatePost()
}

class DefaultCreatePostNavigator: CreatePostNavigator {

	private let navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func toCreatePost() {
		let vc = CreatePostViewController()
		navigationController.pushViewController(vc, animated: false)
	}
}
