//
//  CreatePostViewModel.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/11/05.
//

import Domain
import Foundation

class CreatePostViewModel: ViewModelType {
	struct Input {

	}
	struct Output {

	}

	private let useCase: CreatePostUseCase
	private let navigator: CreatePostNavigator

	init(useCase: CreatePostUseCase, navigator: CreatePostNavigator) {
		self.useCase = useCase
		self.navigator = navigator
	}
	
	func transform(input: Input) -> Output {
		return Output()
	}
}
