//
//  File.swift
//  AssignmentMoneyou
//
//  Created by Iglesias, Gustavo on 24/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import Foundation

enum Repo {
    
    struct Account: Codable {
        let account: String?
        let balance: String?
        let transactions: [Transaction]?
        
        struct Transaction: Codable {
            let id: String?
            let amount: String?
            let description: String?
            let otherAccount: String?
            let date: String?
        }
    }
}
