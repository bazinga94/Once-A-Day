//
//  RealmRepresentable.swift
//  RealmPlatform
//
//  Created by Jongho Lee on 2021/10/31.
//

import Foundation

protocol RealmRepresentable {
	associatedtype RealmType: DomainConvertibleType

//	var uid: String { get }

	func asRealm() -> RealmType
}
