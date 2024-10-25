//
//  CustomCollectionViewCell 2.swift
//  AppTempo
//
//  Created by Thiago Neves on 24/10/24.
//
//Copia collectionview

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    

    static let identifier: String = String(describing: CustomCollectionViewCell.self) // deixa a celula statica, nao guardando memoria
    
    static func nib () ->UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(with specifications: Specifications){
//        Humidity.text = String(specifications.humidity)
//        dayOfWeek.text = String(specifications.day.rawValue)
//        cityState.text = String(specifications.city.rawValue)
//        thermalSensation.text = String(specifications.thermalSensation.description)
//        minimunOfTheDay.text = String(specifications.minimumOfTheDay)
//        maximumOfTheDay.text = String(specifications.maximumOfTheDay)
//        temperature.text = String(specifications.climate.rawValue)
//        
//        climateImage.image = UIImage(named: specifications.climate.rawValue)
        
    }
    
}
