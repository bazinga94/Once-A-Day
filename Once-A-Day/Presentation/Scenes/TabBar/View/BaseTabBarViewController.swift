//
//  BaseTabBarViewController.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/17.
//

import UIKit
import Then

class BaseTabBarViewController: UITabBarController {
	private var customTabBar: BottomTabNavigationMenu! = .init().then {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.clipsToBounds = true
	}
	private var topConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
	private let tabBarHeight: CGFloat = 120.0

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		loadTabBar()
	}

	private func loadTabBar() {
		tabBar.isHidden = true
		let tabBarItems: [BottomTabBarItem] = []		// tab을 추가하고 싶으면 여기에 Item을 추가하면 된다.
		self.setupCustomTabMenu(tabBarItems)
		self.setupBlurEffectView()
		self.selectedIndex = 0	// 초기 index는 0
	}

	private func setupBlurEffectView() {
		let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		blurEffectView.translatesAutoresizingMaskIntoConstraints = false
		blurEffectView.clipsToBounds = true
		self.view.insertSubview(blurEffectView, belowSubview: customTabBar)

		NSLayoutConstraint.activate([
			blurEffectView.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
			blurEffectView.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
			blurEffectView.topAnchor.constraint(equalTo: self.customTabBar.topAnchor),
			blurEffectView.heightAnchor.constraint(equalToConstant: self.tabBarHeight)
		])
	}

	private func setupCustomTabMenu(_ menuItems: [BottomTabBarItem]) {
		let frame = tabBar.frame
		var viewControllers: [UIViewController] = []

		self.customTabBar.frame = frame
		self.customTabBar.menuItems = menuItems
		self.customTabBar.delegate = self
		self.view.addSubview(customTabBar)

		self.topConstraint = self.customTabBar.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.tabBarHeight)

		NSLayoutConstraint.activate([
			self.customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
			self.customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
			self.topConstraint,
			self.customTabBar.heightAnchor.constraint(equalToConstant: self.tabBarHeight)
		])

		menuItems.forEach { viewControllers.append($0.viewController) }
		self.viewControllers = viewControllers
	}

	func changeTab(index: Int) {
		self.selectedIndex = index
	}
}

extension BaseTabBarViewController: BottomTabNavigationMenuDelegate {
	func itemTapped(index tabIndex: Int) {
		changeTab(index: tabIndex)
	}
}
