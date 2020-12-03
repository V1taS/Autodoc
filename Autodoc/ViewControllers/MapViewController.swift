//
//  MapViewController.swift
//  Autodoc
//
//  Created by Виталий Сосин on 03.12.2020.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    private weak var mapView: GMSMapView!
    private let networkManager = NetworkManager()
    private let markersURL = "https://run.mocky.io/v3/96149d36-4ce8-4d4b-a3ac-f937068a1d35"
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Х", for: .normal)
        button.setTitleColor(.mainBlue(), for: .normal)
        button.titleLabel?.font = .markerFel40()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addMap()
        setupConstraints()
        
        networkManager.delegate = self
        networkManager.getMarkers(for: markersURL)
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if #available(iOS 12.0, *) {
            if traitCollection.userInterfaceStyle == .dark {
                if let styleURL = Bundle.main.url(forResource: "gmsDarkStyle", withExtension: "json") {
                    mapView.mapStyle = try? GMSMapStyle(contentsOfFileURL: styleURL)
                }
            }
        }
    }
}

// MARK: - Actions
private extension MapViewController {
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}

// MARK: - Add map
private extension MapViewController {
    
    private func addMap() {
        let camera = GMSCameraPosition.camera(withLatitude: 55.751244, longitude: 37.618423, zoom: 4.0)
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        self.mapView = mapView
    }
}

// MARK: - Markers fetched
extension MapViewController: NetworkDelegate {
    
    func markersFetched(_ markers: [Person]) {
        for mark in markers {
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: mark.Latitude , longitude: mark.Longitude))
            marker.title = mark.ClientCode
            marker.snippet = mark.StatusOnline ? "Онлайн" : "Оффлайн"
            marker.appearAnimation = .pop
            marker.map = mapView
        }
    }
}

// MARK: - Setup constraints
private extension MapViewController {
    
    private func setupConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}
