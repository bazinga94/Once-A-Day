//
//  BottomTabNavigationMenu.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/17.
//

import UIKit
import Lottie

protocol BottomTabNavigationMenuDelegate: AnyObject {
	func itemTapped(index: Int)
}

class BottomTabNavigationMenu: UIView {
	private var activeItem: Int = 0
	private let iconViewHeight: CGFloat = 40

	var menuItems: [BottomTabBarItemType] = [] {
		willSet {
			subviews.forEach({ $0.removeFromSuperview() })
		}
		didSet {
			addTabBarView(items: menuItems)
		}
	}

	weak var delegate: BottomTabNavigationMenuDelegate?

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .clear
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		fatalError()
	}

	convenience init(menuItems: [BottomTabBarItemType], frame: CGRect) {
		self.init(frame: frame)
		backgroundColor = .clear
		addTabBarView(items: menuItems)
	}

	private func addTabBarView(items: [BottomTabBarItemType]) {
		let itemWidth = self.frame.width / CGFloat(menuItems.count)

		for (idx, menuItem) in menuItems.enumerated() {
			let itemLeadingAnchor = itemWidth * CGFloat(idx)

			let itemView = createTabItemView(item: menuItem)
			itemView.translatesAutoresizingMaskIntoConstraints = false
			itemView.clipsToBounds = true
			itemView.tag = idx

			self.addSubview(itemView)

			NSLayoutConstraint.activate([
				itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
				itemView.widthAnchor.constraint(equalToConstant: itemWidth),
				itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: itemLeadingAnchor),
				itemView.topAnchor.constraint(equalTo: self.topAnchor)
			])

			self.setNeedsLayout()
			self.activateTab(index: 0)	// 첫번째 tab
		}
	}

	private func createTabItemView(item: BottomTabBarItemType) -> UIView {
		let tabItemView = UIView(frame: .zero)
		let tabTitleLabel = UILabel(frame: .zero)
//		let tabItemIconView = UIImageView(frame: .zero)
//		let tabIconLottieView = item.lottieView

		tabItemView.tag = 11
		tabTitleLabel.tag = 12
//		tabIconLottieView.tag = 13

		tabTitleLabel.text = item.title
		tabTitleLabel.textColor = .lightGray
		tabTitleLabel.textAlignment = .center
		tabTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		tabTitleLabel.clipsToBounds = true

//		tabItemIconView.image = item.iconImage.withRenderingMode(.automatic)	// 이거 머지??
//		tabItemIconView.image = item.iconImage
//		tabIconLottieView.loopMode = .playOnce
//		tabIconLottieView.contentMode = .scaleAspectFill
//		tabItemIconView.frame = .init()
//		tabIconLottieView.translatesAutoresizingMaskIntoConstraints = false
//		tabIconLottieView.clipsToBounds = true

		tabItemView.backgroundColor = .clear
		tabItemView.addSubview(tabTitleLabel)
//		tabItemView.addSubview(tabIconLottieView)
		tabItemView.translatesAutoresizingMaskIntoConstraints = false
		tabItemView.clipsToBounds = true

		NSLayoutConstraint.activate([
//			tabIconLottieView.heightAnchor.constraint(equalToConstant: self.iconViewHeight),
//			tabIconLottieView.widthAnchor.constraint(equalToConstant: self.iconViewHeight),
//			tabIconLottieView.centerXAnchor.constraint(equalTo: tabItemView.centerXAnchor),
//			tabIconLottieView.topAnchor.constraint(equalTo: tabItemView.topAnchor, constant: 8),

			tabTitleLabel.heightAnchor.constraint(equalToConstant: 15),
			tabTitleLabel.centerXAnchor.constraint(equalTo: tabItemView.centerXAnchor),
			tabTitleLabel.topAnchor.constraint(equalTo: tabItemView.topAnchor, constant: 20)
//			tabTitleLabel.topAnchor.constraint(equalTo: tabIconLottieView.bottomAnchor, constant: 4)
		])

		tabItemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))

		return tabItemView
	}

	@objc func handleTap(_ sender: UIGestureRecognizer) {
		self.switchTab(from: self.activeItem, to: sender.view!.tag)
	}

	func switchTab(from: Int, to: Int) {
		self.deactivateTab(index: from)
		self.activateTab(index: to)
	}

	func activateTab(index: Int) {
		let activateTabView = self.subviews[index]
		let label = activateTabView.viewWithTag(12) as? UILabel
		let lottie = activateTabView.viewWithTag(13) as? AnimationView

		DispatchQueue.main.async {
			label?.textColor = .black
			lottie?.play()
		}
		self.activeItem = index
		self.delegate?.itemTapped(index: index)
	}

	func deactivateTab(index: Int) {
		let activateTabView = self.subviews[index]
		let label = activateTabView.viewWithTag(12) as? UILabel
		let lottie = activateTabView.viewWithTag(13) as? AnimationView

		DispatchQueue.main.async {
			label?.textColor = .lightGray
			lottie?.stop()
		}
	}
}
