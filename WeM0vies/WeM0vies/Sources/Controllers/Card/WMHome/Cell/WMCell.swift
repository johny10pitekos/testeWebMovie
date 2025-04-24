//
//  WMCell.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit
import Kingfisher

class WMCell: UITableViewCell {
    
    static let identifier = String(describing: WMCell.self)
    
    var subscribeButtonAction : (() -> ())?

    var movieCard: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.clipsToBounds = true
        return view
    }()
    
    var imageMovie: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var nameFilm: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .black)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    var priceFilm: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    var buttonAddFilm: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ADICIONAR AO CARRINHO", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .black)
        button.backgroundColor = UIColor(red: 0, green: 0.6196, blue: 0.8667, alpha: 1.0)
        button.layer.cornerRadius = 4
        button.clipsToBounds = true
        button.addTarget(WMCell.self, action: #selector(subscribeButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        addElementsVisual()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElementsVisual() {
        addSubview(movieCard)
        movieCard.addSubview(imageMovie)
        movieCard.addSubview(nameFilm)
        movieCard.addSubview(priceFilm)
        movieCard.addSubview(buttonAddFilm)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieCard.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            movieCard.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            movieCard.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            movieCard.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -16),
            movieCard.heightAnchor.constraint(equalToConstant: 292),
            
            imageMovie.topAnchor.constraint(equalTo: movieCard.topAnchor, constant: 8),
            imageMovie.centerXAnchor.constraint(equalTo: movieCard.centerXAnchor),
            imageMovie.heightAnchor.constraint(equalToConstant: 188),
            imageMovie.widthAnchor.constraint(equalToConstant: 174),
            
            nameFilm.topAnchor.constraint(equalTo: imageMovie.bottomAnchor,constant: 8),
            nameFilm.leadingAnchor.constraint(equalTo: movieCard.leadingAnchor),
            nameFilm.trailingAnchor.constraint(equalTo: movieCard.trailingAnchor),
            nameFilm.heightAnchor.constraint(equalToConstant: 18),
            
            priceFilm.topAnchor.constraint(equalTo: nameFilm.bottomAnchor, constant: 8),
            priceFilm.leadingAnchor.constraint(equalTo: movieCard.leadingAnchor),
            priceFilm.trailingAnchor.constraint(equalTo: movieCard.trailingAnchor),
            priceFilm.heightAnchor.constraint(equalToConstant: 22),
            
            buttonAddFilm.topAnchor.constraint(equalTo: priceFilm.bottomAnchor, constant: 8),
            buttonAddFilm.leadingAnchor.constraint(equalTo: movieCard.leadingAnchor, constant: 16),
            buttonAddFilm.trailingAnchor.constraint(equalTo: movieCard.trailingAnchor, constant: -16),
            buttonAddFilm.heightAnchor.constraint(equalToConstant: 40),
            buttonAddFilm.bottomAnchor.constraint(equalTo: movieCard.bottomAnchor, constant: -8)
        ])
    }
    
    func setupCell(movie: Product?) {
        if let url = URL(string: movie?.image ?? "") {
            imageMovie.kf.indicatorType = .activity
            imageMovie.kf.setImage(with: url)
        } else {
            imageMovie.image = nil
        }
        nameFilm.text = movie?.title ?? ""
        priceFilm.text = "R$ \(movie?.price ?? 0.0)"
    }
    
    @objc func subscribeButtonTapped(_ sender: UIButton){
      subscribeButtonAction?()
    }
    
    func selectedMovie() {
        buttonAddFilm.setTitle("Adicionado", for: .normal)
        buttonAddFilm.backgroundColor = UIColor(red: 0.0118, green: 0.6078, blue: 0, alpha: 1.0)
    }
}
