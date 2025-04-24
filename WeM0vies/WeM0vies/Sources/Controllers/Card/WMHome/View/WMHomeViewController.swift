//
//  WMHomeViewController.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit

class WMHomeViewController: UIViewController {
    
    lazy var viewWMHome: WMHomeView = {
        let view = WMHomeView()
        return view
    }()
    
    let viewModel = WMHomeViewModel()
    let TIME_TO_WAIT = 1.0
    
    override func loadView() {
        super.loadView()
        self.view = viewWMHome
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewWMHome.setupTableView(delegate: self, dataSource: self)
        setupRequest()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTableView(notification:)), name: Notification.Name("tableViewReload"), object: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupRequest() {
        WMLoading.showLoading()
        viewModel.fetchWebMoviesViewModel { [weak self] success in
            guard let self else { return }
            let vc = WMEmptyStateViewController()
            DispatchQueue.main.asyncAfter(deadline: .now() + TIME_TO_WAIT) {
                WMLoading.hideLoading()
                switch success {
                case .success(_):
                    if self.viewModel.numberOfRows == 0 {
                        self.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        self.viewWMHome.tableViewReloadData()
                    }
                case .failure(let failure):
                    self.navigationController?.pushViewController(vc, animated: true)
                    vc.viewWMEmptyState.reloadPageButton.addTarget(self, action: #selector(self.buttonReloadTapped), for: .touchUpInside)
                    self.showMessageError(title: "Erro", message: failure.localizedDescription)
                }
            }
        }
    }
    
    @objc
    private func buttonReloadTapped() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.setupRequest()
        }
    }
    
    func showMessageError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Erro na Busca", style: .destructive)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    @objc func reloadTableView(notification: NSNotification) {
        viewWMHome.tableViewList.reloadData()
    }
}

extension WMHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: WMCell.identifier, for: indexPath) as? WMCell {
            cell.setupCell(movie: viewModel.cellForRowsMovie(indexPath: indexPath))
            cell.subscribeButtonAction = {
                print("tentei fazer uma closure para trazer o click do botao da celula para ca, mas nao deu tempo de fazer funcionar ate entregar o projeto")
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CardShopping.shared.card.append(viewModel.cellForRowsMovie(indexPath: indexPath) ?? Product(id: 0, title: "", price: 0, image: ""))
        if let cell: WMCell = tableView.cellForRow(at: indexPath) as? WMCell {
            cell.selectedMovie()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 324
    }
}
