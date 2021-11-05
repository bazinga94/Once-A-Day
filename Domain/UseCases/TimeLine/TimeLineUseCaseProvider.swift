//
//  TimeLineUseCaseProvider.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import Foundation

public protocol TimeLineUseCaseProvider {
	func makeTimeLineUseCase() -> TimeLineUseCase
}
