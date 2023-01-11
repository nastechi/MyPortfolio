//
//  AddProjectViewController.swift
//  MyPortfolio
//
//  Created by Анастасия on 11.01.2023.
//

import UIKit

class AddProjectViewController: UIViewController {
    
    var viewModel: AddProjectViewModel?
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var backButton = {
        let button = UIButton()
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var saveButton = {
        let button = UIButton()
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.placeholder = "Name"
        return textField
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .placeholderText
        textView.font = UIFont.systemFont(ofSize: 17)
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.isScrollEnabled = false
        textView.text = "Description"
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        descriptionTextView.delegate = self
        layoutView()
        dismissKeyboard()
    }
    
    @objc private func backButtonPressed() {
        viewModel?.backButtonPressed()
    }
    
    @objc private func saveButtonPressed() {
        if let name = nameTextField.text, !name.isEmpty {
            if descriptionTextView.text == "description" {
                descriptionTextView.text = nil
            }
            viewModel?.addProject(withName: name, description: descriptionTextView.text)
        }
    }
    
    private func layoutView() {
        view.backgroundColor = .systemBackground
        view.addSubview(topStackView)
        topStackView.addArrangedSubview(backButton)
        topStackView.addArrangedSubview(UIView())
        topStackView.addArrangedSubview(saveButton)
        view.addSubview(nameTextField)
        view.addSubview(descriptionTextView)
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 16).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 11).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}

extension AddProjectViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        descriptionTextView.text = ""
        descriptionTextView.textColor = .label
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == nil || textView.text == "" {
            textView.textColor = .placeholderText
            textView.text = "Description"
        }
    }
}

extension AddProjectViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension AddProjectViewController {

    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboardTouchOutside() {
        view.endEditing(true)
    }
}
