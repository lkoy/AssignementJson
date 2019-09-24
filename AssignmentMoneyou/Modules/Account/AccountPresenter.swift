//
//  AccountPresenter.swift
//  AssignmentMoneyou
//
//  Created by ttg on 23/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

protocol AccountViewControllerProtocol: BaseViewControllerProtocol {
    func preparedView(_ viewModel: Account.ViewModel)
}

protocol AccountPresenterProtocol: BasePresenterProtocol {
    func prepareView()
    func getTransactionsDetails()
}

final class AccountPresenter<T: AccountViewControllerProtocol, U: AccountRouterProtocol>: BasePresenter<T, U> {

    private let accountData: MoneyouModels.Account
    private let getTransactionsInteractor: GetTransactionsInteractorProtocol
    private let accountDataMapper: AccountDataMapper
    
    init(viewController: T, router: U, account: MoneyouModels.Account, transactionsInteractor: GetTransactionsInteractorProtocol, accountDataMapper: AccountDataMapper) {
        
        self.accountData = account
        self.getTransactionsInteractor = transactionsInteractor
        self.accountDataMapper = accountDataMapper
        
        super.init(viewController: viewController, router: router)
    }
    
}

extension AccountPresenter: AccountPresenterProtocol {

    func prepareView() {
        
        self.getTransactionsInteractor.prepareTransactions(transactions: self.accountData.transactions, balance: self.accountData.balance)
    }
    
    func getTransactionsDetails() {
        self.getTransactionsInteractor.prepareTransactions(transactions: self.accountData.transactions, balance: self.accountData.balance)
    }
}

extension AccountPresenter: GetTransactionsInteractorCallbackProtocol {
    
    func found(transactions: [MoneyouModels.Account.Transaction]) {
        
        let viewModel = accountDataMapper.mapAccountDetails(self.accountData, transactions: transactions)
        viewController.preparedView(viewModel)
    }
}
