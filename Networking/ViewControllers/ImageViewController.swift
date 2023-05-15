//
//  ImageViewController.swift
//  Networking
//
//  Created by Алексей Филиппов on 07.05.2023.
//

import UIKit

final class ImageViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Private Properties
    private let networkManager = NetworkManager.shared
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImage()
    }
    
    //MARK: - Private Methods
    private func fetchImage() {
        networkManager.fetchImage(from: Link.imageURL.url) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.imageView.image = UIImage(data: imageData)
                self?.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
    }
}
