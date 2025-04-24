//
//  WMProfileViewController.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit

class WMProfileViewController: UIViewController {
    
    let TIME_TO_WAIT = 1.0
    
    lazy var viewWMProfile: WMProfileView = {
        let view = WMProfileView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = viewWMProfile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
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
}
