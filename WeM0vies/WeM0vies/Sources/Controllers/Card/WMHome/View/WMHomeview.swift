//
//  WMHomeview.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit

class WMHomeView: UIView {
    
    let viewTop: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.1137, green: 0.1137, blue: 0.1686, alpha: 1.0)
        return view
    }()
    
    let viewTitle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
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
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mais vendidos"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    var descrLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Maiores sucessos do WeMovies"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.textAlignment = .left
        label.backgroundColor = .clear
        return label
    }()
    
    var tableViewList: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(WMCell.self, forCellReuseIdentifier: WMCell.identifier)
        return tableView
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
        addSubview(viewTitle)
        viewTitle.addSubview(titleLabel)
        viewTitle.addSubview(descrLabel)
        addSubview(tableViewList)
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
            
            viewTitle.topAnchor.constraint(equalTo: viewTop.bottomAnchor),
            viewTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            viewTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewTitle.heightAnchor.constraint(equalToConstant: 47),
            
            titleLabel.topAnchor.constraint(equalTo: viewTitle.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: viewTitle.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 27),
            
            descrLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descrLabel.leadingAnchor.constraint(equalTo: viewTitle.leadingAnchor),
            descrLabel.heightAnchor.constraint(equalToConstant: 16),
            
            tableViewList.topAnchor.constraint(equalTo: viewTitle.bottomAnchor, constant: 8),
            tableViewList.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            tableViewList.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            tableViewList.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableViewList.delegate = delegate
        tableViewList.dataSource = dataSource
    }
    
    func tableViewReloadData() {
        tableViewList.reloadData()
    }
}
