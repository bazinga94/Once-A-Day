//
//  BaseTabBarViewController.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/17.
//

import UIKit
import Lottie
import Then
import SnapKit

class BaseTabBarViewController: UITabBarController {
	private var customTabBar: BottomTabNavigationMenu = .init().then {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.clipsToBounds = true
	}
	private let tabBarHeight: CGFloat = 120.0

	var bottomTabBarItems: [BottomTabBarItemType] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		loadTabBar()
	}

	private func loadTabBar() {
		tabBar.isHidden = true
//		let sampleViewController = UIViewController().then {
//			$0.view.backgroundColor = .init(red: 177/255, green: 156/255, blue: 217/255, alpha: 1.0)
//		}

//		let firstItem = BottomTabBarItem(title: "혜윤아", viewController: sampleViewController)
//		let secondItem = BottomTabBarItem(title: "오늘도", viewController: sampleViewController)
//		let thirdItem = BottomTabBarItem(title: "화이팅", viewController: sampleViewController)
//		let fourthItem = BottomTabBarItem(title: "🔥", viewController: sampleViewController)
//
		let tabBarItems: [BottomTabBarItemType] = [BottomTabBarItem(title: "Timeline"), BottomTabBarItem(title: "Post")]
		self.setupCustomTabMenu(tabBarItems)
		self.setupBlurEffectView()
		self.selectedIndex = 0	// 초기 index는 0
	}

	private func setupBlurEffectView() {
		let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
		let blurEffectView = UIVisualEffectView(effect: blurEffect).then {
			$0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.clipsToBounds = true
			self.view.insertSubview($0, belowSubview: customTabBar)
		}

		blurEffectView.snp.makeConstraints { make in
			make.leading.trailing.equalTo(tabBar)
			make.top.equalTo(customTabBar)
			make.height.equalTo(tabBarHeight)
		}
	}

	private func setupCustomTabMenu(_ menuItems: [BottomTabBarItemType]) {
		let frame = tabBar.frame

		self.customTabBar.frame = frame
		self.customTabBar.menuItems = menuItems
		self.customTabBar.delegate = self
		self.view.addSubview(customTabBar)

		customTabBar.snp.makeConstraints { make in
			make.top.equalTo(self.view.snp.bottom).offset(-self.tabBarHeight)
			make.leading.equalTo(tabBar)
			make.trailing.equalTo(tabBar)
			make.height.equalTo(self.tabBarHeight)
		}
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
