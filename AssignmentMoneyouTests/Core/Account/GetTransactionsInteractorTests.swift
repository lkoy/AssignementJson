//
//  GetTransactionsInteractorTests.swift
//  AssignmentMoneyouTests
//
//  Created by Iglesias, Gustavo on 25/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import XCTest
import Nimble
@testable import AssignmentMoneyou

class GetTransactionsInteractorTests: XCTestCase {

    var sut: GetTransactionsInteractor!
    private var spy: SpyGetTransactionsInteractorCallback!
    
    override func setUp() {
        super.setUp()
        givenSut()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_given_valid_transactions_then_prepare_it() {
        
        let transactions = [TransactionModelBuilder().with(amount: -18.20).with(dateInterval: 548000340.0).build(),//2018-05-14 14:19:00 +0000
                            TransactionModelBuilder().with(amount: -7.00).with(dateInterval: 547978740.0).build(),//2018-05-14 08:19:00 +0000
                            TransactionModelBuilder().with(amount: 30.00).with(dateInterval: 547993140.0).build()]//2018-05-14 12:19:00 +0000
                            
        
        sut.presenter = spy
        sut.prepareTransactions(transactions: transactions, balance: 100.20)
        
        let expected = [TransactionModelBuilder().with(amount: -18.20).with(previousBalance: 118.399994).with(dateInterval: 548000340.0).build(),//2018-05-14 14:19:00 +0000
                        TransactionModelBuilder().with(amount: 30.00).with(previousBalance: 88.399994).with(dateInterval: 547993140.0).build(),//2018-05-14 12:19:00 +0000
                        TransactionModelBuilder().with(amount: -7.00).with(previousBalance: 95.399994).with(dateInterval: 547978740.0).build()]//2018-05-14 08:19:00 +0000
        
        expect(self.spy.calledFoundTransactions).toEventually(equal(1))
        expect(self.spy.foundTransactions).toEventually(equal(expected))
    }

    private func givenSut() {
        
        sut = GetTransactionsInteractor()
        spy = SpyGetTransactionsInteractorCallback()
    }
}

private class SpyGetTransactionsInteractorCallback: GetTransactionsInteractorCallbackProtocol {
    
    var calledFoundTransactions: Int = 0
    
    var foundTransactions: [MoneyouModels.Account.Transaction]?
    
    func found(transactions: [MoneyouModels.Account.Transaction]) {
        
        foundTransactions = transactions
        calledFoundTransactions += 1
    }
}
