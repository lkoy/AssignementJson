//
//  AccountDataMapper.swift
//  AssignmentMoneyou
//
//  Created by Iglesias, Gustavo on 24/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation
import UIKit.UIColor

protocol TransactionAccesoryMapperProtocol {
    func mapColor(amount: Float) -> UIColor
}

final class AccountDataMapper {
    
    private let accesoryMapper: TransactionAccesoryMapperProtocol!
    
    init(accesoryMapper: TransactionAccesoryMapperProtocol) {
        self.accesoryMapper = accesoryMapper
    }
    
    func mapAccountDetails(_ account: MoneyouModels.Account, transactions: [MoneyouModels.Account.Transaction]) -> Account.ViewModel {
        
        
        return Account.ViewModel(accountName: account.account,
                                 balanceAmount: mapAmount(account.balance),
                                 transactions: mapTransactions(transactions: transactions))
    }
    
    func mapTransactions(transactions: [MoneyouModels.Account.Transaction]) -> [Account.ViewModel.Transaction] {
        
        var viewModels: [Account.ViewModel.Transaction] = []
        
        for transaction in transactions {
            
            let model = Account.ViewModel.Transaction(description: transaction.description,
                                                      actualBalance: mapAmount(transaction.previousBalance + transaction.amount),
                                                      amount: mapAmount(transaction.amount),
                                                      previousBalance: mapAmount(transaction.previousBalance),
                                                      accountFrom: transaction.otherAccount,
                                                      dateFormatted: mapDate(transaction.date),
                                                      amountTextColor: accesoryMapper.mapColor(amount: transaction.amount))
            viewModels.append(model)
        }
        
        return viewModels
    }
    
    func mapAmount(_ balance: Float) -> String {
        return String(format: "%.2f", balance)
    }
    
    func mapDate(_ date: Date) -> String {
        
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "dd MMM"
        let newDate: String = dateFormatterString.string(from: date)
        return newDate
    }
}

class AccountTransactionAccesory: TransactionAccesoryMapperProtocol {
    
    func mapColor(amount: Float) -> UIColor {
        if amount < 0 {
            return .appRed
        }
        return .appViolet
    }
}
