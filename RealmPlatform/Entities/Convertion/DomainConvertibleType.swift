//
//  DomainConvertibleType.swift
//  RealmPlatform
//
//  Created by Jongho Lee on 2021/10/31.
//

import Foundation

protocol DomainConvertibleType {
	associatedtype DomainType

	func asDomain() -> DomainType
}
