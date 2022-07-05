//
//  AddPostViewController.swift
//  iOSExamTest
//
//  Created by Mark Dennis Diwa on 7/3/22.
//

import UIKit
import GrowingTextView

class AddPostViewController: UIViewController {
    var viewModel: AddPostViewModel?

    @IBOutlet var textView: GrowingTextView!

    @IBAction func addPostButtonTapped(_ sender: Any) {
        viewModel?.addPost(content: textView.text,
                           onSuccess: handleAddPostSuccess(),
                           onError: handleError())
    }

}

// MARK: - Lifecycle

extension AddPostViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension AddPostViewController {
    func setup() {
        setupTextView()
    }
    
    func setupTextView() {
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.black.cgColor
    }
}

// MARK: - Event Handlers

private extension AddPostViewController {
    
    func handleAddPostSuccess() -> VoidResult {
        return { [weak self] in
            guard let self = self else { return }
            print("Success Adding")
            self.navigationController?.popViewController(animated: true)
        }
    }
}
