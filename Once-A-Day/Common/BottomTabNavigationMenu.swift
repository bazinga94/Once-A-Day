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

			let itemView = createTabItemView(item: menuItem).then {
				$0.translatesAutoresizingMaskIntoConstraints = false
				$0.clipsToBounds = true
				$0.tag = idx
				self.addSubview($0)
			}

			itemView.snp.makeConstraints { make in
				make.leading.equalTo(self).offset(itemLeadingAnchor)
				make.top.equalTo(self)
				make.height.equalTo(self)
				make.width.equalTo(itemWidth)
			}
//			NSLayoutConstraint.activate([
//				itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
//				itemView.widthAnchor.constraint(equalToConstant: itemWidth),
//				itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: itemLeadingAnchor),
//				itemView.topAnchor.constraint(equalTo: self.topAnchor)
//			])

			self.setNeedsLayout()
			self.activateTab(index: 0)	// 첫번째 tab
		}
	}

	private func createTabItemView(item: BottomTabBarItemType) -> UIView {
		let tabTitleLabel = UILabel(frame: .zero).then {
			$0.tag = 12
			$0.text = item.title
			$0.textColor = .lightGray
			$0.textAlignment = .center
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.clipsToBounds = true
		}

		let tabItemView = UIView(frame: .zero).then {
			$0.tag = 11
			$0.backgroundColor = .clear
			$0.addSubview(tabTitleLabel)
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.clipsToBounds = true
			$0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:))))
		}

		tabItemView.tag = 11
		tabTitleLabel.tag = 12
//		tabIconLottieView.tag = 13

//		tabItemIconView.image = item.iconImage.withRenderingMode(.automatic)	// 이거 머지??
//		tabItemIconView.image = item.iconImage
//		tabIconLottieView.loopMode = .playOnce
//		tabIconLottieView.contentMode = .scaleAspectFill
//		tabItemIconView.frame = .init()
//		tabIconLottieView.translatesAutoresizingMaskIntoConstraints = false
//		tabIconLottieView.clipsToBounds = true

//		tabItemView.addSubview(tabItemIconView)
//		tabItemView.addSubview(tabIconLottieView)

		tabTitleLabel.snp.makeConstraints { make in
			make.top.equalTo(tabItemView).offset(20)
			make.centerX.equalTo(tabItemView)
			make.height.equalTo(15)
		}

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
