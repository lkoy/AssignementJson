//
//  TransactionMapper.swift
//  AssignmentMoneyou
//
//  Created by Iglesias, Gustavo on 24/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

final class TransactionMapper {
    
    static func map(_ transactions: [Repo.Account.Transaction]) -> [MoneyouModels.Account.Transaction] {
        return transactions.map({
            return self.map($0)
        })
    }
    
    static func map(_ transaction: Repo.Account.Transaction) -> MoneyouModels.Account.Transaction {
        
        return MoneyouModels.Account.Transaction(id: transaction.id ?? "",
                                         amount: mapAmount(amount: transaction.amount),
                                         previousBalance: 0,
                                         description: transaction.description ?? "",
                                         otherAccount: transaction.otherAccount ?? "",
                                         date: mapDate(date: transaction.date))
    }
    
    static func mapAmount(amount: String?) -> Float {
        
        if let amountD = amount {
            return (amountD as NSString).floatValue
        } else {
            return 0.0
        }
    }
    
    static func mapDate(date: String?) -> Date {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        if let dateTime = date, let dateFormatted = dateFormatterGet.date(from: dateTime) {
            return dateFormatted
        } else {
            return Date.distantPast
        }
    }
}
