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
    
    @IBOutlet weak var PictureClimateToday: UIImageView!
    // Text
    @IBOutlet weak var BaseBoard: UILabel!
    
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
    

    let controller = Controller()
    // PORQUE LET CONTROLLER É INSTANCIAVEL E QUANDO TENTAMOS INSTANCIAR SPECIFICATION, O XCODE NOS OBRIGA A TRAZER UM INIT?
    // Se eu tivesse na Struct  Controller, variaveis com tipos mas sem valor declarado, seria obrigado a utilizar um Init?
    func setupCell(with welcome: Welcome) {
       
        let dayOfWeekText = controller.GetDayOfWeek(welcome: welcome)
        let weatherImage = controller.weatherIcon(welcome.weather[0].main)
        let weatherCondition = String(welcome.weather[0].main)
        let translatedWeather = controller.translateWeather(weatherCondition)
        // Pedir para o gabriel explicar a traducao, porque nao entendi muito bem como esse codigo funciona.
        WeatherToday.text = translatedWeather
        DayOfWeek.text = String(dayOfWeekText)
        City.text = String(welcome.name)
        WeatherToday.text = String(translatedWeather)
        DegreesToday.text = controller.ConversionDegreesToday(welcome: welcome).tempToday
        MinOfWeek.text =  controller.ConversionDegreesToday(welcome: welcome).minOfDay
        MaxOfWeek.text =  controller.ConversionDegreesToday(welcome: welcome).maxOfDay
        PictureClimateToday.image =  UIImage(named: weatherImage)

        
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

    func ConfigViewBarCollectionView(){
        ViewBarCollectionViewCe.delegate = self
        ViewBarCollectionViewCe.dataSource = self
        if let layout = ViewBarCollectionViewCe.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
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

}
