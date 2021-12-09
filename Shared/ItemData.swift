//
//  ItemData.swift
//  FinanceTracker
//
//  Created by cpsc on 12/7/21.
//

import Foundation
import UIKit
import SwiftUI
var itemData: [Item] = loadJson("financeItems.json")
var expenseData: [Item] = branchItems(itemData, matcher: "Expense")
var incomeData: [Item] = branchItems(itemData, matcher: "Income")
func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    
    do {
        data = try Data(contentsOf: file)
        
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
    
}
func branchItems(_ itemList: [Item], matcher: String) -> [Item] {
    var myArray: [Item] = []
    for item in itemList {
        if(item.type == matcher) {
            myArray.append(item)
        }
        
        
        
    }
    return myArray
}
