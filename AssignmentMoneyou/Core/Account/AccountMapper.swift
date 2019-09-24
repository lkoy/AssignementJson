//
//  AccountMapper.swift
//  AssignmentMoneyou
//
//  Created by Iglesias, Gustavo on 24/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

final class AccountMapper {
    
    static func map(_ account: Repo.Account) -> MoneyouModels.Account {

        let transactions = account.transactions?.map({ (model) -> MoneyouModels.Account.Transaction in
            return TransactionMapper.map(model)
        })
        
        return MoneyouModels.Account(account: account.account ?? "",
                                     balance: mapBalance(balance: account.balance),
                                     transactions: transactions ?? [])
    }
    
    static func mapBalance(balance: String?) -> Float {
        
        if let balanceD = balance {
            return (balanceD as NSString).floatValue
        } else {
            return 0.0
        }
    }
}
