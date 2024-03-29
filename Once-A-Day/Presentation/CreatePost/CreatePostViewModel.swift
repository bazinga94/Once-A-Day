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
		let createPost: Driver<Void>
		let createEnabled: Driver<Bool>
		let error: Driver<Error>
	}

	private let useCase: CreatePostUseCase
	private let navigator: CreatePostNavigator

	init(useCase: CreatePostUseCase, navigator: CreatePostNavigator) {
		self.useCase = useCase
		self.navigator = navigator
	}

	func transform(input: Input) -> Output {
		let errorTracker = ErrorTracker()

		let createEnabled = input.textContent
			.map {
				!$0.isEmpty
			}

		let createPost = input.createPostTrigger.withLatestFrom(input.textContent)
			.map {
				TimeLineContent(text: $0)
			}
			.flatMapLatest { [unowned self] timeLineContent in
//				guard let self = self else { return }	// self 가 nil 일때 return 처리를 어떻게 하지...?? unowned 말고 방법이 없을까?
				return self.useCase.save(content: timeLineContent)
					.trackError(errorTracker)
					.asDriverOnErrorJustComplete()
			}

		return Output(
			createPost: createPost,
			createEnabled: createEnabled,
			error: errorTracker.asDriver()
		)
	}
}
