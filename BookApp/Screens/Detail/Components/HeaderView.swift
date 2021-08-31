//
//  HeaderView.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 09/08/2021.
//

import UIKit

class HeaderView: UIView {
    
    let bookImage: UIImageView = {
        let bookImage = UIImageView()
        bookImage.image              = UIImage(named: "books")
        bookImage.clipsToBounds      = true
        bookImage.contentMode        = .scaleAspectFit
        bookImage.layer.cornerRadius = 10
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        return bookImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.shadowColor   = UIColor.systemGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset  = .zero
        layer.shadowRadius  = 3
        backgroundColor     = .systemBackground
        //        layer.cornerRadius  = 40
        //        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bookImage)
        
        NSLayoutConstraint.activate([
            
            heightAnchor.constraint( equalToConstant: 400 ),
            
            bookImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bookImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bookImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bookImage.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}
