//
//  AccountBuilder.swift
//  AssignmentMoneyou
//
//  Created by ttg on 23/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation
import UIKit.UIViewController

final class AccountBuilder: BaseBuilder {
    
    static func build(account: MoneyouModels.Account) -> UIViewController {

        let viewController: AccountViewController = AccountViewController()
        let router: AccountRouter = AccountRouter(viewController: viewController)
        
        let getTransactionsInteractor = GetTransactionsInteractor()
        let accountDataMapper = AccountDataMapper(accesoryMapper: AccountTransactionAccesory())
        let presenter: AccountPresenter = AccountPresenter(viewController: viewController,
                                                           router: router,
                                                           account: account,
                                                           transactionsInteractor: getTransactionsInteractor,
                                                           accountDataMapper: accountDataMapper)
        viewController.presenter = presenter
        getTransactionsInteractor.presenter = presenter

        return viewController
    }

}
