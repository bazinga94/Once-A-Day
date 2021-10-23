//
//  BottomTabBarItemType.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/17.
//

import UIKit
import Lottie

protocol BottomTabBarItemType {
	var title: String { get }
//	var viewController: UIViewController { get }
//	var iconImage: UIImage { get }
//	var lottieView: AnimationView { get }
}

struct BottomTabBarItem: BottomTabBarItemType {
	var title: String
}
