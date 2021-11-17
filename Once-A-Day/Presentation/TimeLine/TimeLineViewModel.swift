//
//  TimeLineViewModel.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import Domain
import Foundation
import RxSwift
import RxCocoa

class TimeLineViewModel: ViewModelType {
	struct Input {
		let trigger: Driver<Void>
	}
	struct Output {
		let timeLineContents: Driver<[TimeLineTextCellModel]>
		let error: Driver<Error>
	}

	private let useCase: TimeLineUseCase
	private let navigator: TimeLineNavigator

	init(useCase: TimeLineUseCase, navigator: TimeLineNavigator) {
		self.useCase = useCase
		self.navigator = navigator
	}

	func transform(input: Input) -> Output {
		let errorTracker = ErrorTracker()

		let timeLineContents = input.trigger.flatMapLatest { [unowned self] _ in
			return self.useCase.fetchTimeLine()
				.trackError(errorTracker)
				.asDriverOnErrorJustComplete()
				.map {
					$0.map {
						TimeLineTextCellModel(timeLineContent: $0)
					}
				}
		}

//		let timeLineContents = useCase.fetchTimeLine()
//			.trackError(errorTracker)
//			.asDriverOnErrorJustComplete()
//			.map {
//				$0.map {
//					TimeLineTextCellModel(timeLineContent: $0)
//				}
//			}

		return Output(
			timeLineContents: timeLineContents,
			error: errorTracker.asDriver()
		)
	}
}
