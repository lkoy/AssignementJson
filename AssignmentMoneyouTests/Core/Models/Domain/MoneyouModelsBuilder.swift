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
    
    var id: String = "trx1"
    var amount: Float = -18.20
    var previousBalance: Float = 0.0
    var description: String = "pizza"
    var otherAccount: String = "NL18ABNA0484869868"
    var dateInterval: Double = 548000340.0

    func with(account: String) -> MoneyouModelsBuilder {
        self.account = account
        return self
    }
    
    func with(balance: Float) -> MoneyouModelsBuilder {
        self.balance = balance
        return self
    }
    
    func with(id: String) -> MoneyouModelsBuilder {
        self.id = id
        return self
    }
    
    func with(amount: Float) -> MoneyouModelsBuilder {
        self.amount = amount
        return self
    }
    
    func with(previousBalance: Float) -> MoneyouModelsBuilder {
        self.previousBalance = previousBalance
        return self
    }
    
    func with(description: String) -> MoneyouModelsBuilder {
        self.description = description
        return self
    }
    
    func with(otherAccount: String) -> MoneyouModelsBuilder {
        self.otherAccount = otherAccount
        return self
    }
    
    func with(dateInterval: Double) -> MoneyouModelsBuilder {
        self.dateInterval = dateInterval
        return self
    }
    
    func build() -> MoneyouModels.Account {
        
        return MoneyouModels.Account(account: account,
                                     balance: balance, transactions: [MoneyouModels.Account.Transaction(id: id,
                                                                                                        amount: amount,
                                                                                                        previousBalance: previousBalance,
                                                                                                        description: description,
                                                                                                        otherAccount: otherAccount,
                                                                                                        date: Date(timeIntervalSinceReferenceDate: dateInterval))])
    }
    
    func buildWithoutTransactions() -> MoneyouModels.Account {
        
        return MoneyouModels.Account(account: account,
                                     balance: balance,
                                     transactions: [])
    }
}
