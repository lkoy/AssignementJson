//
//  MoneyouModelsTests.swift
//  AssignmentMoneyouTests
//
//  Created by Iglesias, Gustavo on 25/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation
@testable import AssignmentMoneyou

final class MoneyouModelsBuilder {
    
    var account: String =  "NL30MOYO0001234567"
    var balance: Float = 100.0
    var transactions: [MoneyouModels.Account.Transaction] = [MoneyouModels.Account.Transaction(id: "trx1",
                                                                                               amount: -18.20,
                                                                                               previousBalance: 0.0,
                                                                                               description: "pizza",
                                                                                               otherAccount: "NL18ABNA0484869868",
                                                                                               date: Date(timeIntervalSinceReferenceDate: 548000340.0))]

    func build() -> MoneyouModels.Account {
        
        return MoneyouModels.Account(account: account,
                                     balance: balance, transactions: transactions)
    }
}
