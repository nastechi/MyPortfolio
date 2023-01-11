//
//  ViewController.swift
//  MyPortfolio
//
//  Created by Анастасия on 10.01.2023.
//

import UIKit

class ProjectListViewController: UIViewController {
    
    var viewModel: ProjectListViewModel?
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return button
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProjectTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.projectList?.projects.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel?.fetchData()
        
        setupTableView()
        layoutView()
    }
    
    @objc private func addButtonPressed() {
        viewModel?.addButtonPressed()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
    }

    private func layoutView() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        view.addSubview(addButton)
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        tableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ProjectListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.projectList?.projects.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProjectTableViewCell
        if let project = viewModel?.projectList?.projects.value?[indexPath.row] {
            cell.setProjectCell(withTitle: project.name!, description: project.desc)
        }
        return cell
    }
    
}
