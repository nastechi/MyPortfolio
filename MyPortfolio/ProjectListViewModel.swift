//
//  ProjectListViewModel.swift
//  MyPortfolio
//
//  Created by Анастасия on 10.01.2023.
//

import Foundation

struct ProjectListViewModel {
    var projects: Observable<[ProjectTableViewCellViewModel]> = Observable([])
    
    func fetchData() {
        projects.value?.append(ProjectTableViewCellViewModel(name: "Nastechi", description: "vs MVVM"))
    }
}

struct ProjectTableViewCellViewModel {
    let name: String
    let description: String
}

