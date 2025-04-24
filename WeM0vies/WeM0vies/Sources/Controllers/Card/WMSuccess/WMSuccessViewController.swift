//
//  WMSuccessViewController.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit

class WMSuccessViewController: UIViewController {
    
    lazy var viewWMSuccess: WMSuccessView = {
        let view = WMSuccessView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = viewWMSuccess
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    private func setupActions() {
        viewWMSuccess.reloadPageButton.addTarget(self, action: #selector(reloadPageButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func reloadPageButtonTapped() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
