//
//  DetailVC.swift
//  BookApp
//
//  Created by Mohamed Ghazy on 15/07/2021.
//

import UIKit

class DetailVC: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView             = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var presenter: DetailVCPresenter!
    var bookId: Int    = 1
    
    let buttonsAction  = ButtonsAction()
    let headerView     = HeaderView()
    let mainDetail     = MainDetail()
    let otherDetail    = OtherDetail()
    
    let contentView: UIStackView = {
        let contentView = UIStackView()
        contentView.axis = .vertical
        contentView.spacing = 10
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = DetailVCPresenter(view: self)
        presenter.getSingleBook(id: bookId)
        presenter.setDataViewDelegate(detailDataView: self)
        configureViewController()
        configureScrollView()
        configureContentView()
        configureButtonsAction()
        configureSelectedButtonsAction()
    }
    
    
    func configureViewController() {
        title = "Details"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func configureContentView() {

        scrollView.addSubview(contentView)
        
        contentView.addArrangedSubview(headerView)
        contentView.addArrangedSubview(mainDetail)
        contentView.addArrangedSubview(otherDetail)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: -view.frame.size.height*0.08),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func configureButtonsAction() {
        
        view.addSubview(buttonsAction)
        
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            buttonsAction.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -padding),
            buttonsAction.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            buttonsAction.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
        ])
    }
    
    func configureSelectedButtonsAction() {
        buttonsAction.addCartBtn.addTarget(self, action: #selector(addCartActionButtonTapped), for: .touchUpInside)
    }
    
    @objc func addCartActionButtonTapped() { presenter?.setAddBookToCartBtnAction() }
    
}
