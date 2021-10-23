//
//  TimeLineViewNavigator.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit

protocol TimeLineViewNavigator {
	func toTimeLineView()
}

class DefaultTimeLineViewNavigator: TimeLineViewNavigator {

	private let navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func toTimeLineView() {
		let vc = TimeLineViewController()
		navigationController.pushViewController(vc, animated: false)
	}
}
