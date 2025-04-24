//
//  WMLoading.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import UIKit

class WMLoading: UIViewController {
    
    static let loading = WMLoading()
    
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
    
    let viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 26
        view.clipsToBounds = true
        return view
    }()
    
    let imageLoad: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Loader")
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElementsVisual()
        configConstraints()
        imageLoad.rotate360(duration: 2)
        setBackgroundColor(view: self.view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.topItem?.hidesBackButton = true
    }
    
    static func showLoading() {
        guard let rootVc = UIViewController.topViewController() else { return }
        rootVc.addChild(loading)
        rootVc.view.addSubview(loading.view)
        loading.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loading.view.topAnchor.constraint(equalTo: rootVc.view.topAnchor),
            loading.view.leadingAnchor.constraint(equalTo: rootVc.view.leadingAnchor),
            loading.view.trailingAnchor.constraint(equalTo: rootVc.view.trailingAnchor),
            loading.view.bottomAnchor.constraint(equalTo: rootVc.view.bottomAnchor)
        ])
    }
    
    static func hideLoading() {
        loading.view.removeFromSuperview()
        loading.willMove(toParent: nil)
        loading.removeFromParent()
        loading.didMove(toParent: nil)
    }
    
    func addElementsVisual() {
        view.addSubview(viewTop)
        viewTop.addSubview(nameTop)
        view.addSubview(viewBackground)
        viewBackground.addSubview(imageLoad)
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            
            viewTop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewTop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewTop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewTop.heightAnchor.constraint(equalToConstant: 73),
            
            nameTop.centerXAnchor.constraint(equalTo: viewTop.centerXAnchor),
            nameTop.centerYAnchor.constraint(equalTo: viewTop.centerYAnchor),
            nameTop.heightAnchor.constraint(equalToConstant: 25),
            
            viewBackground.topAnchor.constraint(equalTo: viewTop.bottomAnchor, constant: 30),
            viewBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewBackground.widthAnchor.constraint(equalToConstant: 85),
            viewBackground.heightAnchor.constraint(equalToConstant: 85),
            
            imageLoad.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            imageLoad.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            imageLoad.widthAnchor.constraint(equalToConstant: 83),
            imageLoad.heightAnchor.constraint(equalToConstant: 83),
        ])
    }
}

extension UIView {
    func rotate360(duration: CFTimeInterval = 1) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.repeatCount = Float.infinity
        rotateAnimation.duration = duration
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

extension UIViewController {
    class func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        let rootController = controller ?? {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                return windowScene.windows.first { $0.isKeyWindow }?.rootViewController
            }
            return nil
        }()
        
        if let navigationController = rootController as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        if let tabController = rootController as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        
        if let presented = rootController?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return rootController
    }
    
    func setBackgroundColor(view: UIView) {
        view.backgroundColor = UIColor(red: 0.1843, green: 0.1804, blue: 0.2549, alpha: 1.0)
    }
}

