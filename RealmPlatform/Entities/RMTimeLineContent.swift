//
//  RMTimeLineContent.swift
//  RealmPlatform
//
//  Created by Jongho Lee on 2021/10/31.
//

import Domain
//import Then
import Realm
import RealmSwift

class RMTimeLineContent: Object {
	@objc dynamic var text: String = ""
}

extension RMTimeLineContent: DomainConvertibleType {
	func asDomain() -> TimeLineContent {
		return TimeLineContent(text: self.text)
	}
}

extension TimeLineContent: RealmRepresentable {
//	internal var uid: String {
//		return ""
//	}

	func asRealm() -> RMTimeLineContent {
//		return RMTimeLineContent().then {	// 예시 코드에는 build라는 extension을 만들어서 사용
//			$0.text = text
//		}
		let object = RMTimeLineContent()
		object.text = text
		return object
	}
}
