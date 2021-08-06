//
//  HomeTableViewCell.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 13/07/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "HomeTableViewCell"
    
    let titleLabel          = GFTitleLabel(txtAlignment: .left, fontSize: 18)
    let secondaryTitleLabel = GFSecandryTitleLabel(fontSize: 16, textAlignment: .left)
    let avalibaleOrNotLabel = GFSecandryTitleLabel(fontSize: 14, textAlignment: .left)
    
    let bookImage: UIImageView = {
        let bookImage = UIImageView()
        bookImage.image = UIImage(named: "books")
        bookImage.clipsToBounds = true
        bookImage.layer.cornerRadius = 10
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        return bookImage
    }()
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.layer.shadowColor   = UIColor.gray.cgColor
        containerView.layer.shadowOpacity = 0.8
        containerView.layer.shadowOffset  = .zero
        containerView.layer.shadowRadius  = 6
        containerView.backgroundColor     = .white
        containerView.layer.cornerRadius  = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let avalibaleOrNotStatus: UIView = {
        let avalibaleOrNotStatus = UIView()
        avalibaleOrNotStatus.layer.cornerRadius = 7
        avalibaleOrNotStatus.clipsToBounds      = true
        avalibaleOrNotStatus.translatesAutoresizingMaskIntoConstraints = false
        
        return avalibaleOrNotStatus
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(secondaryTitleLabel)
        containerView.addSubview(bookImage)
        containerView.addSubview(avalibaleOrNotLabel)
        containerView.addSubview(avalibaleOrNotStatus)
        
        let padding:CGFloat = 4
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor,constant: 12),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: padding),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -padding),
            containerView.heightAnchor.constraint(equalToConstant: 120),
            
            bookImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            bookImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            bookImage.heightAnchor.constraint(equalToConstant: 80),
            bookImage.widthAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: bookImage.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            secondaryTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: padding),
            secondaryTitleLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 24),
            secondaryTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            secondaryTitleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            avalibaleOrNotStatus.topAnchor.constraint(equalTo: secondaryTitleLabel.bottomAnchor,constant: 20),
            avalibaleOrNotStatus.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 24),
            avalibaleOrNotStatus.heightAnchor.constraint(equalToConstant: 14),
            avalibaleOrNotStatus.widthAnchor.constraint(equalToConstant: 14),
            
            avalibaleOrNotLabel.topAnchor.constraint(equalTo: secondaryTitleLabel.bottomAnchor,constant: 20),
            avalibaleOrNotLabel.leadingAnchor.constraint(equalTo: avalibaleOrNotStatus.trailingAnchor,constant: padding),
            avalibaleOrNotLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            avalibaleOrNotLabel.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
}
