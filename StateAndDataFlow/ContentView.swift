//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var storageManager: StorageManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Hi, \(storageManager.userName)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Spacer()
            ButtonView(buttonTitle: timer.buttonTitle, buttonColor: Color.red, action: timer.startTimer)
            Spacer()
            ButtonView(buttonTitle: "LogOut", buttonColor: Color.blue, action: storageManager.logout)
        }
        .padding(.bottom, 48)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(StorageManager())
    }
}

struct ButtonView: View {
    var buttonTitle: String
    var buttonColor: Color
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("\(buttonTitle)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(buttonColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}
