//
//  TimeLineTextCellModel.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import Domain
import Foundation

struct TimeLineTextCellModel {
	var content: String

	init(timeLineContent: TimeLineContent) {
		self.content = timeLineContent.textContent
	}
}
