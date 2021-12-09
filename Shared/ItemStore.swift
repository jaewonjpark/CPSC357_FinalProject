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
    
    @Published var expenses: [Item]
    @Published var incomes: [Item]
    
    init (expenses: [Item] = [], incomes: [Item] = []) {
        self.expenses = expenses
        self.incomes = incomes
    }
}
