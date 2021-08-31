//
//  BillView.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 30/08/2021.
//

import UIKit

class BillView: UIView  {
    
    let billLabel   = GFTitleLabel(txtAlignment: .left, fontSize: 18)
    let amountLabel = GFTitleLabel(txtAlignment: .left, fontSize: 18)
    
    let billStack: UIStackView = {
        let billStack = UIStackView()
        billStack.axis = .horizontal
        billStack.spacing = 10
        billStack.distribution = .fill
        billStack.translatesAutoresizingMaskIntoConstraints = false
        return billStack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius  = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        
        billStack.addArrangedSubview(amountLabel)
        billStack.addArrangedSubview(billLabel)
        addSubview(billStack)
        
        amountLabel.text = "total"
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: 30),
            
            billStack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            billStack.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            billStack.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding),
            billStack.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
