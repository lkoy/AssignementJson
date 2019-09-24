//
//  SplashPresenter.swift
//  AssignmentMoneyou
//
//  Created by ttg on 22/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

protocol SplashViewControllerProtocol: BaseViewControllerProtocol {

}

protocol SplashPresenterProtocol: BasePresenterProtocol {
    func getInitDetails()
}

final class SplashPresenter<T: SplashViewControllerProtocol, U: SplashRouterProtocol>: BasePresenter<T, U> {
    
    private let getAccountInteractor: GetAccountInteractorProtocol

    init(viewController: T, router: U, accountInteractor: GetAccountInteractorProtocol) {
        
        self.getAccountInteractor = accountInteractor
        
        super.init(viewController: viewController, router: router)
    }
    
}

extension SplashPresenter: SplashPresenterProtocol {

    func getInitDetails() {
        getAccountDetails()
    }
}

extension SplashPresenter {
    
    private func getAccountDetails() {
        getAccountInteractor.getAccount()
    }
}

extension SplashPresenter: GetAccountInteractorCallbackProtocol {
    
    func found(account: MoneyouModels.Account) {
        
        router.navigateToAccount(account: account)
    }
    
    func showError(type: GetAccountInteractorError) {
        
        print("error")
    } 
}
