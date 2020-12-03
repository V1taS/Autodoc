//
//  MainViewController.swift
//  Autodoc
//
//  Created by Виталий Сосин on 03.12.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mapButton = UIButton(title: "Посмотреть карту",
                                     titleColor: .mainDark(),
                                     backgroundColor: .mainWhite(),
                                     font: .markerFel20())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        
        title = "Autodoc"
        setupConstraints()
        mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
private extension MainViewController {
    
    @objc private func mapButtonTapped() {
        let mapViewController = MapViewController()
        mapViewController.modalPresentationStyle = .fullScreen
        self.present(mapViewController, animated: true)
    }
}

// MARK: - Setup constraints
private extension MainViewController {
    
    private func setupConstraints() {
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapButton)
        
        NSLayoutConstraint.activate([
            mapButton.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.screenHeight / 2),
            mapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}
