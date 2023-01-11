//
//  AddProjectViewModel.swift
//  MyPortfolio
//
//  Created by Анастасия on 11.01.2023.
//

import Foundation

struct AddProjectViewModel {
    
    var appCoordinator: AppCoordinator?
    var projectList: ProjectList?
    
    func backButtonPressed() {
        appCoordinator?.goBack()
    }
    
    func addProject(withName name: String, description: String?) {
        projectList?.projects.value?.append(Project(name: name, description: description))
        appCoordinator?.goBack()
    }
}
