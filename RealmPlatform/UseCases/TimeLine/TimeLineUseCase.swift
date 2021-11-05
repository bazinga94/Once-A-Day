//
//  TimeLineUseCase.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import Domain
import Foundation
import RxSwift

final class TimeLineUseCase<Repository>: Domain.TimeLineUseCase where Repository: AbstractRepository, Repository.DomainEntity == TimeLineContent {

	private let repository: Repository

	init(repository: Repository) {
		self.repository = repository
	}

	func fetchTimeLine() -> Observable<[TimeLineContent]> {
//		let observable: Observable<[TimeLineContent]> = Observable.of([
//			TimeLineContent(text: "1"),
//			TimeLineContent(text: "2"),
//			TimeLineContent(text: "3")])
//		return observable
		return repository.queryAll()
	}
}
