//
//  Project.swift
//  MyPortfolio
//
//  Created by Анастасия on 10.01.2023.
//

import Foundation

struct Project: Codable {
    let name: String
    var description: String?
}

class ProjectList {
    var projects: Observable<[Project]> = Observable([])
}
