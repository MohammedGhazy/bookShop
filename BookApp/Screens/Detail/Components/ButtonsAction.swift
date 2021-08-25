//
//  ButtonsAction.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 09/08/2021.
//

import UIKit

class ButtonsAction: UIStackView {
    
    let addCartBtn = GFButton(color: .systemOrange, title: "Add To Cart")
    
    let cartIcon: UIButton = {
        let cartIcon = UIButton()
        let icon = UIImage(systemName: "cart")!
        let tintedImage = icon.withRenderingMode(.alwaysTemplate)
        cartIcon.setImage(tintedImage, for: .normal)
        cartIcon.imageView?.contentMode = .scaleAspectFit
        cartIcon.tintColor = .systemOrange
        return cartIcon
    }()
    
    let favIcon: UIButton = {
        let favIcon = UIButton()
        let icon = UIImage(systemName: "star")!
        let tintedImage = icon.withRenderingMode(.alwaysTemplate)
        favIcon.setImage(tintedImage, for: .normal)
        favIcon.imageView?.contentMode = .scaleAspectFit
        favIcon.tintColor = .systemOrange
        return favIcon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        addArrangedSubview(addCartBtn)
        addArrangedSubview(cartIcon)
        addArrangedSubview(favIcon)
        
        axis = .horizontal
        spacing = 10
        distribution = .fillProportionally
        translatesAutoresizingMaskIntoConstraints = false
    }
}
