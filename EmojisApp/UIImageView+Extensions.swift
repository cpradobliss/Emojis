//
//  UIImageView+Extensions.swift
//  EmojisApp
//
//  Created by Charles Prado on 01/02/2022.
//

import UIKit

// MARK: - ImageHelper
extension UIImageView {
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func load(fromUrl urlString: String) {
        let url = URL(string: urlString)!
        
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }
}
