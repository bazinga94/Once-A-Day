//
//  CreatePostUseCase.swift
//  Domain
//
//  Created by Jongho Lee on 2021/11/06.
//

import Foundation
import RxSwift

public protocol CreatePostUseCase {
	func save(content: TimeLineContent) -> Observable<Void>
}
