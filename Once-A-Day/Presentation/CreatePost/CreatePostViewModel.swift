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

		let createPost = input.createPostTrigger.withLatestFrom(input.textContent)
			.map {
				TimeLineContent(text: $0)
			}
			.flatMapLatest {
//				guard let self = self else { return }	// self 가 nil 일때 return 처리를 어떻게 하지...??
				return self.useCase.save(content: $0)
					.asDriverOnErrorJustComplete()
			}
		return Output()
	}
}
