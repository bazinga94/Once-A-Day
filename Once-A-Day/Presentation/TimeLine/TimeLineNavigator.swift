//
//  TimeLineNavigator.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit

protocol TimeLineNavigator {
	func toTimeLineView()
}

class DefaultTimeLineNavigator: TimeLineNavigator {

	private let navigationController: UINavigationController
	private let services: TimeLineUseCaseProvider

	init(navigationController: UINavigationController,
		 services: TimeLineUseCaseProvider) {
		self.navigationController = navigationController
		self.services = services
	}

	func toTimeLineView() {
		let vc = TimeLineViewController()
		let viewModel = TimeLineViewModel(useCase: services.makeTimeLineUseCase(), navigator: self)
		vc.viewModel = viewModel
		navigationController.pushViewController(vc, animated: false)
	}
}
