//
//  WMEmptyStateViewController.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit

class WMEmptyStateViewController: UIViewController {
    
    lazy var viewWMEmptyState: WMEmptyStateView = {
        let view = WMEmptyStateView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = viewWMEmptyState
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    private func setupActions() {
        viewWMEmptyState.reloadPageButton.addTarget(self, action: #selector(reloadPageButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func reloadPageButtonTapped() {
        self.dismiss(animated: true)
    }
}
