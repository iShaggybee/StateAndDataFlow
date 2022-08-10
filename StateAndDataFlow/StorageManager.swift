//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Kislov Vadim on 10.08.2022.
//

import SwiftUI

class StorageManager {
    static let shared = StorageManager()
    
    @AppStorage("userName") var userName = ""
    @AppStorage("isRegister") var isRegister = false
    
    private init() { }
}
