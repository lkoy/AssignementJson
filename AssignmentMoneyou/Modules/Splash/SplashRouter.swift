//
//  SplashRouter.swift
//  AssignmentMoneyou
//
//  Created by ttg on 22/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

protocol SplashRouterProtocol: BaseRouterProtocol {
    func navigateToAccount(account: MoneyouModels.Account)
}

class SplashRouter: BaseRouter, SplashRouterProtocol {

    func navigateToAccount(account: MoneyouModels.Account) {
        navigationController?.setViewControllers([AccountBuilder.build(account: account)], animated: true)
    }
}
