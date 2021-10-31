//
//  TimeLineUseCase.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import Domain
import Foundation
import RxSwift

final class TimeLineUseCase: Domain.TimeLineUseCase {

	// TODO: Repository 생성

	func fetchTimeLine() -> Observable<[TimeLineContent]> {
		let observable: Observable<[TimeLineContent]> = Observable.of([
			TimeLineContent(text: "1"),
			TimeLineContent(text: "2"),
			TimeLineContent(text: "3")])
		return observable
	}
}
