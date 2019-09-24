//
//  MoneyouModels.swift
//  AssignmentMoneyou
//
//  Created by Iglesias, Gustavo on 22/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

enum MoneyouModels {

    struct Account: Codable, Equatable {
        let account: String
        let balance: Float
        let transactions: [Transaction]
        
        struct Transaction: Codable, Equatable {
            let id: String
            let amount: Float
            var previousBalance: Float
            let description: String
            let otherAccount: String
            let date: Date
            
            static func == (lhs: Transaction, rhs: Transaction) -> Bool {
                return lhs.description == rhs.description && lhs.amount == rhs.amount && lhs.previousBalance == rhs.previousBalance && lhs.description == rhs.description && lhs.otherAccount == rhs.otherAccount && lhs.date == rhs.date
            }
        }
    }
}
