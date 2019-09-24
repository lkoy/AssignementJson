//
//  AccountRepository.swift
//  AssignmentMoneyou
//
//  Created by Iglesias, Gustavo on 23/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

enum AccountRepositoryError: Error {
    case error(code: Int, message: [String: Any])
    case parsing(message: String) //Message is for debuggin purposes help find out which field failed
}

protocol AccountRepositoryProtocol {
    func getAccountDetails(completion: @escaping ((Result<Repo.Account, AccountRepositoryError>) -> Void))
}

class AccountJsonRepository: AccountRepositoryProtocol {
    
    func getAccountDetails(completion: @escaping ((Result<Repo.Account, AccountRepositoryError>) -> Void)) {
        
        guard let data = Data.loadJSON(with: "transactions") else {
            completion(Result.failure(AccountRepositoryError.error(code: 9999, message: ["Error": "Loading file error"])))
            return
        }
        
        do {
            let model = try JSONDecoder().decode(Repo.Account.self, from: data)
            completion(.success(model))
        } catch {
            print(error.localizedDescription)
            completion(.failure(.parsing(message: error.localizedDescription)))
        }
    }
}
