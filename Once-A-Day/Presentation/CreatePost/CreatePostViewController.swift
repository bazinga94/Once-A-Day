//
//  CreatePostViewController.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit
import RxSwift
import RxCocoa

class CreatePostViewController: UIViewController {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var submitButton: UIButton!

	var viewModel: CreatePostViewModel!

	private let disposeBag = DisposeBag()

	override func viewDidLoad() {
		super.viewDidLoad()
		bindViewModel()
	}

	private func bindViewModel() {
		let input = CreatePostViewModel.Input(
			textContent: textField.rx.text.orEmpty.asDriver(),
			createPostTrigger: submitButton.rx.tap.asDriver()
		)

		let output = viewModel.transform(input: input)

		output.createEnabled.drive(submitButton.rx.isEnabled)
			.disposed(by: disposeBag)
	}
}
