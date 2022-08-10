//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    let storageManager = StorageManager.shared
    
    @Published var isRegister = false {
        willSet {
            storageManager.isRegister = newValue
        }
    }
    var name = "" {
        willSet {
            storageManager.userName = newValue
        }
    }
    
    init() {
        isRegister = storageManager.isRegister
        name = storageManager.userName
    }
    
    func logout() {
        isRegister.toggle()
        name = ""
    }
}
