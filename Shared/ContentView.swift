//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text("Financial Tracking App")
                        .font(.largeTitle)
                    Text("Enter your name:")
                        .font(.title3)
                    DataInput(title: "Name", userInput: $username)
                    NavigationLink(destination: MainApp(username: self.username)) {
                        Text("Continue")
                            .foregroundColor(.green)
                    }
                }
                
            }
            
        }
        
        
    }
}
struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




