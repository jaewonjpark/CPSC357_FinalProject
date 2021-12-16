//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI


struct MainApp: View {
    let username: String //username from ContentView
    @StateObject private var itemStore : ItemStore = ItemStore(allItems: itemData, expenses: expenseData, incomes: incomeData) //taken from ItemStore.swift
    
    var body: some View {
        NavigationView {
            VStack {
                //welcome message
                Text("Welcome \(username) to Monthly Money Tracker")
                    .font(.title2)
                    .padding(0)
                //go to account overview with summary information
                NavigationLink(destination: Overview(total_expenses: sumItemAmounts(itemStore.expenses), total_incomes: sumItemAmounts(itemStore.incomes))) {
                    Text("My Account Overview")
                        .padding(0)
                }
                
                NavigationView {
                    VStack {
                       
                        
                            //List of expense items
                            VStack (spacing: 0) {
                                
                                List {
                                    Text("Expenses")
                                        .font(.title2)
                                    ForEach (itemStore.expenses) { expense in
                                        ListCell(item: expense)
                                    }
                                    .onDelete(perform: deleteExpenses)
                                    .onMove(perform: moveExpenses)
                                    
                                }
                                                            
                            }
                            
                        
                       
                            //List for income items
                            VStack {
                                
                                List {
                                    Text("Incomes")
                                        .font(.title2)
                                    ForEach (itemStore.incomes) { income in
                                        ListCell(item: income)
                                    }
                                    .onDelete(perform: deleteIncomes)
                                    .onMove(perform: moveIncomes)
                                }
                               
                            }
                       
                        
                    }
                    
                }
         
                .navigationBarItems(leading: NavigationLink(destination: AddItem(itemStore: self.itemStore)) {
                Text("Add New Item")
                        .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .cornerRadius(10)
                
                
                }, trailing: EditButton()
                                        .padding()
                                        .foregroundColor(.blue)            )

                
            }
        }
       
    }
        //takes an array of Items and returns the sum of their amount fields
    func sumItemAmounts (_ array: [Item]) -> Float {
        var sum: Float = 0
        for item in array {
            sum += item.amount
        }
        return sum
    }
    //deletes an item from the expenses array
    func deleteExpenses(at offsets: IndexSet) {
        itemStore.expenses.remove(atOffsets: offsets)
        print("\(itemStore.expenses)")

    }
    //moves an item around the expenses array
    func moveExpenses(from source: IndexSet, to destination: Int) {
        itemStore.expenses.move(fromOffsets: source, toOffset: destination)
        print("\(itemStore.expenses)")

    }
    //deletes an item from the incomes array
    func deleteIncomes(at offsets: IndexSet) {
        itemStore.incomes.remove(atOffsets: offsets)
        print("\(itemStore.incomes)")

    }
    //moves an item around the incomes array
    func moveIncomes(from source: IndexSet, to destination: Int) {
        itemStore.incomes.move(fromOffsets: source, toOffset: destination)
        print("\(itemStore.incomes)")
    }
    
    

}



struct MainApp_Previews: PreviewProvider {
    static var previews: some View {
        MainApp(username: "Ryan Millares")
    }
}

struct ListCell: View {
    var item: Item
    
    var body: some View {
        NavigationLink (destination: ItemView(selectedItem: item)) {
            HStack {
                Image(systemName: "1.circle")
                Text(item.name)
                Spacer()
                //rounds amount to exactly two decimals
                Text("$\(String(round(item.amount * 100.00) / 100.00).components(separatedBy: ".")[1].count < 2 ? String(round(item.amount * 100.00) / 100.00) + "0" : String(round(item.amount * 100.00) / 100.00))")
                    .foregroundColor(item.type == "Expense" ? .red : .green)
            }
        }
        
    }
}


