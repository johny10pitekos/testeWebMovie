//
//  WMEmptyStateView.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit

class WMEmptyStateView: UIView {
    
    let viewTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.1137, green: 0.1137, blue: 0.1686, alpha: 1.0)
        return view
    }()
    
    var nameTop: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "WeMovies"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    let viewContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var titleViewContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Parece que não há nada por aqui :("
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.1843, green: 0.1804, blue: 0.2549, alpha: 1.0)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var imageContent: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Frame")
        image.contentMode = .scaleAspectFit
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
        addSubview(viewTop)
        viewTop.addSubview(nameTop)
        addSubview(viewContent)
        viewContent.addSubview(titleViewContent)
        viewContent.addSubview(imageContent)
        viewContent.addSubview(reloadPageButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            viewTop.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            viewTop.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewTop.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewTop.heightAnchor.constraint(equalToConstant: 73),
            
            nameTop.centerXAnchor.constraint(equalTo: viewTop.centerXAnchor),
            nameTop.centerYAnchor.constraint(equalTo: viewTop.centerYAnchor),
            nameTop.heightAnchor.constraint(equalToConstant: 25),
            
            viewContent.topAnchor.constraint(equalTo: viewTop.bottomAnchor),
            viewContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewContent.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            titleViewContent.topAnchor.constraint(equalTo: viewContent.topAnchor, constant: 16),
            titleViewContent.leadingAnchor.constraint(equalTo: viewContent.leadingAnchor, constant: 40),
            titleViewContent.trailingAnchor.constraint(equalTo: viewContent.trailingAnchor, constant: -40),
            titleViewContent.heightAnchor.constraint(equalToConstant: 54),
            
            imageContent.topAnchor.constraint(equalTo: titleViewContent.bottomAnchor, constant: 40),
            imageContent.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor),
            imageContent.centerYAnchor.constraint(equalTo: viewContent.centerYAnchor),
            
            reloadPageButton.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: -20),
            reloadPageButton.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor),
            reloadPageButton.heightAnchor.constraint(equalToConstant: 40),
            reloadPageButton.widthAnchor.constraint(equalToConstant: 173),
        ])
    }
}

