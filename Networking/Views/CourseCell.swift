//
//  CourseCell.swift
//  Networking
//
//  Created by Алексей Филиппов on 07.05.2023.
//

import UIKit

final class CourseCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var nameOfCourseLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    
    //MARK: - Private Properties
    private let networkManager = NetworkManager.shared
    
    //MARK: - Methods
    func configure(with course: Course) {
        nameOfCourseLabel.text = course.name
        numberOfLessons.text = "Number of lessons: \(course.numberOfLessons)"
        numberOfTests.text = "Number os tests: \(course.numberOfTests)"
        
        networkManager.fetchImage(from: course.imageUrl) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.courseImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
