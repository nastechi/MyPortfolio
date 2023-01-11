//
//  AppCoordinator.swift
//  MyPortfolio
//
//  Created by Анастасия on 11.01.2023.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
}

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var projectList = ProjectList()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToProjectListPage()
        navigationController.isNavigationBarHidden = true
    }
    
    func goToProjectListPage() {
        let projectListVC = ProjectListViewController()
        var projectListViewModel = ProjectListViewModel()
        
        projectListViewModel.appCoordinator = self
        projectListViewModel.projectList = projectList
        projectListVC.viewModel = projectListViewModel
        
        navigationController.pushViewController(projectListVC, animated: true)
    }
    
    func goToAddProjectPage() {
        let addProjectVC = AddProjectViewController()
        var addProjectViewModel = AddProjectViewModel()
        
        addProjectViewModel.appCoordinator = self
        addProjectViewModel.projectList = projectList
        addProjectVC.viewModel = addProjectViewModel
        
        navigationController.pushViewController(addProjectVC, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
}
