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
            Text("Account Overview")
                .foregroundColor(.green)
                .font(.title)
                .padding(.bottom)
            Text("Total Income: $\(roundF2S(total_incomes))")
                .padding()
            Text("Total Expenses: $\(roundF2S(total_expenses))")
                .padding()
            Text("Total Monthly Net: $\(roundF2S(net_balance(total_incomes, total_expenses)))")
                .foregroundColor(returnColor(net_balance(total_incomes, total_expenses)))
                .fontWeight(.bold)
                .padding()
                
            Text(returnStmnt(net_balance(total_incomes, total_expenses)))
                .font(.title2)
                .padding()
                
            
            
        }
    }
    func returnColor(_ total: Float) -> Color {
        return total > 0 ? .green : (total < 0 ? .red : .yellow)
    }
    func returnStmnt(_ total: Float) -> String {
        return total > 0 ? "Congratulations! You are bringing in a take-home of $\(String(roundF2S(net_balance(total_incomes, total_expenses)))) each month. You are properly managing your expenses to keep them under your income, keep up the great work!" : (total < 0 ? "You have a net loss of $\(String(roundF2S(net_balance(total_incomes, total_expenses)))) per month, it is highly recommended to drop some expenses as soon as possible to avoid losing more money!" : "You have a zero net gain/loss. While you are not losing money, you are also not making any. It is recommended to drop a few expenses or find more income sources to rise to a positive net gain.")
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
