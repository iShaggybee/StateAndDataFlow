//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var storageManager: StorageManager
    @State private var name = ""
    @State private var isNameValid = false
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                TextField("Enter your name...", text: $name)
                    .onChange(of: name) { _ in isNameValid = name.count >= 3 }
                    .multilineTextAlignment(.center)
                
                Button(action: registerUser) {
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text("Ok")
                    }
                }
                .disabled(!isNameValid)
            }
            
            Text("\(name.count)")
                .foregroundColor(isNameValid ? .green : .red)
                .frame(width: 40)
        }
        .padding(EdgeInsets(top: 0, leading: 48, bottom: 0, trailing: 8))
    }
}

extension RegisterView {
    private func registerUser() {
        if isNameValid {
            storageManager.userName = name
            storageManager.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
