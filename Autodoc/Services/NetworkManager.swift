//
//  NetworkManager.swift
//  Autodoc
//
//  Created by Виталий Сосин on 03.12.2020.
//

import Foundation

protocol NetworkDelegate {
    func markersFetched(_ markers:[Person])
}

class NetworkManager {
    var delegate: NetworkDelegate?
    func getMarkers(for stringURL: String) {
        if let url = URL(string: stringURL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let persons = try JSONDecoder().decode([Person].self, from: data)
                        DispatchQueue.main.async {
                            self.delegate?.markersFetched(persons)
                        }
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }
    }
}
