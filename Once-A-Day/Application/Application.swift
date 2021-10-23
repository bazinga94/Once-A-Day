//
//  Application.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit

final class Application {
	static let shared = Application()

	func configureMainInterface(in window: UIWindow) {

		let viewController = BaseTabBarViewController()
		window.rootViewController = viewController
	}
}
