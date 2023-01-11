//
//  AddProjectViewModel.swift
//  MyPortfolio
//
//  Created by Анастасия on 11.01.2023.
//

import Foundation

struct AddProjectViewModel {
    
    var appCoordinator: AppCoordinator?
    
    func backButtonPressed() {
        appCoordinator?.goBack()
    }
}
