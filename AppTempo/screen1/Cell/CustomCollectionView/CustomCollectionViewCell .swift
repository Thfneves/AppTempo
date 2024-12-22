//
//  CustomCollectionViewCell 2.swift
//  AppTempo
//
//  Created by Thiago Neves on 24/10/24.
//
//Copia collectionview

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    
    
    // Primeira Stack Vi
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var WeatherToday: UILabel! //Clima hoje
    @IBOutlet weak var DegreesToday: UILabel!   // Graus hOJE
    @IBOutlet weak var DayOfWeek: UILabel! // dia da semana
    @IBOutlet weak var MinOfWeek: UILabel!
    @IBOutlet weak var MaxOfWeek: UILabel!
    
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
    
   
            
    
    func setupCell(with specifications: Welcome){
        
        func GetDayOfWeek(dt: Int) -> String{
            let date = Date(timeIntervalSince1970: TimeInterval(specifications.dt))
            let formatter = DateFormatter()
              formatter.locale = Locale(identifier: "pt_BR") // Configuração para o Brasil
              formatter.dateFormat = "EEEE" // Mostra o dia da semana por extenso
            let getDayOfWeek = formatter.string(from: date).capitalized
               return getDayOfWeek
        }
        //  Preciso converter Degrees today, que retorna da api em ingles, e trazer para portugues.
        let weatherMain = specifications.weather[0].main
        if weatherMain == WeatherTranslate{
            
        }
        
        
        
        
       
        func ConversionDegreesToday() ->Temp{
            let tempToday = specifications.main.temp - 273.15
            let minOfDay = specifications.main.tempMin - 273.15
            let maxOfDay = specifications.main.tempMax - 273.15
            return Temp(
                minOfDay: String(format: "%.1f", minOfDay),
                maxOfDay: String(format: "%.1f", maxOfDay),
                tempToday:String(format: "%.1f", tempToday)
                )
        }
        let dayOfWeek = GetDayOfWeek(dt: specifications.dt)
        DayOfWeek.text = String(dayOfWeek)
        City.text = String(specifications.name)
        WeatherToday.text = String(specifications.weather[0].main)
        DegreesToday.text = String(ConversionDegreesToday().tempToday)
//        DayOfWeek.text = getCurrentDayOfWeek()
        MinOfWeek.text =  String(ConversionDegreesToday().minOfDay)
        MaxOfWeek.text =  String(ConversionDegreesToday().maxOfDay)
        

        
    }


    var infoBar: [InfoBar] = [
        InfoBar(timerBar: "11:00", ChangeOfRainBar: 10, degreesBar: 30, weatherImageBar: .cloudy ),
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
    //extension ViewController:UICollectionViewDelegateFlowLayout{
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //        return CGSize(width: view.frame.width, height: view.frame.height)
    //    }
    //
    //}
}
