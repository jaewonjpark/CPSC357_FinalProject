//
//  Add.swift
//  FinanceTracker
//
//  Created by Jaewon Park on 12/11/21.
//

import SwiftUI

struct AddItem: View
{
    @StateObject var itemStore: ItemStore
    @State private var name: String = ""
    @State private var amount: String = ""
    @State private var source: String = ""
    @State private var description: String = ""
    @State private var type: Bool = false
    @State private var isVis = false
    
    var body: some View {
        Form {
            Section(header: Text("Item Details")) {
                
                DataInput(title: "Title", pholder: "e.g. Monthly Subscription", userInput: $name)
                DataInput(title: "Source", pholder: "e.g. Times Magazine", userInput: $source)
                DataInput(title: "Description", userInput: $description)
                DataInput(title: "Amount", pholder: "e.g. 23.12", userInput: $amount)
     

                Toggle(isOn: $type) {
                    Text("Source of income?").font(.headline)
                }.padding()
            }
            Button(action: addNewItem) {
                Text("Add Item")
            }
            .alert(isPresented: $isVis) {
                Alert(
                    title: Text("Error!"),
                    message: Text("Your inputted amount is not" +
                                 "a valid number.")
                )
            
            }
        }
        
        }
    func addNewItem() {
        let newItem = Item(id: UUID().uuidString,
                         name: name,
                           source: source,
                           description: description,
                           amount: (Float(amount) != nil ? Float(amount)! : 0.00),
                           type: type ? "Income" : "Expense")
        if(Float(amount) != nil) {
            if (type) {
                
                itemStore.incomes.append(newItem)
            }
            else {
                itemStore.expenses.append(newItem)

            }
        }
        else {
            isVis = true
        }
        
    }
}


struct AddItem_Previews: PreviewProvider
{
    static var previews: some View
    {
        AddItem(itemStore: ItemStore(expenses: expenseData, incomes: incomeData))
    }
}

