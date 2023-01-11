//
//  AddProjectViewController.swift
//  MyPortfolio
//
//  Created by Анастасия on 11.01.2023.
//

import UIKit

class AddProjectViewController: UIViewController {
    
    var viewModel: AddProjectViewModel?
    
    private lazy var backButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    
    @objc private func backButtonPressed() {
        viewModel?.backButtonPressed()
    }
    
    private func layoutView() {
        view.backgroundColor = .systemBackground
        view.addSubview(backButton)
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
    }
}
