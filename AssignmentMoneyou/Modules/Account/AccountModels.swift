//
//  AccountModels.swift
//  AssignmentMoneyou
//
//  Created by ttg on 23/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import UIKit.UIColor

enum Account {

    struct ViewModel: Equatable {
        
        let accountName: String
        let balanceAmount: String
        let transactions: [Transaction]
        
        struct Transaction: Equatable {
            let description: String
            let actualBalance: String
            let amount: String
            let previousBalance: String
            let accountFrom: String
            let dateFormatted: String
            let amountTextColor: UIColor
            
            static func == (lhs: Transaction, rhs: Transaction) -> Bool {
                return lhs.description == rhs.description && lhs.amount == rhs.amount && lhs.accountFrom == rhs.accountFrom && lhs.dateFormatted == rhs.dateFormatted && lhs.amountTextColor == rhs.amountTextColor
            }
        }
    }
}
