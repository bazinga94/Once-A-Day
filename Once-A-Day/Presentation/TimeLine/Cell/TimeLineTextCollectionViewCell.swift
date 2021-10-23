//
//  TimeLineTextCollectionViewCell.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit
import RxSwift
import RxCocoa

class TimeLineTextCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var textLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func configure(data: TimeLineTextCellModel) {
		textLabel.text = data.content
	}
}
