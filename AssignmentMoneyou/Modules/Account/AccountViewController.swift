//
//  AccountViewController.swift
//  AssignmentMoneyou
//
//  Created by ttg on 23/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import UIKit

final class AccountViewController: BaseViewController {
    
    override var prefersNavigationBarHidden: Bool { return true }

    var presenter: AccountPresenterProtocol!

    // MARK: - Component Declaration
    
    private var headerView: UIView!
    private var containerAccountView: UIView!
    private var accountLabel: UILabel!
    private var titleLabel: UILabel!
    private var accountNameLabel: UILabel!
    private var accountAmountLabel: UILabel!
    private var tableView: UITableView!
    private var viewModel: Account.ViewModel?

    private enum ViewTraits {
        static let margins = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        static let containerMargins = UIEdgeInsets(top: 40, left: 10, bottom: 10, right: 10)
        static let headerHeight: CGFloat = 110.0
        static let logoHeigh: CGFloat = 20.0
    }

    // MARK: - ViewLife Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getTransactionsDetails()
    }

    // MARK: - Setup

    override func setupComponents() {

        view.backgroundColor = .white
        
        headerView = UIView()
        headerView.backgroundColor = .appViolet
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        
        containerAccountView = UIView()
        containerAccountView.backgroundColor = .clear
        containerAccountView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(containerAccountView)
        
        accountLabel = UILabel()
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
        accountLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        accountLabel.textColor = .white
        accountLabel.textAlignment = .left
        accountLabel.text = "Account"
        containerAccountView.addSubview(accountLabel)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.text = "TopBank"
        containerAccountView.addSubview(titleLabel)
        
        accountNameLabel = UILabel()
        accountNameLabel.translatesAutoresizingMaskIntoConstraints = false
        accountNameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        accountNameLabel.textAlignment = .left
        accountNameLabel.textColor = .white
        containerAccountView.addSubview(accountNameLabel)
        
        accountAmountLabel = UILabel()
        accountAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        accountAmountLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        accountAmountLabel.textColor = .white
        accountAmountLabel.textAlignment = .right
        containerAccountView.addSubview(accountAmountLabel)
        
        tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.cellIdentifier)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .singleLine
        tableView.dataSource = self
        view.addSubview(tableView)
    }

    override func setupConstraints() {

        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            containerAccountView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: ViewTraits.containerMargins.left),
            containerAccountView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -ViewTraits.containerMargins.right),
            containerAccountView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: ViewTraits.containerMargins.top),
            containerAccountView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -ViewTraits.containerMargins.bottom),
            
            accountLabel.leadingAnchor.constraint(equalTo: containerAccountView.leadingAnchor, constant: ViewTraits.margins.left),
            accountLabel.topAnchor.constraint(equalTo: containerAccountView.topAnchor, constant: ViewTraits.margins.top),
            accountLabel.bottomAnchor.constraint(equalTo: accountNameLabel.topAnchor, constant: -ViewTraits.margins.top),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: ViewTraits.logoHeigh),
            titleLabel.topAnchor.constraint(equalTo: containerAccountView.topAnchor),
            
            accountNameLabel.leadingAnchor.constraint(equalTo: containerAccountView.leadingAnchor, constant: ViewTraits.margins.left),
            accountNameLabel.bottomAnchor.constraint(equalTo: containerAccountView.bottomAnchor, constant: -ViewTraits.margins.bottom),
            
            accountAmountLabel.trailingAnchor.constraint(equalTo: containerAccountView.trailingAnchor, constant: -ViewTraits.margins.right),
            accountAmountLabel.topAnchor.constraint(equalTo: containerAccountView.topAnchor, constant: ViewTraits.margins.top),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func setupAccessibilityIdentifiers() {
        
    }

    // MARK: - Actions

    // MARK: Private Methods

}

// MARK: - AccountViewControllerProtocol
extension AccountViewController: AccountViewControllerProtocol {
 
    func preparedView(_ viewModel: Account.ViewModel) {
        
        self.accountNameLabel.text = viewModel.accountName
        self.accountAmountLabel.text = viewModel.balanceAmount
        
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

extension AccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.transactions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.cellIdentifier, for: indexPath) as? TransactionTableViewCell else {
            fatalError("Remember to register cellIdentifier")
        }
        if let transaction = viewModel?.transactions[indexPath.row] {
            cell.topLeftText = transaction.dateFormatted
            cell.separatorColor = .gray
            cell.title = transaction.description
            cell.subtitle = "From: \(transaction.accountFrom)"
            cell.subTitleColor = .gray
            cell.actualBalance = transaction.actualBalance
            cell.amount = transaction.amount
            cell.amountColor = transaction.amountTextColor
            cell.previousBalance = transaction.previousBalance
        }
        return cell
    }
}
