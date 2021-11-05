//
//  CreatePostUseCaseProvider.swift
//  Domain
//
//  Created by Jongho Lee on 2021/11/06.
//

import Foundation

public protocol CreatePostUseCaseProvider {
	func makeCreatePostUseCase() -> CreatePostUseCase
}
