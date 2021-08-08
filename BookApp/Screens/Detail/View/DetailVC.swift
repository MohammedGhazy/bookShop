//
//  DetailVC.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 15/07/2021.
//

import UIKit

class DetailVC: UIViewController,DetailDataView, UICollectionViewDelegate {
    
    let testLabel = GFBodyLabel(txtAlignment: .center)
    var presenter: DetailVCPresenter!
    var bookId: Int = 1
    
    
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
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowOffset  = .zero
        containerView.layer.shadowRadius  = 4
        containerView.backgroundColor     = .white
        containerView.layer.cornerRadius  = 30
        containerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]


        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DetailVCPresenter(view: self)
        presenter.getSingleBook(id: bookId)
        presenter.setDataViewDelegate(detailDataView: self)
        configureViewController()
        cinfigureLabel()
        configureHeader()
    }
    
    
    func configureViewController() {
        title = "Details"
        view.backgroundColor = .systemBackground
    }
    
    func configureHeader() {
        view.addSubview(containerView)
        containerView.addSubview(bookImage)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: view.frame.size.height*0.4),
            
            bookImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            bookImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bookImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bookImage.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    func cinfigureLabel() {
        view.addSubview(testLabel)
        NSLayoutConstraint.activate([
            testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func displayData(author: String) {
        testLabel.text = author
    }
    
}
