//
//  WMCarView.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit
import Kingfisher

class WMCarView: UIView {
    
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.1137, green: 0.1137, blue: 0.1686, alpha: 1.0)
        return view
    }()
    
    var cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    var imageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    var filmTitleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    var addFilmContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        return view
    }()
    
    var totalContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
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
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carrinho de compras"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    var movieImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person")
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .clear
        return image
    }()
    
    var filmTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Homem Aranha: No Way Home"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 12, weight: .black)
        label.textColor = .black
        label.textAlignment = .left
        label.backgroundColor = .white
        return label
    }()
    
    var filmAddedDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adicionado em 14/06/2024"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(red: 0.6314, green: 0.6314, blue: 0.6314, alpha: 1.0)
        label.textAlignment = .left
        label.backgroundColor = .white
        return label
    }()
    
    var filmPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    var trashButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "trash"), for: .normal)
        return button
    }()
    
    var removeItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "removeButton"), for: .normal)
        return button
    }()
    
    var addItemButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "addButton"), for: .normal)
        return button
    }()
    
    var itemQuantityTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "0"
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textAlignment = .center
        return text
    }()
    
    var subTotalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SUBTOTAL"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    var subtotalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 29,99"
        label.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        label.textColor = UIColor(red: 0.1843, green: 0.1804, blue: 0.2549, alpha: 1.0)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    var totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TOTAL"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$ 29,90"
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textColor = UIColor(red: 0.1843, green: 0.1804, blue: 0.2549, alpha: 1.0)
        label.textAlignment = .right
        label.backgroundColor = .clear
        return label
    }()
    
    var finishOrderButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("FINALIZAR PEDIDO", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .black)
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
        addSubview(titleLabel)
        addSubview(cardView)
        cardView.addSubview(imageContainerView)
        cardView.addSubview(finishOrderButton)
        cardView.addSubview(filmTitleContainerView)
        cardView.addSubview(addFilmContainerView)
        cardView.addSubview(separatorView)
        cardView.addSubview(totalContainerView)
        imageContainerView.addSubview(movieImageView)
        imageContainerView.addSubview(trashButton)
        filmTitleContainerView.addSubview(filmTitleLabel)
        filmTitleContainerView.addSubview(filmAddedDateLabel)
        addFilmContainerView.addSubview(removeItemButton)
        addFilmContainerView.addSubview(itemQuantityTextField)
        addFilmContainerView.addSubview(addItemButton)
        addFilmContainerView.addSubview(subTotalLabel)
        addFilmContainerView.addSubview(subtotalPriceLabel)
        totalContainerView.addSubview(totalLabel)
        totalContainerView.addSubview(totalPriceLabel)
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
            
            titleLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 27),
            
            cardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalToConstant: 295),
            
            imageContainerView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            imageContainerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            imageContainerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            imageContainerView.heightAnchor.constraint(equalToConstant: 72),
            
            movieImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 72),
            movieImageView.widthAnchor.constraint(equalToConstant: 56),
            
            filmTitleContainerView.centerYAnchor.constraint(equalTo: movieImageView.centerYAnchor),
            filmTitleContainerView.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 8),
            filmTitleContainerView.heightAnchor.constraint(equalToConstant: 58),
            filmTitleContainerView.widthAnchor.constraint(equalToConstant: 180),
            
            filmTitleLabel.topAnchor.constraint(equalTo: filmTitleContainerView.topAnchor, constant: 8),
            filmTitleLabel.leadingAnchor.constraint(equalTo: filmTitleContainerView.leadingAnchor),
            filmTitleLabel.trailingAnchor.constraint(equalTo: filmTitleContainerView.trailingAnchor,constant: -8),
            
            filmAddedDateLabel.topAnchor.constraint(equalTo: filmTitleLabel.bottomAnchor, constant: 5),
            filmAddedDateLabel.leadingAnchor.constraint(equalTo: filmTitleContainerView.leadingAnchor),
            filmAddedDateLabel.trailingAnchor.constraint(equalTo: filmTitleContainerView.trailingAnchor,constant: -8),
            
            addFilmContainerView.topAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: 16),
            addFilmContainerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            addFilmContainerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            addFilmContainerView.heightAnchor.constraint(equalToConstant: 38),
            
            removeItemButton.centerYAnchor.constraint(equalTo: addFilmContainerView.centerYAnchor),
            removeItemButton.leadingAnchor.constraint(equalTo: addFilmContainerView.leadingAnchor),
            removeItemButton.heightAnchor.constraint(equalToConstant: 18),
            removeItemButton.widthAnchor.constraint(equalToConstant: 18),
            
            itemQuantityTextField.centerYAnchor.constraint(equalTo: removeItemButton.centerYAnchor),
            itemQuantityTextField.leadingAnchor.constraint(equalTo: removeItemButton.trailingAnchor, constant: 5),
            itemQuantityTextField.heightAnchor.constraint(equalToConstant: 26),
            itemQuantityTextField.widthAnchor.constraint(equalToConstant: 59),
            
            addItemButton.centerYAnchor.constraint(equalTo: itemQuantityTextField.centerYAnchor),
            addItemButton.leadingAnchor.constraint(equalTo: itemQuantityTextField.trailingAnchor, constant: 5),
            addItemButton.heightAnchor.constraint(equalToConstant: 18),
            addItemButton.widthAnchor.constraint(equalToConstant: 18),
            
            subTotalLabel.topAnchor.constraint(equalTo: addFilmContainerView.topAnchor),
            subTotalLabel.trailingAnchor.constraint(equalTo: addFilmContainerView.trailingAnchor),
            subTotalLabel.heightAnchor.constraint(equalToConstant: 16),
            
            subtotalPriceLabel.bottomAnchor.constraint(equalTo: addFilmContainerView.bottomAnchor),
            subtotalPriceLabel.trailingAnchor.constraint(equalTo: addFilmContainerView.trailingAnchor),
            subtotalPriceLabel.heightAnchor.constraint(equalToConstant: 22),
            
            separatorView.topAnchor.constraint(equalTo: addFilmContainerView.bottomAnchor, constant: 20),
            separatorView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            totalContainerView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            totalContainerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            totalContainerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            totalContainerView.heightAnchor.constraint(equalToConstant: 33),
            
            totalLabel.centerYAnchor.constraint(equalTo: totalContainerView.centerYAnchor),
            totalLabel.leadingAnchor.constraint(equalTo: totalContainerView.leadingAnchor),
            
            totalPriceLabel.centerYAnchor.constraint(equalTo: totalContainerView.centerYAnchor),
            totalPriceLabel.trailingAnchor.constraint(equalTo: totalContainerView.trailingAnchor),
            
            trashButton.centerYAnchor.constraint(equalTo: filmTitleContainerView.centerYAnchor),
            trashButton.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor, constant: -16),
            trashButton.heightAnchor.constraint(equalToConstant: 18),
            trashButton.widthAnchor.constraint(equalToConstant: 16),
            
            finishOrderButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -8),
            finishOrderButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            finishOrderButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            finishOrderButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
