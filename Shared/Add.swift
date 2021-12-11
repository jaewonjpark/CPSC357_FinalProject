//
//  Add.swift
//  FinanceTracker
//
//  Created by Jaewon Park on 12/11/21.
//

import SwiftUI

struct Add: View
{
    @State private var name: String = ""
    @State private var amount: String = ""
    @State private var description: String = ""
    @State private var type: String = ""
    
    var body: some View
    {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Add_Previews: PreviewProvider
{
    static var previews: some View
    {
        Add()
    }
}
