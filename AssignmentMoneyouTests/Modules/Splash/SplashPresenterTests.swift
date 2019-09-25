//
//  SplashPresenterTests.swift
//  AssignmentMoneyouTests
//
//  Created by Iglesias, Gustavo on 25/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import XCTest
import Nimble
@testable import AssignmentMoneyou

class SplashPresenterTests: XCTestCase {
    
    private var sut: SplashPresenter<SpyController, SpyRouter>!
    private var router: SpyRouter!
    private var controller: SpyController!
    private var interactor: StubInteractor!

    override func setUp() {
        super.setUp()
        givenSut()
    }

    override func tearDown() {
        super.tearDown()
        tearDownSut()
    }

    func testExample() {
        
        interactor.stubGetAccount(self.sut.found(account: MoneyouModelsBuilder().build()))
        sut.getInitDetails()
        
        expect(self.router.navigateToAccountMethodCalled).toEventually(equal(1))
    }
    
    private func givenSut() {
        controller = SpyController()
        router = SpyRouter()
        interactor = StubInteractor()
        sut = SplashPresenter(viewController: controller,
                              router: router,
                              accountInteractor: interactor)
    }
    
    private func tearDownSut() {
        controller = nil
        router = nil
        interactor = nil
        sut = nil
    }
}

private class SpyController: SplashViewControllerProtocol {
    

}

private class SpyRouter: SplashRouterProtocol {
    
    var navigateToAccountMethodCalled: Int = 0
    
    func navigateToAccount(account: MoneyouModels.Account) {
        
        navigateToAccountMethodCalled += 1
    }
}

private class StubInteractor: GetAccountInteractorProtocol {
    
    var getAccountFunction: (() -> Void)!
    
    func stubGetAccount(_ function: @autoclosure @escaping () -> Void) {
        self.getAccountFunction = function
    }
    
    func getAccount() {
        getAccountFunction()
    }
}
