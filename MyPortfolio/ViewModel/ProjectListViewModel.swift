//
//  ProjectListViewModel.swift
//  MyPortfolio
//
//  Created by Анастасия on 10.01.2023.
//

import Foundation

struct ProjectListViewModel {
    
    var appCoordinator: AppCoordinator?
    var projectList: ProjectList?
    
    func fetchData() {
        projectList?.projects.value?.append(Project(name: "MyPortfolio", description: "This is an IOS app to list your projects. I used UIKit and MVVM."))
    }
    
    func addButtonPressed() {
        appCoordinator?.goToAddProjectPage()
    }
}
