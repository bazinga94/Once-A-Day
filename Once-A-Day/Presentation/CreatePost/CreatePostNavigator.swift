//
//  CreatePostNavigator.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit
import Domain

protocol CreatePostNavigator {
	func toCreatePost()
}

class DefaultCreatePostNavigator: CreatePostNavigator {

	private let navigationController: UINavigationController
	private let services: CreatePostUseCaseProvider

	init(navigationController: UINavigationController, services: CreatePostUseCaseProvider) {
		self.navigationController = navigationController
		self.services = services
	}

	func toCreatePost() {
		let vc = CreatePostViewController()
		let viewModel = CreatePostViewModel(useCase: services.makeCreatePostUseCase(), navigator: self)
		vc.viewModel = viewModel
		navigationController.pushViewController(vc, animated: false)
	}
}
