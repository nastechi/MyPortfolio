//
//  ViewController.swift
//  MyPortfolio
//
//  Created by Анастасия on 10.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel = ProjectListViewModel()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ProjectTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.projects.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.fetchData()
        
        setupTableView()
        layoutView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
    }

    private func layoutView() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        setupConstrains()
    }
    
    private func setupConstrains() {
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.projects.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProjectTableViewCell
        if let project = viewModel.projects.value?[indexPath.row] {
            cell.setProjectCell(withTitle: project.name, description: project.description)
        }
        return cell
    }
    
}
