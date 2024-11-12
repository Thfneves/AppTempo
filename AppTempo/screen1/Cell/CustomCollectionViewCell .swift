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
    @IBOutlet weak var DaysOfWeek5: UILabel!
    @IBOutlet weak var Degrees5: UILabel!
    @IBOutlet weak var Min5: UILabel!
    @IBOutlet weak var Max5: UILabel!
    //Dia6
    @IBOutlet weak var DaysOfWeek6: UILabel!
    @IBOutlet weak var Degrees6: UILabel!
    @IBOutlet weak var Min6: UILabel!
    @IBOutlet weak var Max6: UILabel!
    //Dia7
    @IBOutlet weak var DaysOfWeek7: UILabel!
    @IBOutlet weak var Degrees7: UILabel!
    @IBOutlet weak var Min7: UILabel!
    @IBOutlet weak var Max7: UILabel!
    // Text
    @IBOutlet weak var BaseBoard: UILabel!
    
    //ViewBAR Collection
    @IBOutlet weak var ViewBarCollectionViewCe: UICollectionView!
    
    static let identifier: String = String(describing: CustomCollectionViewCell.self)
    
    static func nib () ->UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ConfigViewBarCollectionView()
        ViewBarCollectionViewCe.backgroundColor = UIColor.clear
    }
    func setupCell(with specifications: Specifications){
        
        City.text = String(specifications.city.rawValue)
        WeatherToday.text = String(specifications.weatherToday.description)
        DegreesToday.text = String(specifications.degreesToday)
        DayOfWeek.text = String(specifications.dayOfWeek.rawValue)
        MinOfWeek.text = String(specifications.minOfWeek)
        MaxOfWeek.text = String(specifications.maxOfWeek)
        // Dia 1
        DaysOfWeek1.text = String(specifications.day1.daysOfWeek1.rawValue)
        Degrees1.text = String(specifications.day1.degrees1)
        Min1.text = String(specifications.day1.min1)
        Max1.text = String(specifications.day1.max1)
        // Dia 2
        DaysOfWeek2.text = String(specifications.day2.daysOfWeek2.rawValue)
        Degrees2.text = String(specifications.day2.degrees2)
        Min2.text = String(specifications.day2.min2)
        Max2.text = String(specifications.day2.max2)
        // Dia 1
        DaysOfWeek3.text = String(specifications.day3.daysOfWeek3.rawValue)
        Degrees3.text = String(specifications.day3.degrees3)
        Min3.text = String(specifications.day3.min3)
        Max3.text = String(specifications.day3.max3)
        // Dia 1
        DaysOfWeek4.text = String(specifications.day4.daysOfWeek4.rawValue)
        Degrees4.text = String(specifications.day4.degrees4)
        Min4.text = String(specifications.day4.min4)
        Max4.text = String(specifications.day4.max4)
        // Dia 1
        DaysOfWeek5.text = String(specifications.day5.daysOfWeek5.rawValue)
        Degrees5.text = String(specifications.day5.degrees5)
        Min5.text = String(specifications.day5.min5)
        Max5.text = String(specifications.day5.max5)
        // Dia 6
        DaysOfWeek6.text = String(specifications.day6.daysOfWeek6.rawValue)
        Degrees6.text = String(specifications.day6.degrees6)
        Min6.text = String(specifications.day6.min6)
        Max6.text = String(specifications.day6.max6)
        // Dia 7
        DaysOfWeek7.text = String(specifications.day7.daysOfWeek7.rawValue)
        Degrees7.text = String(specifications.day7.degrees7)
        Min7.text = String(specifications.day7.min7)
        Max7.text = String(specifications.day7.max7)
        
    }
    
    func ConfigViewBarCollectionView(){
        ViewBarCollectionViewCe.delegate = self
        ViewBarCollectionViewCe.dataSource = self
        if let layout = ViewBarCollectionViewCe.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
            
        }
        //ViewBarCollectionViewCell.register(UINib(nibName: "ViewBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ViewBarCollectionViewCell")
        ViewBarCollectionViewCe.register(ViewBarCollectionViewCell.nib(), forCellWithReuseIdentifier: ViewBarCollectionViewCell.identifier)
    }
    
    var infoBar: [InfoBar] = [
        InfoBar(timerBar: "11:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "12:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "13:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "14:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "15:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "16:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "16:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "17:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "18:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "19:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "20:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
        InfoBar(timerBar: "21:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy  ),
    ]
}
extension CustomCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoBar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ViewBarCollectionViewCe.dequeueReusableCell(withReuseIdentifier: ViewBarCollectionViewCell.identifier, for: indexPath) as? ViewBarCollectionViewCell
        cell?.setupBar (with: infoBar[indexPath.row])
        return cell ?? UICollectionViewCell()
    }

    
}
//extension ViewController:UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: view.frame.height)
//    }
//    
//}
