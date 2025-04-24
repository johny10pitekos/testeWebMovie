//
//  WMSuccessView.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit

class WMSuccessView: UIView {
    
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.1137, green: 0.1137, blue: 0.1686, alpha: 1.0)
        return view
    }()
    
    var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "WeMovies"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var purchaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Compra realizada em 14/06/2024 às 15:12"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(red: 0.6314, green: 0.6314, blue: 0.6314, alpha: 1.0)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Compra realizada com sucesso!"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(red: 0.1843, green: 0.1804, blue: 0.2549, alpha: 1.0)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let imageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    var successImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "ImgSuccess")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }()
    
    var reloadPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recarregar página", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .black)
        button.backgroundColor = UIColor(red: 0, green: 0.6196, blue: 0.8667, alpha: 1.0)
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.1843, green: 0.1804, blue: 0.2549, alpha: 1.0)
        addElementsVisual()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsVisual() {
        addSubview(headerView)
        headerView.addSubview(headerLabel)
        addSubview(containerView)
        containerView.addSubview(purchaseDateLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(imageContainerView)
        containerView.addSubview(reloadPageButton)
        imageContainerView.addSubview(successImageView)
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 73),
            
            headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: 25),
            
            containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            purchaseDateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            purchaseDateLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            purchaseDateLabel.heightAnchor.constraint(equalToConstant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: purchaseDateLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 32),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -32),
            titleLabel.heightAnchor.constraint(equalToConstant: 54),
            
            imageContainerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            imageContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            imageContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            imageContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            
            successImageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            successImageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            
            reloadPageButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            reloadPageButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            reloadPageButton.heightAnchor.constraint(equalToConstant: 40),
            reloadPageButton.widthAnchor.constraint(equalToConstant: 173)
            
        ])
    }
}
