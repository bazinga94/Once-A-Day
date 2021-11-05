//
//  CreatePostUseCaseProvider.swift
//  RealmPlatform
//
//  Created by Jongho Lee on 2021/11/06.
//

import Domain
import Foundation
import Realm
import RealmSwift

public final class CreatePostUseCaseProvider: Domain.CreatePostUseCaseProvider {

	private let configuration: Realm.Configuration

	public init(configuration: Realm.Configuration = Realm.Configuration()) {
		self.configuration = configuration
	}

	public func makeCreatePostUseCase() -> Domain.CreatePostUseCase {
		let repository = Repository<TimeLineContent>.init(configuration: configuration)
		return CreatePostUseCase(repository: repository)
	}
}
