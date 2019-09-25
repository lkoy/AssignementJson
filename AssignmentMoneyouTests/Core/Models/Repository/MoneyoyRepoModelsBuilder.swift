//
//  MoneyoyRepoModelsBuilder.swift
//  AssignmentMoneyouTests
//
//  Created by Iglesias, Gustavo on 25/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation
@testable import AssignmentMoneyou

final class MoneyoyRepoModelsBuilder {

    var account: String? =  "NL30MOYO0001234567"
    var balance: String? = "100.0"
    
    var id: String? =  "trx1"
    var amount: String? =  "-18.20"
    var description: String? =  "pizza"
    var otherAccount: String? =  "NL18ABNA0484869868"
    var date: String? =  "2018-05-14T14:19:00Z"

    func with(account: String) -> MoneyoyRepoModelsBuilder {
        self.account = account
        return self
    }
    
    func with(balance: String) -> MoneyoyRepoModelsBuilder {
        self.balance = balance
        return self
    }
    
    func with(id: String) -> MoneyoyRepoModelsBuilder {
        self.id = id
        return self
    }
    
    func with(amount: String) -> MoneyoyRepoModelsBuilder {
        self.amount = amount
        return self
    }
    
    func with(description: String) -> MoneyoyRepoModelsBuilder {
        self.description = description
        return self
    }
    
    func with(otherAccount: String) -> MoneyoyRepoModelsBuilder {
        self.otherAccount = otherAccount
        return self
    }
    
    func with(date: String) -> MoneyoyRepoModelsBuilder {
        self.date = date
        return self
    }
    
    func build() -> Repo.Account {
        
        return Repo.Account(account: account,
                            balance: balance,
                            transactions: [Repo.Account.Transaction(id: id,
                                                                    amount: amount,
                                                                    description: description,
                                                                    otherAccount: otherAccount,
                                                                    date: date)])
    }
    
    func buildWithoutTransactions() -> Repo.Account {
        
        return Repo.Account(account: account,
                            balance: balance,
                            transactions: nil)
    }
}
