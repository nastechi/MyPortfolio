//
//  AddProjectViewModel.swift
//  MyPortfolio
//
//  Created by Анастасия on 11.01.2023.
//

import UIKit
import CoreData

struct AddProjectViewModel {
    
    var appCoordinator: AppCoordinator?
    var projectList: ProjectList?
    
    func backButtonPressed() {
        appCoordinator?.goBack()
    }
    
    func addButtonPressed(projectName name: String, description: String) {
        saveProject(withName: name, description: description)
        appCoordinator?.goBack()
    }
    
    private func saveProject(withName name: String, description: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: "ProjectModel", in: context) else { return }
        
        let projectObject = ProjectModel(entity: entity, insertInto: context)
        projectObject.name = name
        projectObject.desc = description
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        projectList?.projects.value?.append(projectObject)
    }
}
