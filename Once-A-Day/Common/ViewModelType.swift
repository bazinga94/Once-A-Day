//
//  ViewModelType.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import Foundation

protocol ViewModelType {
	associatedtype Input
	associatedtype Output

	func transform(input: Input) -> Output
}
