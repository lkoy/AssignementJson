//
//  SplashViewController.swift
//  AssignmentMoneyou
//
//  Created by ttg on 22/09/2019.
//  Copyright © 2019 ttg. All rights reserved.
//

import UIKit
import Lottie

final class SplashViewController: BaseViewController {

    override var prefersNavigationBarHidden: Bool { return true }
    
    var presenter: SplashPresenterProtocol!
    
    // MARK: - Component Declaration
    
    private var animationView = LOTAnimationView(name: "loading-animation")
    private var imageView = UIImageView()
    
    private enum ViewTraits {
        static let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        static let loadingsize: CGFloat = 80.0
        static let logoHeigh: CGFloat = 20.0
    }
    
    public enum AccessibilityIds {
        
    }

    // MARK: - ViewLife Cycle

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        presenter.getInitDetails()
    }
    
    // MARK: - Setup

    override func setupComponents() {

        view.backgroundColor = .white
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopAnimation = true
        animationView.isUserInteractionEnabled = false
        view.addSubview(animationView)
        animationView.play()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }

    override func setupConstraints() {
        
        NSLayoutConstraint.activate([
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.heightAnchor.constraint(equalToConstant: ViewTraits.loadingsize),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.widthAnchor.constraint(equalToConstant: ViewTraits.loadingsize),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: ViewTraits.logoHeigh),
            imageView.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: ViewTraits.margins.bottom)
        ])
    }
    
    override func setupAccessibilityIdentifiers() {
        
    }

    // MARK: - Actions

    // MARK: Private Methods

}

// MARK: - SplashViewControllerProtocol
extension SplashViewController: SplashViewControllerProtocol {
 
}
