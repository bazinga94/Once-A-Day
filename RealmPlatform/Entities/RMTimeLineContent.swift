//
//  RMTimeLineContent.swift
//  RealmPlatform
//
//  Created by Jongho Lee on 2021/10/31.
//

import Domain
import Realm
import RealmSwift

final class RMTimeLineContent: Object {
	@objc dynamic var id: String = ""
	@objc dynamic var text: String = ""

	override class func primaryKey() -> String? {
		return "id"
	}
//	Terminating app due to uncaught exception 'RLMException', reason: does not have a primary key and can not be updated'
//	*** Terminating app due to uncaught exception 'RLMException', reason: 'Primary key property 'id' does not exist on object 'RMTimeLineContent''
}

extension RMTimeLineContent: DomainConvertibleType {
	func asDomain() -> TimeLineContent {
		return TimeLineContent(text: self.text)
	}
}

extension TimeLineContent: RealmRepresentable {
//	internal var id: String {
//		return ""
//	}

	func asRealm() -> RMTimeLineContent {
		let object = RMTimeLineContent()
		object.text = text
		return object
	}
}
