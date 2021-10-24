//
//  TimeLineViewModel.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import Foundation
import RxSwift
import RxCocoa

class TimeLineViewModel: ViewModelType {
	struct Input {

	}
	struct Output {
		var timeLineContents: Driver<[TimeLineTextCellModel]>
	}

	private let useCase: TimeLineUseCase
	private let navigator: TimeLineNavigator

	init(useCase: TimeLineUseCase, navigator: TimeLineNavigator) {
		self.useCase = useCase
		self.navigator = navigator
	}

	func transform(input: Input) -> Output {
		let timeLineContents = useCase.fetchTimeLine()
			.asDriverOnErrorJustComplete()
			.map {
				$0.map {
					TimeLineTextCellModel(timeLineContent: $0)
				}
			}

		return Output(
			timeLineContents: timeLineContents
		)
	}
}
