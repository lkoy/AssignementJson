//
//  GetAccountInteractor.swift
//  AssignmentMoneyou
//
//  Created by ttg on 23/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

protocol GetAccountInteractorProtocol: BaseInteractorProtocol {
    func getAccount()
}

enum GetAccountInteractorError {
    case noData
    case showError
}

protocol GetAccountInteractorCallbackProtocol: BaseInteractorCallbackProtocol {
    func found(account: MoneyouModels.Account)
    func showError(type: GetAccountInteractorError)
}

class GetAccountInteractor: BaseInteractor {

    weak var presenter: GetAccountInteractorCallbackProtocol!
    private let getAccountWorker: GetAccountWorkerAlias

    init(getAccountWorker: GetAccountWorkerAlias = GetAccountWorker()) {
        self.getAccountWorker = getAccountWorker
        super.init()
    }
}

extension GetAccountInteractor: GetAccountInteractorProtocol {
    
    func getAccount() {
        
        //Execute worker in another thread to show splash screen
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
        guard let self = self else {
          return
        }
            self.getAccountWorker.execute { [weak self] (result) in
                
                guard let self = self else { return }
                
                switch result {
                case .success(let account):
                    self.presenter.found(account: account)
                case .failure:
                    self.presenter.showError(type: GetAccountInteractorError.showError)
                }
            }
        }
    }
}
