//
//  ProjectListViewModel.swift
//  MyPortfolio
//
//  Created by Анастасия on 10.01.2023.
//

import Foundation

struct ProjectListViewModel {
    
    var appCoordinator: AppCoordinator?
    
    var projects: Observable<[Project]> = Observable([])
    
    func fetchData() {
        projects.value?.append(Project(name: "Nastechi", description: "vs MVVM"))
    }
    
    func addButtonPressed() {
        appCoordinator?.goToAddProjectPage()
    }
}
