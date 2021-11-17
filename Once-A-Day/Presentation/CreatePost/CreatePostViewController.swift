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

	var errorBinding: Binder<Error> {
		return Binder(self, binding: { (vc, error) in
			let alert = UIAlertController(
				title: "Present Error",
				message: error.localizedDescription,
				preferredStyle: .alert
			)
			let action = UIAlertAction(
				title: "Dismiss",
				style: UIAlertAction.Style.cancel,
				handler: nil
			)
			alert.addAction(action)
			vc.present(alert, animated: true, completion: nil)
		})
	}

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

		output.createPost
			.drive()
			.disposed(by: disposeBag)
		output.createEnabled
			.drive(submitButton.rx.isEnabled)
			.disposed(by: disposeBag)
		output.error
			.drive(errorBinding)
			.disposed(by: disposeBag)
	}
}
