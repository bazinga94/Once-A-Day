//
//  TimeLineViewController.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit
import RxSwift

class TimeLineViewController: UIViewController {

	private let disposeBag = DisposeBag()

	private var collectionView: UICollectionView = {
		let collectionViewFlowLayout = UICollectionViewFlowLayout().then {
			$0.scrollDirection = .vertical
		}
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout).then {
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.backgroundColor = .clear
			$0.showsVerticalScrollIndicator = false
			$0.registerByXib(type: TimeLineTextCollectionViewCell.self)
		}
		return collectionView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		addSubviews()
		activateConstraints()
		bindViewModel()
	}
}

private extension TimeLineViewController {

	func addSubviews() {
		self.view.addSubview(collectionView)
	}

	func activateConstraints() {
		collectionView.snp.makeConstraints { make in
			make.leading.trailing.bottom.equalTo(self.view)
			make.top.equalTo(self.view).offset(60)
		}
	}

	func bindViewModel() {
		let textObservable: Observable<[TimeLineTextCellModel]> = Observable.of([TimeLineTextCellModel(content: "1"), TimeLineTextCellModel(content: "2"), TimeLineTextCellModel(content: "3")])
		textObservable
			.asDriverOnErrorJustComplete()
			.drive(collectionView.rx.items(cellIdentifier: TimeLineTextCollectionViewCell.reuseID, cellType: TimeLineTextCollectionViewCell.self)) { _, viewModel, cell in
				cell.configure(data: viewModel)
			}
			.disposed(by: disposeBag)

	}
}
