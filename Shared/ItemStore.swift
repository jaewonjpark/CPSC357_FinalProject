//
//  ItemStore.swift
//  FinanceTracker
//
//  Created by cpsc on 12/9/21.
//

import Foundation
import SwiftUI
import Combine
class ItemStore : ObservableObject {
    @Published var allItems: [Item]

    @Published var expenses: [Item]
    @Published var incomes: [Item]
    //contains the three publicly accessible arrays
    init (allItems: [Item] = [], expenses: [Item] = [], incomes: [Item] = []) {
        self.allItems = allItems
        self.expenses = expenses
        self.incomes = incomes
    }
}
