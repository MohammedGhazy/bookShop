//
//  GFBodyLabel.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 13/07/2021.
//

import UIKit

class GFBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(txtAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = txtAlignment
        configure()
    }
    
    private func configure(){
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        font = UIFont.preferredFont(forTextStyle: .body)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
