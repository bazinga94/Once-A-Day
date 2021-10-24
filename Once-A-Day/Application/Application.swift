//
//  Application.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit

final class Application {
	static let shared = Application()

	private let timeLineUseCaseProviderByRealm: TimeLineUseCaseProvider

	init() {
		self.timeLineUseCaseProviderByRealm = TimeLineUseCaseProviderByRealm()
	}

	func configureMainInterface(in window: UIWindow) {
		let baseTabBarviewController = BaseTabBarViewController()

		let timeLineNavigationController = UINavigationController()
		let timeLineNavigator = DefaultTimeLineNavigator(navigationController: timeLineNavigationController,
														 services: timeLineUseCaseProviderByRealm)

		let createPostNavigationController = UINavigationController()
		let createPostNavigator = DefaultCreatePostNavigator(navigationController: createPostNavigationController)

		baseTabBarviewController.viewControllers = [
			timeLineNavigationController,
			createPostNavigationController
		]

		window.rootViewController = baseTabBarviewController

		timeLineNavigator.toTimeLineView()
		createPostNavigator.toCreatePost()
	}
}
