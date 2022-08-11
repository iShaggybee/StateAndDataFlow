//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Kislov Vadim on 10.08.2022.
//

import SwiftUI

class StorageManager: ObservableObject {
    @AppStorage("userName") var userName = ""
    @AppStorage("isRegister") var isRegister = false
    
    func logout() {
        isRegister.toggle()
        userName = ""
    }
}
