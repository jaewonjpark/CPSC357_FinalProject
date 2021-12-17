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
        ZStack {
            VStack {
                Text("Account Overview")
                    .foregroundColor(.green)
                    .font(.title)
                    .padding(.bottom)
                //displays total income
                Text("Total Income: $\(roundF2S(total_incomes))")
                    .padding()
                //displays total expenses
                Text("Total Expenses: $\(roundF2S(total_expenses))")
                    .padding()
                //returns total net monthly gain, color coded on positive/negative/zero
                Text("Total Monthly Net: $\(roundF2S(net_balance(total_incomes, total_expenses)))")
                    .foregroundColor(returnColor(net_balance(total_incomes, total_expenses)))
                    .fontWeight(.bold)
                    .font(.title2)
                    .padding()
                    //provides feedback on user's financial
                //management
                Text(returnStmnt(net_balance(total_incomes, total_expenses)))
                    .padding(.horizontal, 25.0)
                    .multilineTextAlignment(.center)
                    
                
                    
                
                    
                
                
                    
                
                    
                
                
            }
            .padding(.horizontal, 25.0)
            Image("IPHONE")
                .opacity(net_balance(total_incomes, total_expenses) == 0 ? 0.25 : 0)
        }
        
    }
    /*based on the amount if it is postive then turns green, if the amount is zero it turns yellow, if it is negative it turns red*/
    func returnColor(_ total: Float) -> Color {
        return total > 0 ? .green : (total < 0 ? .red : .yellow)
    }
    // returns a different statement based on the total net, as well as the net return if applicable
    func returnStmnt(_ total: Float) -> String {
        return total > 0 ? "Congratulations! You are bringing in a take-home of\n $\(String(roundF2S(net_balance(total_incomes, total_expenses)))) each month. \nYou are properly managing your expenses to \nkeep them under your income, keep up \nthe great work!" : (total < 0 ? "You have a net loss of $\(String(roundF2S(net_balance(total_incomes, total_expenses)))) per month, it is highly recommended to drop \nsome expenses as soon as possible to \navoid losing more money!" : "You have a zero net gain/loss. \nWhile you are not losing money, \nyou are also not making any. \nIt is recommended to drop a few expenses or \nfind more income sources to rise to a positive net gain.")
    }
    // rounds a float to the nearest cent (hundredth)
    func roundF2S(_ value: Float) -> String {
        return String(value).components(separatedBy: ".")[1].count < 2 ? String(value) + "0" : String(Float(value * 100) / 100)
    }
    // returns the difference between income and expenses
    func net_balance(_ inc: Float, _ exp: Float) -> Float {
        return inc - exp
    }

}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview(total_expenses: 18.94, total_incomes: 60.00)
    }
}
