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

	var viewModel: TimeLineViewModel!

	override func viewDidLoad() {
		super.viewDidLoad()
		collectionView.delegate = self		// 이게 맞나...?
		addSubviews()
		activateConstraints()
		bindViewModel()
	}
}

private extension TimeLineViewController {
	enum Constant {
		static let inset: CGFloat = 0
		static let minimumLineSpacing: CGFloat = 10
		static let minimumInteritemSpacing: CGFloat = 0
	}

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

		let input = TimeLineViewModel.Input()
		let output = viewModel.transform(input: input)

		output.timeLineContents
			.drive(collectionView.rx.items(cellIdentifier: TimeLineTextCollectionViewCell.reuseID, cellType: TimeLineTextCollectionViewCell.self)) { _, viewModel, cell in
				cell.configure(data: viewModel)
			}
			.disposed(by: disposeBag)
	}
}

extension TimeLineViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: Constant.inset, left: Constant.inset, bottom: Constant.inset, right: Constant.inset)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return Constant.minimumLineSpacing
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return Constant.minimumInteritemSpacing
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.width, height: 80)
	}
}
