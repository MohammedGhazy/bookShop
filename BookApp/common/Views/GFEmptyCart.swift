//
//  GFEmptyState.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 31/08/2021.
//

import UIKit

class GFEmptyCart: UIView {
    
    let messageLabel    = GFTitleLabel(txtAlignment: .center, fontSize: 28)
    let emptyCart   = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text  = message
        configure()
    }
    
    
    private func configure(){
        addSubview(messageLabel)
        addSubview(emptyCart)
        
        messageLabel.textColor        = .secondaryLabel
        messageLabel.numberOfLines    = 3
        
        emptyCart.image   = UIImage(named: "emptyCart")
        emptyCart.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            emptyCart.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            emptyCart.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            emptyCart.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            emptyCart.heightAnchor.constraint(equalToConstant: 200),
            
            messageLabel.topAnchor.constraint(equalTo: emptyCart.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            messageLabel.heightAnchor.constraint(equalToConstant: 22)
            
        ])
    }
    
}
