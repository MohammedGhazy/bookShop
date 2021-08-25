//
//  OtherDetail.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 22/08/2021.
//

import UIKit

class OtherDetail: UIView {
    
    let bookAuthorLabel      = GFTitleLabel(txtAlignment: .left, fontSize: 18)
    let bookTypeLabel        = GFTitleLabel(txtAlignment: .left, fontSize: 18)
    let bookAvalibalityLabel = GFTitleLabel(txtAlignment: .left, fontSize: 18)
    
    lazy var authorSingleItem      = OtherDetailSingleItem(text: bookAuthorLabel.text!, icon: UIImageView(image: UIImage(systemName: "pencil.circle")))
    lazy var typeSingleItem        = OtherDetailSingleItem(text: "mohammed essam", icon: UIImageView(image: UIImage(systemName: "star")))
    lazy var AvalibaleSingleItem   = OtherDetailSingleItem(text: "nff essam", icon: UIImageView(image: UIImage(systemName: "book.circle")))
    
    let otherDetailStackView: UIStackView = {
        let otherDetailStackView = UIStackView()
        otherDetailStackView.axis = .vertical
        otherDetailStackView.spacing = 5
        otherDetailStackView.distribution = .fillEqually
        otherDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        return otherDetailStackView
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
        
        otherDetailStackView.addArrangedSubview(bookAuthorLabel)
        otherDetailStackView.addArrangedSubview(bookTypeLabel)
        otherDetailStackView.addArrangedSubview(bookAvalibalityLabel)

        layer.shadowColor   = UIColor.gray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset  = .zero
        layer.shadowRadius  = 3
        backgroundColor     = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        
        addSubview(otherDetailStackView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint(equalToConstant: 200),
            
            otherDetailStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            otherDetailStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            otherDetailStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding),
            otherDetailStackView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }

}
