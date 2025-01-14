//
//  ViewBarCollectionViewCell.swift
//  AppTempo
//
//  Created by Thiago Neves on 04/11/24.
//

import UIKit

class ViewBarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var timerBar: UILabel!
    @IBOutlet weak var ChangeOfRainBar: UILabel!
    @IBOutlet weak var degreesBar: UILabel!
    @IBOutlet weak var weatherImageBar: UIImageView!
    
    static let identifier: String = String(describing: ViewBarCollectionViewCell.self)
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    func setupBar (with infoBar: InfoBar){
        degreesBar.text = String(infoBar.degreesBar)
        ChangeOfRainBar.text = String(infoBar.ChangeOfRainBar)
        timerBar.text = String(infoBar.timerBar)
    }

}
