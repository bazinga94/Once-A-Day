//
//  CreatePostViewController.swift
//  Once-A-Day
//
//  Created by Jongho Lee on 2021/10/23.
//

import UIKit

class CreatePostViewController: UIViewController {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var submitButton: UIButton!

	var viewModel: CreatePostViewModel!

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
