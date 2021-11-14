//
//  TimeLineContent.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import Foundation

public struct TimeLineContent {
	public let text: String
	public let id: String
	public let userId: String
	public let createdAt: String

	public init(text: String) {
		self.init(text: text, id: NSUUID().uuidString, userId: "Ian", createdAt: String(round(Date().timeIntervalSince1970 * 1000)))
	}

	public init(text: String, id: String, userId: String, createdAt: String) {
		self.text = text
		self.id = id
		self.userId = userId
		self.createdAt = createdAt
	}
}
