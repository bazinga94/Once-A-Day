//
//  TimeLineUseCase.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import Domain
import Foundation
import RxSwift

final class TimeLineUseCase: TimeLineUseCase {

	// TODO: Repository 생성

	func fetchTimeLine() -> Observable<[TimeLineContent]> {
		let observable: Observable<[TimeLineContent]> = Observable.of([
			TimeLineContent(textContent: "1"),
			TimeLineContent(textContent: "2"),
			TimeLineContent(textContent: "3")])
		return observable
	}
}
