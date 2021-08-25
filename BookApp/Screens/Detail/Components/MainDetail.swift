//
//  MainDetail.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 09/08/2021.
//

import UIKit

class MainDetail: UIView {
    
    let bookNameLabel  = GFTitleLabel(txtAlignment: .left, fontSize: 18)
    let bookPriceLabel = GFTitleLabel(txtAlignment: .left, fontSize: 18)
    
    let mainDetailStackView: UIStackView = {
        let mainDetailStackView = UIStackView()
        mainDetailStackView.axis = .horizontal
        mainDetailStackView.spacing = 10
        mainDetailStackView.distribution = .fill
        mainDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainDetailStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        mainDetailStackView.addArrangedSubview(bookNameLabel)
        mainDetailStackView.addArrangedSubview(bookPriceLabel)

        layer.shadowColor   = UIColor.gray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset  = .zero
        layer.shadowRadius  = 3
        backgroundColor     = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        
        addSubview(mainDetailStackView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: 30),
            
            mainDetailStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mainDetailStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            mainDetailStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding),
            mainDetailStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
}
