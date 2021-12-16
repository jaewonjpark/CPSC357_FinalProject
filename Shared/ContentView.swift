//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI

struct ContentView: View
{
    //Store a local state to a view layout
    @State private var username: String = ""
    @State private var reverse = false
    @State private var amount: Float = 0
    var body: some View {
        //Tap gesture for our logo
        //Continue tapping for fade in and out
        let tap = TapGesture()
            .onEnded { _ in
                if(reverse) {
                    amount -= 0.05
                    if(amount <= 0) {
                        reverse = false
                    }
                }
                else {
                    amount += 0.05
                    if(amount >= 1) {
                        reverse = true
                    }
                }
            }
        
            
            VStack {
                NavigationView {
                    VStack {
                        
                        Text("Monthly Money")
                            .font(.largeTitle)
                        Text("Financial Tracking App")
                            .font(.title3)
                            .padding(.bottom)
                        ZStack {
                            Image("Monetization")
                                .resizable()
                                .frame(width: 160, height: 130)
                                .opacity(Double(amount))
                            Circle()
                                .stroke(lineWidth: 15)
                                .foregroundColor(.green)
                                .frame(width: 190, height: 135)
                        }
                        
                        Text("Enter your name:")
                            .font(.headline)
                            .padding(.top)
                        DataInput(title: "Name", userInput: $username)
                        NavigationLink(destination: MainApp(username: self.username)) {
                            Text("Continue")
                                .foregroundColor(.green)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 3)
                                            .foregroundColor(.green)
                                            .frame(width: 90, height: 40))
                                
                        }
                    }
                    
                }
                
            }
            .gesture(tap)
            
            
        
        
        
        
    }
}
struct DataInput: View {
    var title: String
    var pholder: String?
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField((pholder != nil) ? pholder! : "Enter \(title)", text: $userInput)
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




