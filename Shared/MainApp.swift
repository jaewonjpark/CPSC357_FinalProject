//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI

struct MainApp: View {
    let username: String
    @StateObject private var itemStore : ItemStore = ItemStore(expenses: expenseData, incomes: incomeData)
    
    var body: some View {
        VStack {
            Text("Welcome \(username)")
                .font(.largeTitle)
            NavigationView {
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
                    Text("Total Expenses: - $\(String(sumItemAmounts(itemStore.expenses)))")
                    
                }
                
            }
            NavigationView {
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
                    Text("Total Expenses: + $\(String(sumItemAmounts(itemStore.incomes)))")
                }
                
            }
            
            
            
            
        }
        
    }
    func sumItemAmounts (_ array: [Item]) -> Float {
        var sum: Float = 0
        for item in array {
            sum += item.amount
        }
        return sum
    }
    
    func deleteExpenses(at offsets: IndexSet) {
        itemStore.expenses.remove(atOffsets: offsets)
        print("\(itemStore.expenses)")

    }
    func moveExpenses(from source: IndexSet, to destination: Int) {
        itemStore.expenses.move(fromOffsets: source, toOffset: destination)
        print("\(itemStore.expenses)")

    }
    func deleteIncomes(at offsets: IndexSet) {
        itemStore.incomes.remove(atOffsets: offsets)
        print("\(itemStore.expenses)")

    }
    func moveIncomes(from source: IndexSet, to destination: Int) {
        itemStore.incomes.move(fromOffsets: source, toOffset: destination)
        print("\(itemStore.expenses)")

        
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
                Text("$\(String(item.amount))")
                    .foregroundColor(item.type == "Expense" ? .red : .green)
            }
        }
        
    }
}


