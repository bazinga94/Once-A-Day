//
//  CreatePostUseCase.swift
//  RealmPlatform
//
//  Created by Jongho Lee on 2021/11/06.
//

import Domain
import Foundation

final class CreatePostUseCase<Repository>: Domain.CreatePostUseCase where Repository: AbstractRepository, Repository.DomainEntity == TimeLineContent {

	private let repository: Repository

	init(repository: Repository) {
		self.repository = repository
	}

	func save(content: TimeLineContent) {

	}
}
