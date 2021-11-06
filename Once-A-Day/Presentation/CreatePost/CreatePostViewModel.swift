//
//  CreatePostViewModel.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/11/05.
//

import Domain
import Foundation
import RxSwift
import RxCocoa

class CreatePostViewModel: ViewModelType {
	struct Input {
		let textContent: Driver<String>
		let createPostTrigger: Driver<Void>
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
		let saveText = Driver.of(input.textContent)
		let createPost = input.createPostTrigger
			.do(onNext: navigator.toCreatePost)
		return Output()
	}
}
