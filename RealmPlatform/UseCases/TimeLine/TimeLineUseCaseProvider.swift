//
//  TimeLineUseCaseProvider.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import Domain
import Foundation
import Realm
import RealmSwift

public final class TimeLineUseCaseProvider: Domain.TimeLineUseCaseProvider {

	private let configuration: Realm.Configuration

	public init(configuration: Realm.Configuration = Realm.Configuration()) {
		self.configuration = configuration
	}

	public func makeTimeLineUseCase() -> Domain.TimeLineUseCase {
		let repository = Repository<TimeLineContent>.init(configuration: configuration)
		return TimeLineUseCase(repository: repository)
	}
}
