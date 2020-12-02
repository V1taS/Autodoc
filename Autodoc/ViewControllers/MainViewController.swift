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
    
    private let aboutMeButton = UIButton(title: "Обо мне",
                             titleColor: .mainDark(),
                             backgroundColor: .mainWhite(),
                             font: .markerFel20())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Autodoc"
        setupConstraints()
        
        mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        aboutMeButton.addTarget(self, action: #selector(aboutMeButtonTapped), for: .touchUpInside)
    }
}

// MARK: - Actions
private extension MainViewController {
    
    @objc private func mapButtonTapped() {
        let mapViewController = MapViewController()
        mapViewController.modalPresentationStyle = .fullScreen
        self.present(mapViewController, animated: true)
    }
    
    @objc private func aboutMeButtonTapped() {
        // Жду реализации ViewController
    }
}

// MARK: - Setup constraints
private extension MainViewController {
    
    private func setupConstraints() {
        let stackView = UIStackView(
            arrangedSubviews: [mapButton, aboutMeButton],
            axis: .vertical,
            spacing: 24
        )
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.screenHeight / 2),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}
