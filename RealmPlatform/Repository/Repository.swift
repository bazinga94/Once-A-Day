//
//  Repository.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/25.
//

import Foundation
import RxSwift
import Realm
import RealmSwift

protocol AbstractRepository {
	associatedtype DomainEntity
	func queryAll() -> Observable<[DomainEntity]>
	func save(entity: DomainEntity) -> Observable<Void>
}

final class Repository<T: RealmRepresentable>: AbstractRepository where T == T.RealmType.DomainType, T.RealmType: Object {

	private let configuration: Realm.Configuration
	private let scheduler: RunLoopThreadScheduler

	private var realm: Realm {
		return try! Realm(configuration: self.configuration)
	}

	init(configuration: Realm.Configuration) {
		self.configuration = configuration
		let name = "com.Once-A-Day.RealmPlatform.Repository"
		self.scheduler = RunLoopThreadScheduler(threadName: name)
		print("File 📁 url: \(RLMRealmPathForFile("default.realm"))")
	}

	func queryAll() -> Observable<[T]> {
		return Observable.deferred {
			let realm = self.realm
			let objects = realm.objects(T.RealmType.self)

			return Observable.of(objects)
//			return Observable.array(from: objects) RxRealm에서 사용 가능
				.mapToDomain()
		}
		.subscribe(on: scheduler)
	}

	func save(entity: T) -> Observable<Void> {
		return Observable.deferred {
			return Observable.create { observer in
				do {
					try self.realm.write {
//						self.realm.add(entity.asRealm(), update: true)
						self.realm.add(entity.asRealm(), update: .all)
					}
					observer.onNext(())
					observer.onCompleted()
				} catch {
					observer.onError(error)
				}
				return Disposables.create()
			}
		}.subscribe(on: scheduler)
	}
}
