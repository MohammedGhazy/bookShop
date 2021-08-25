//
//  OtherDetailSingleItem.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 22/08/2021.
//

import UIKit

class OtherDetailSingleItem: UIStackView {

    let textLabel = GFBodyLabel(txtAlignment: .left)
    let icon      = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(text: String , icon: UIImageView) {
        super.init(frame: .zero)
        self.textLabel.text = text
        self.icon.image     = icon.image
        configure()
    }
    
    func configure() {
        axis = .horizontal
        spacing = 10
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(icon)
        addArrangedSubview(textLabel)
        icon.contentMode = .scaleAspectFit
        icon.tintColor   = .systemOrange
    }
    
}
