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
                            Text("Total Expenses: - $\(String(sumItemAmounts(itemStore.expenses)))")
                            
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
                            Text("Total Expenses: + $\(String(sumItemAmounts(itemStore.incomes)))")
                        }
                        
                    
                    
                    
                    
                    
                }
                
            }
     
            .navigationBarItems(leading: NavigationLink(destination: ContentView()) {
            Text("Add")
                    .padding()
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(10)
            
            
            }, trailing: EditButton()
                                    .padding()
                                    .foregroundColor(.blue)            )

            
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
struct DiamondBackground: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.green)
                .frame(width: 250, height: 250, alignment: .center)
                .rotationEffect(.degrees(45.0))
        }
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


