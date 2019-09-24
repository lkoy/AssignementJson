//
//  TransactionTableViewCell.swift
//  AssignmentMoneyou
//
//  Created by Iglesias, Gustavo on 24/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import UIKit

public class TransactionTableViewCell: UITableViewCell {
    
    open class var cellIdentifier: String {
        return "cell.transaction"
    }
    
    private enum ViewTraits {
        static let topDateInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        static let containerInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        static let topSeparator: CGFloat = 4
        static let widthSeparator: CGFloat = 1
        static let heightSeparator: CGFloat = 1
        static let labelsSpacing: CGFloat = 5
        static let innerLabelsSpacing: CGFloat = 10
    }
    
    private let topLeftLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textAlignment = .left
        return lbl
    }()
    public var topLeftText: String? {
        set { topLeftLabel.text = newValue }
        get { return topLeftLabel.text }
    }
    public var topLeftColor: UIColor {
        set { topLeftLabel.textColor = newValue }
        get { return topLeftLabel.textColor }
    }
    
    private let separatorView: UIView = {
        let lbl = UIView()
        return lbl
    }()
    public var separatorColor: UIColor {
        set { separatorView.backgroundColor = newValue }
        get { return separatorView.backgroundColor ?? .white }
    }
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.textAlignment = .left
        return lbl
    }()
    public var title: String? {
        set { titleLabel.text = newValue }
        get { return titleLabel.text }
    }
    public var titleColor: UIColor {
        set { titleLabel.textColor = newValue }
        get { return titleLabel.textColor }
    }
    
    private let subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textAlignment = .left
        return lbl
    }()
    public var subtitle: String? {
        set { subtitleLabel.text = newValue }
        get { return subtitleLabel.text }
    }
    public var subTitleColor: UIColor {
        set { subtitleLabel.textColor = newValue }
        get { return subtitleLabel.textColor }
    }
    
    private let actualBalanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .right
        return lbl
    }()
    public var actualBalance: String? {
        set { actualBalanceLabel.text = newValue }
        get { return actualBalanceLabel.text }
    }
    public var actualBalanceColor: UIColor {
        set { actualBalanceLabel.textColor = newValue }
        get { return actualBalanceLabel.textColor }
    }
    
    private let amountLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.textAlignment = .right
        return lbl
    }()
    public var amount: String? {
        set { amountLabel.text = newValue }
        get { return amountLabel.text }
    }
    public var amountColor: UIColor {
        set { amountLabel.textColor = newValue }
        get { return amountLabel.textColor }
    }
    
    private let previousBalanceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .right
        return lbl
    }()
    public var previousBalance: String? {
        set { previousBalanceLabel.text = newValue }
        get { return previousBalanceLabel.text }
    }
    public var previousBalanceColor: UIColor {
        set { previousBalanceLabel.textColor = newValue }
        get { return previousBalanceLabel.textColor }
    }
    
    private let hSeparatorView: UIView = {
        let lbl = UIView()
        return lbl
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        topLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        topLeftLabel.numberOfLines = 1
        topLeftLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        addSubview(topLeftLabel)
        
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 1
        addSubview(titleLabel)
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.numberOfLines = 1
        addSubview(subtitleLabel)
        
        actualBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        actualBalanceLabel.numberOfLines = 1
        actualBalanceLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        addSubview(actualBalanceLabel)
        
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.numberOfLines = 1
        amountLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        addSubview(amountLabel)
        
        previousBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        previousBalanceLabel.numberOfLines = 1
        previousBalanceLabel.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        addSubview(previousBalanceLabel)
        
        hSeparatorView.translatesAutoresizingMaskIntoConstraints = false
        hSeparatorView.backgroundColor = .gray
        addSubview(hSeparatorView)
        
        setupConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            topLeftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ViewTraits.topDateInsets.left),
            topLeftLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            
            separatorView.leadingAnchor.constraint(equalTo: topLeftLabel.trailingAnchor, constant: ViewTraits.topDateInsets.right),
            separatorView.topAnchor.constraint(equalTo: self.topAnchor, constant: ViewTraits.topSeparator),
            separatorView.bottomAnchor.constraint(equalTo: topLeftLabel.bottomAnchor, constant: ViewTraits.topSeparator),
            separatorView.widthAnchor.constraint(equalToConstant: ViewTraits.widthSeparator),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: ViewTraits.containerInsets.top),
            titleLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: ViewTraits.innerLabelsSpacing),
            titleLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: ViewTraits.innerLabelsSpacing),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ViewTraits.labelsSpacing),
            
            actualBalanceLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: ViewTraits.innerLabelsSpacing),
            actualBalanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ViewTraits.containerInsets.right),
            actualBalanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: ViewTraits.containerInsets.top),
            actualBalanceLabel.bottomAnchor.constraint(equalTo: amountLabel.topAnchor, constant: -ViewTraits.innerLabelsSpacing),
            
            amountLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: ViewTraits.innerLabelsSpacing),
            amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ViewTraits.containerInsets.right),
            amountLabel.topAnchor.constraint(equalTo: actualBalanceLabel.bottomAnchor, constant: ViewTraits.containerInsets.top),
            amountLabel.bottomAnchor.constraint(equalTo: previousBalanceLabel.topAnchor, constant: -ViewTraits.innerLabelsSpacing),
            
            previousBalanceLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: ViewTraits.innerLabelsSpacing),
            previousBalanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ViewTraits.containerInsets.right),
            previousBalanceLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: ViewTraits.containerInsets.top),
            previousBalanceLabel.bottomAnchor.constraint(equalTo: hSeparatorView.topAnchor, constant: -ViewTraits.innerLabelsSpacing),
            
            hSeparatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hSeparatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hSeparatorView.heightAnchor.constraint(equalToConstant: ViewTraits.heightSeparator),
            hSeparatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    public override func prepareForReuse() {
        
        super.prepareForReuse()
        
        topLeftText = nil
        topLeftColor = .black
        
        title = nil
        titleColor = .black
        
        subtitle = nil
        subTitleColor = .black
        
        actualBalance = nil
        actualBalanceColor = .black
        
        amount = nil
        amountColor = .black
        
        previousBalance = nil
        previousBalanceColor = .black
        
        hSeparatorView.backgroundColor = .white
    }
}
