//
//  ViewBarCollectionViewCell.swift
//  AppTempo
//
//  Created by Thiago Neves on 04/11/24.
//

import UIKit

class TempByHourCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var timerBar: UILabel!
    @IBOutlet weak var ChangeOfRainBar: UILabel!
    @IBOutlet weak var degreesBar: UILabel!
    @IBOutlet weak var weatherImageBar: UIImageView!
    
    static let identifier: String = String(describing: TempByHourCollectionViewCell.self)
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    func setupBar (with tempByHour: TempByHour){
        degreesBar.text = String(tempByHour.degreesBar)
        ChangeOfRainBar.text = "\(tempByHour.chanceOfRainBar)%"
        timerBar.text = String(tempByHour.timerBar)
        weatherImage.tintColor = .white
    }

}
