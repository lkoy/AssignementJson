//
//  PrepareTransactionsInteractor.swift
//  AssignmentMoneyou
//
//  Created by ttg on 24/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

protocol GetTransactionsInteractorProtocol: BaseInteractorProtocol {
    func prepareTransactions(transactions: [MoneyouModels.Account.Transaction], balance: Float)
}

protocol GetTransactionsInteractorCallbackProtocol: BaseInteractorCallbackProtocol {
    func found(transactions: [MoneyouModels.Account.Transaction])
}

class GetTransactionsInteractor: BaseInteractor {

    weak var presenter: GetTransactionsInteractorCallbackProtocol!

}

extension GetTransactionsInteractor {
    
    func addTotal(toTransactions: [MoneyouModels.Account.Transaction], balance: Float) -> [MoneyouModels.Account.Transaction] {
        
        var transactionsTotal = [MoneyouModels.Account.Transaction]()
        var currentBalance = balance
        
        
        for transaction in toTransactions {
            currentBalance = currentBalance - transaction.amount
            transactionsTotal.append(MoneyouModels.Account.Transaction(id: transaction.id,
                                                               amount: transaction.amount,
                                                               previousBalance: currentBalance,
                                                               description: transaction.description,
                                                               otherAccount: transaction.otherAccount,
                                                               date: transaction.date))
        }
        
        return transactionsTotal
    }
}

extension GetTransactionsInteractor: GetTransactionsInteractorProtocol {

    func prepareTransactions(transactions: [MoneyouModels.Account.Transaction], balance: Float) {
        
        var orderedTransactions = transactions.sorted(by: { $0.date.compare($1.date) == .orderedDescending})
        orderedTransactions = addTotal(toTransactions: transactions, balance: balance)
        
        self.presenter.found(transactions: orderedTransactions)
    }
}
