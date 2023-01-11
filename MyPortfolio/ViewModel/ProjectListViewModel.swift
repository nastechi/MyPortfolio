//
//  ProjectListViewModel.swift
//  MyPortfolio
//
//  Created by Анастасия on 10.01.2023.
//

import UIKit
import CoreData

struct ProjectListViewModel {
    
    var appCoordinator: AppCoordinator?
    var projectList: ProjectList?
    
    func fetchData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<ProjectModel> = ProjectModel.fetchRequest()
        
        do {
            projectList?.projects.value = try context.fetch(request)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addButtonPressed() {
        appCoordinator?.goToAddProjectPage()
    }
}
