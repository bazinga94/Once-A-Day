//
//  Application.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import Domain
import RealmPlatform
import UIKit

final class Application {
	static let shared = Application()

	private let timeLineUseCaseProvider: Domain.TimeLineUseCaseProvider
	private let createPostUseCaseProvider: Domain.CreatePostUseCaseProvider

	init() {
		self.timeLineUseCaseProvider = RealmPlatform.TimeLineUseCaseProvider()
		self.createPostUseCaseProvider = RealmPlatform.CreatePostUseCaseProvider()
	}

	func configureMainInterface(in window: UIWindow) {
		let baseTabBarviewController = BaseTabBarViewController()

		let timeLineNavigationController = UINavigationController()
		let timeLineNavigator = DefaultTimeLineNavigator(navigationController: timeLineNavigationController,
														 services: timeLineUseCaseProvider)

		let createPostNavigationController = UINavigationController()
		let createPostNavigator = DefaultCreatePostNavigator(navigationController: createPostNavigationController, services: createPostUseCaseProvider)

		baseTabBarviewController.viewControllers = [
			timeLineNavigationController,
			createPostNavigationController
		]

		window.rootViewController = baseTabBarviewController

		timeLineNavigator.toTimeLineView()
		createPostNavigator.toCreatePost()
	}
}
