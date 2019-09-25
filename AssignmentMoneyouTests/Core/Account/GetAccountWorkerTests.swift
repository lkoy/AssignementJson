//
//  GetAccountWorkerTests.swift
//  AssignmentMoneyouTests
//
//  Created by Iglesias, Gustavo on 24/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import XCTest
import Nimble
@testable import AssignmentMoneyou

class GetAccountWorkerTests: XCTestCase {
    
    private var sut: GetAccountWorker!
    private var mockAccountRepository: MockAccountRepository!

    override func setUp() {
        super.setUp()
        givenSetUp()
    }

    override func tearDown() {
        mockAccountRepository = nil
        sut = nil
        super.tearDown()
    }

    func test_get_account_details_success() {

        mockAccountRepository.result = .success(MoneyoyRepoModelsBuilder().build())

        var dataResult: MoneyouModels.Account?
        sut.execute { (result) in
            switch result {
            case .success(let data):
                dataResult = data
            case .failure:
                XCTFail("Worker should have not fail")
            }
        }
        expect(dataResult).toNotEventually(beNil())
        expect(dataResult).toEventually(equal(MoneyouModelsBuilder().build()))
    }
    
    func test_get_account_details_without_transactions_success() {

        mockAccountRepository.result = .success(MoneyoyRepoModelsBuilder().buildWithoutTransactions())

        var dataResult: MoneyouModels.Account?
        sut.execute { (result) in
            switch result {
            case .success(let data):
                dataResult = data
            case .failure:
                XCTFail("Worker should have not fail")
            }
        }
        expect(dataResult).toNotEventually(beNil())
        expect(dataResult).toEventually(equal(MoneyouModelsBuilder().buildWithoutTransactions()))
    }

    func test_get_account_details_with_error_then_failure() {
        
        mockAccountRepository.result = .failure(.error(code: 9999, message: ["Error": "Loading file error"]))
        
        var error: GetAccountWorkerError?
        sut.execute { (result) in
            switch result {
            case .success:
                XCTFail("Worker should have not fail")
            case .failure(let errorResult):
                error = errorResult
            }
        }
        expect(error).toEventually(equal(.error))
    }
    
    func test_get_account_details_with_parsing_error_then_failure() {
        
        mockAccountRepository.result = .failure(.parsing(message: "Error Parsing"))
        
        var error: GetAccountWorkerError?
        sut.execute { (result) in
            switch result {
            case .success:
                XCTFail("Worker should have not fail")
            case .failure(let errorResult):
                error = errorResult
            }
        }
        expect(error).toEventually(equal(.error))
    }

    private func givenSetUp() {
        mockAccountRepository = MockAccountRepository()
        
        sut = GetAccountWorker(accountRepository: mockAccountRepository)
    }
}

private class MockAccountRepository: AccountRepositoryProtocol {
    
    var result: Result<Repo.Account, AccountRepositoryError>!
    
    func getAccountDetails(completion: @escaping ((Result<Repo.Account, AccountRepositoryError>) -> Void)) {

        completion(result)
    }
}
