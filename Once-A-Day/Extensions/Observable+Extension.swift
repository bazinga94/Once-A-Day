//
//  Observable+Extension.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/24.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {

	func asDriverOnErrorJustComplete() -> Driver<Element> {
		return asDriver { error in
			print(error.localizedDescription)
			return Driver.empty()
		}
	}

	func mapToVoid() -> Observable<Void> {
		return map { _ in }
	}
}
