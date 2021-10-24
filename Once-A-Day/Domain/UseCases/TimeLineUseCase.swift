//
//  TimeLineUseCase.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import Foundation
import RxSwift

public protocol TimeLineUseCase {
	func fetchTimeLine() -> Observable<[TimeLineContent]>
}
