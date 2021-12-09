//
//  Item.swift
//  FinanceTracker
//
//  Created by cpsc on 12/7/21.
//

import Foundation
import SwiftUI
struct Item : Codable, Identifiable{
    var id: String
    var name: String
    var source: String
    var description: String
    var amount: Float
    var type: String
}
