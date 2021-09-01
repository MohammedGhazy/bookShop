//
//  CartTableViewCell.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 23/08/2021.
//

import UIKit

class CartTableViewCell: UITableViewCell , CartCellView {
    
    static let reuseIdentifier = "CartTableViewCell"
    
    let nameLabel      = GFTitleLabel(txtAlignment: .left, fontSize: 18)
    let priceLabel     = GFSecandryTitleLabel(fontSize: 16, textAlignment: .left)
    let counterLabel   = GFSecandryTitleLabel(fontSize: 14, textAlignment: .left)
    
    let incrementButton: UIButton = {
        let incrementButton = UIButton(type: .custom)
        let image = UIImage(systemName: "plus.circle")
        incrementButton.frame = CGRect(x: 200, y: 200, width: 60, height: 60)
        incrementButton.setImage(image, for: .normal)
        incrementButton.tintColor          = .systemOrange
        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        return incrementButton
    }()
    
    let decrementButton: UIButton = {
        let decrementButton = UIButton(type: .custom)
        let image = UIImage(systemName: "minus.circle")
        decrementButton.frame = CGRect(x: 200, y: 200, width: 60, height: 60)
        decrementButton.setImage(image, for: .normal)
        decrementButton.tintColor          = .systemOrange
        decrementButton.translatesAutoresizingMaskIntoConstraints = false
        return decrementButton
    }()
    
    let quantityStackView: UIStackView = {
        let quantityStackView = UIStackView()
        quantityStackView.axis = .horizontal
        quantityStackView.spacing = 10
        quantityStackView.distribution = .fill
        quantityStackView.translatesAutoresizingMaskIntoConstraints = false
        return quantityStackView
    }()
    
    let bookImage: UIImageView = {
        let bookImage = UIImageView()
        bookImage.image = UIImage(named: "books")
        bookImage.clipsToBounds = true
        bookImage.layer.cornerRadius = 10
        bookImage.translatesAutoresizingMaskIntoConstraints = false
        return bookImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(bookImage)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(quantityStackView)
        
        quantityStackView.addArrangedSubview(incrementButton)
        quantityStackView.addArrangedSubview(counterLabel)
        quantityStackView.addArrangedSubview(decrementButton)
        
        let padding:CGFloat = 4
        
        NSLayoutConstraint.activate([
        
            bookImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            bookImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            bookImage.heightAnchor.constraint(equalToConstant: 80),
            bookImage.widthAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: bookImage.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: padding),
            priceLabel.leadingAnchor.constraint(equalTo: bookImage.trailingAnchor, constant: 24),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 18),
            
            quantityStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: padding),
            quantityStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -12),
            quantityStackView.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    func displayName(name: String) {
        nameLabel.text = name
    }
    
    func displayPrice(price: String) {
        priceLabel.text = price
    }
    
    func displayQuantity(counter: Int) {
        counterLabel.text = String(counter)
    }
}
