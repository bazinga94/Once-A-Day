//
//  TimeLineViewController.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit

class TimeLineViewController: UIViewController {

	private var collectionView: UICollectionView = UICollectionView(frame: .zero).then {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.backgroundColor = .clear
		$0.showsVerticalScrollIndicator = false
	}

	private var collectionViewFlowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout().then {
		$0.scrollDirection = .vertical
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		addSubviews()
		activateConstraints()
	}
}

//extension TimeLineViewController: UICollectionViewDataSource {
//	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		<#code#>
//	}
//
//	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//		<#code#>
//	}
//}
//
//extension TimeLineViewController: UICollectionViewDelegateFlowLayout {
//
//}
//
//extension TimeLineViewController: UICollectionViewDelegate {
//
//}

private extension TimeLineViewController {
//	func configureCollectionView() {
//		collectionView.delegate = self
//		collectionView.dataSource = self
//	}

	func addSubviews() {
		self.view.addSubview(collectionView)
	}

	func activateConstraints() {
		collectionView.snp.makeConstraints { make in
			make.leading.trailing.bottom.equalTo(self.view)
			make.top.equalTo(self.view).offset(60)
		}
	}
}
