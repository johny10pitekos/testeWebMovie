//
//  WMCarViewController.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit
import Kingfisher

class WMCarViewController: UIViewController {
    
    var totalPrice: Double = 0.0
    var allNameMovie: String = ""
    let TIME_TO_WAIT = 1.0
    
    lazy var viewWMCar: WMCarView = {
        let view = WMCarView()
        return view
    }()
    
    lazy var viewWMCarEmpty: WMEmptyStateView = {
        let view = WMEmptyStateView()
        return view
    }()
          
    let viewModel = WMCarViewModel()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoadingWithDelay()
        setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        if CardShopping.shared.card.isEmpty {
            self.view = viewWMCarEmpty
        } else {
            self.view = viewWMCar
            calculateProduct()
            setupUI()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showLoadingWithDelay()
    }
    
    private func showLoadingWithDelay() {
        WMLoading.showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + TIME_TO_WAIT) {
            WMLoading.hideLoading()
        }
    }
    
    func setupUI() {
        viewWMCar.filmTitleLabel.text = allNameMovie
        viewWMCar.subtotalPriceLabel.text = "R$ \(String(format: "%.2f", totalPrice))"
        viewWMCar.totalPriceLabel.text = "R$ \(String(format: "%.2f", totalPrice))"
        
        viewWMCar.movieImageView.kf.setImage(with: viewModel.imageURL)
    }
    
    func setupActions() {
        viewWMCar.finishOrderButton.addTarget(self, action: #selector(finishOrderButtonTap), for: .touchUpInside)
    }
    
    @objc
    private func finishOrderButtonTap() {
        allNameMovie = ""
        totalPrice = 0.0
        CardShopping.shared.card.removeAll()
        NotificationCenter.default.post(name: Notification.Name("tableViewReload"), object: nil)
        let vc = WMSuccessViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func calculateProduct() {
        allNameMovie = ""
        for product in CardShopping.shared.card {
            totalPrice = (product.price ?? 0.0) + totalPrice
            allNameMovie.append("\(String(describing: product.title ?? "")) ")
            if CardShopping.shared.card.count > 1 {
                allNameMovie.append(", ")
            }
        }
    }
}
