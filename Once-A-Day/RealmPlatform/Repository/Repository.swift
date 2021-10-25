//
//  Repository.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/25.
//

import Foundation
import RxSwift

protocol AbstractRepository {
	associatedtype T
	func queryAll() -> Observable<[T]>
}
