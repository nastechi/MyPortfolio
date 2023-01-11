//
//  Observable.swift
//  MyPortfolio
//
//  Created by Анастасия on 10.01.2023.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
