//
//  CustomCollectionViewCell 2.swift
//  AppTempo
//
//  Created by Thiago Neves on 24/10/24.
//
//Copia collectionview

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    // Primeira Stack View
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var WeatherToday: UILabel! //Clima hoje
    @IBOutlet weak var DegreesToday: UILabel!   // Graus hOJE
    @IBOutlet weak var DayOfWeek: UILabel! // dia da semana
    @IBOutlet weak var MinOfWeek: UILabel!
    @IBOutlet weak var MaxOfWeek: UILabel!
    
    //Dias da semana
    //Dia0
    @IBOutlet weak var DaysOfWeek0: UILabel!
    @IBOutlet weak var Degrees0: UILabel!
    @IBOutlet weak var Min0: UILabel!
    @IBOutlet weak var Max0: UILabel!
    //Dia1
    @IBOutlet weak var DaysOfWeek1: UILabel!
    @IBOutlet weak var Degrees1: UILabel!
    @IBOutlet weak var Min1: UILabel!
    @IBOutlet weak var Max1: UILabel!
    //Dia2
    @IBOutlet weak var DaysOfWeek2: UILabel!
    @IBOutlet weak var Degrees2: UILabel!
    @IBOutlet weak var Min2: UILabel!
    @IBOutlet weak var Max2: UILabel!
    //Dia3
    @IBOutlet weak var DaysOfWeek3: UILabel!
    @IBOutlet weak var Degrees3: UILabel!
    @IBOutlet weak var Min3: UILabel!
    @IBOutlet weak var Max3: UILabel!
    //Dia4
    @IBOutlet weak var DaysOfWeek4: UILabel!
    @IBOutlet weak var Degrees4: UILabel!
    @IBOutlet weak var Min4: UILabel!
    @IBOutlet weak var Max4: UILabel!
    //Dia5
    
    //Dia6
    
    //Dia7
    

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
