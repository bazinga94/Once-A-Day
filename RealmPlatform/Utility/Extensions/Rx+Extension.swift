//
//  Rx+Extension.swift
//  RealmPlatform
//
//  Created by Jongho Lee on 2021/10/31.
//

import Foundation
import RxSwift

extension Observable where Element: Sequence, Element.Iterator.Element: DomainConvertibleType {
	typealias DomainType = Element.Iterator.Element.DomainType

	func mapToDomain() -> Observable<[DomainType]> {
		return map { sequence -> [DomainType] in
			return sequence.mapToDomain()
		}
	}
}

extension Sequence where Iterator.Element: DomainConvertibleType {
	typealias Element = Iterator.Element
	func mapToDomain() -> [Element.DomainType] {
		return map {
			return $0.asDomain()
		}
	}
}
