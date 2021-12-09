//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ListCell: View {
    var item: Item
    var body: some View {
        HStack {
            Image(systemName: "1.circle")
            Text("hi")
        }
    }
}


