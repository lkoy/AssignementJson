//
//  GetAccountWorker.swift
//  AssignmentMoneyou
//
//  Created by ttg on 23/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

enum GetAccountWorkerError: Error {
    case error
}

typealias GetAccountWorkerAlias = BaseWorker<Void, Result<MoneyouModels.Account, GetAccountWorkerError>>

final class GetAccountWorker: GetAccountWorkerAlias {
    
    private let accountRepository: AccountRepositoryProtocol
    
    init(accountRepository: AccountRepositoryProtocol = AccountJsonRepository()) {
        self.accountRepository  = accountRepository
        super.init()
    }
    
    override func job(completion: @escaping ((Result<MoneyouModels.Account, GetAccountWorkerError>) -> Void)) {
        
        //Add sleep to show splash screen
        sleep(3)
        accountRepository.getAccountDetails { result in
            switch result {
            case .success(let result):
                let accountDetails = AccountMapper.map(result)
                completion(.success(accountDetails))
            case .failure:
                completion(.failure(.error))
            }
        }
    }
}
