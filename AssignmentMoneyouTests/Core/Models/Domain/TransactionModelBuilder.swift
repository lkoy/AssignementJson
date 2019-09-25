//
//  TransactionModelBuilder.swift
//  AssignmentMoneyouTests
//
//  Created by Iglesias, Gustavo on 25/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation
@testable import AssignmentMoneyou

final class TransactionModelBuilder {

    var id: String = "trx1"
    var amount: Float = -18.20
    var previousBalance: Float = 0.0
    var description: String = "pizza"
    var otherAccount: String = "NL18ABNA0484869868"
    var dateInterval: Double = 548000340.0
    
    func with(id: String) -> TransactionModelBuilder {
        self.id = id
        return self
    }
    
    func with(amount: Float) -> TransactionModelBuilder {
        self.amount = amount
        return self
    }
    
    func with(previousBalance: Float) -> TransactionModelBuilder {
        self.previousBalance = previousBalance
        return self
    }
    
    func with(description: String) -> TransactionModelBuilder {
        self.description = description
        return self
    }
    
    func with(otherAccount: String) -> TransactionModelBuilder {
        self.otherAccount = otherAccount
        return self
    }
    
    func with(dateInterval: Double) -> TransactionModelBuilder {
        self.dateInterval = dateInterval
        return self
    }
    
    func build() -> MoneyouModels.Account.Transaction {
        
        return MoneyouModels.Account.Transaction(id: id,
                                                 amount: amount,
                                                 previousBalance: previousBalance,
                                                 description: description,
                                                 otherAccount: otherAccount,
                                                 date: Date(timeIntervalSinceReferenceDate: dateInterval))
    }
}
