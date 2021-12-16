//
//  Overview.swift
//  FinanceTracker
//
//  Created by cpsc on 12/15/21.
//

import SwiftUI

struct Overview: View {
    let total_expenses: Float
    let total_incomes: Float
    var body: some View {
        VStack {
            Text("Total Income: $\(roundF2S(total_incomes))")
            Text("Total Expenses: $\(roundF2S(total_expenses))")
            Text("Total Monthly Net: $\(roundF2S(net_balance(total_incomes, total_expenses)))")
            
            
        }
    }
    func roundF2S(_ value: Float) -> String {
        return String(value).components(separatedBy: ".")[1].count < 2 ? String(value) + "0" : String(Float(value * 100) / 100)
    }
    func net_balance(_ inc: Float, _ exp: Float) -> Float {
        return inc - exp
    }

}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview(total_expenses: 18.94, total_incomes: 60.00)
    }
}
