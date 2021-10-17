//
//  BottomTabBarItem.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/17.
//

import UIKit

protocol BottomTabBarItem {
	var title: String { get }
	var viewController: UIViewController { get }
	var iconImage: UIImage { get }
	var lottieView: AnimationView { get }
}
