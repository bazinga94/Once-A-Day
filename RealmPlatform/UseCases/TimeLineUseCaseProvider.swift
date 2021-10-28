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

final class TimeLineUseCaseProvider: Domain.TimeLineUseCaseProvider {

	// TODO: Framework화 하면 명명 변경
	private let configuration: Realm.Configuration

	public init(configuration: Realm.Configuration = Realm.Configuration()) {
		self.configuration = configuration
	}

	public func makeTimeLineUseCase() -> Domain.TimeLineUseCase {
		return TimeLineUseCase()
	}
}
