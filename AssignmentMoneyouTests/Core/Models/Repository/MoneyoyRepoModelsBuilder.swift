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

    var account: String =  "NL30MOYO0001234567"
    var balance: String = "100.0"
    var transactions: [Repo.Account.Transaction] = [Repo.Account.Transaction(id: "trx1",
                                                                             amount: "-18.20",
                                                                             description: "pizza",
                                                                             otherAccount: "NL18ABNA0484869868",
                                                                             date: "2018-05-14T14:19:00Z")]

    func build() -> Repo.Account {
        
        return Repo.Account(account: account,
                            balance: balance,
                            transactions: transactions)
    }
}
