//
//  ItemData.swift
//  FinanceTracker
//
//  Created by cpsc on 12/7/21.
//

import Foundation
import UIKit
import SwiftUI
var itemData: [Item] = loadJson("storedItems.json", "financeItems.json")
var expenseData: [Item] = branchItems(itemData, matcher: "Expense")
var incomeData: [Item] = branchItems(itemData, matcher: "Income")
func loadJson<T: Decodable>(_ filename: String, _ defaultname: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        //failed attempt to read from alternative data file, MacBook memory is Read Only :c
        
        //fatalError("\(filename) not found.")
        guard let file1 = Bundle.main.url(forResource: defaultname, withExtension: nil)
        else {
            
            fatalError("\(filename) and \(defaultname) not found.")
        }
        
        do {
            data = try Data(contentsOf: file1)
            
        } catch {
            fatalError("Could not load \(defaultname): \(error)")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            fatalError("Unable to parse \(defaultname): \(error)")
        }
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
// iterates through all items from the JSON and adds them to either incomes or
// expenses array depending on their type attribute
func branchItems(_ itemList: [Item], matcher: String) -> [Item] {
    var myArray: [Item] = []
    for item in itemList {
        if(item.type == matcher) {
            myArray.append(item)
        }
        
        
        
    }
    return myArray
}
