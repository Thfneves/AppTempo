//
//  CidadeTableViewCell.swift
//  AppTempo
//
//  Created by Thiago Neves on 13/10/24.
//

import UIKit

class CidadeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Temperature: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var DayOfWeek: UILabel!
    @IBOutlet weak var Humidity: UILabel!
    @IBOutlet weak var MinimumMaximum: UILabel!
    @IBOutlet weak var ThermalFeeling: UILabel!
    @IBOutlet weak var ViewImag: UIView!
    @IBOutlet weak var Sky: UIImageView!
    
    
    
    
    static let identifier: String = "CidadeTableViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: "CidadeTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code'
        
        
    }//Tipo descricao letra maiuscula
    func config(with description: Description){
        Temperature.text = String(description.temperatureThermal)
        City.text = description.municipality.rawValue
        DayOfWeek.text = description.dayOfTheWeek.rawValue
        Humidity.text = String(description.humidity)
        MinimumMaximum.text = String(description.minimaDay)
        Sky.image = UIImage(named: description.sky.rawValue)
    }
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
