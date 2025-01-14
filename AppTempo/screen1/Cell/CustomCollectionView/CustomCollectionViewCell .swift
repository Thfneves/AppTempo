

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var weatherToday: UILabel! //Clima hoje
    @IBOutlet weak var degreesToday: UILabel!   // Graus hOJE
    @IBOutlet weak var dayOfWeek: UILabel! // dia da semana
    @IBOutlet weak var minOfWeek: UILabel!
    @IBOutlet weak var maxOfWeek: UILabel!
    
    @IBOutlet weak var pictureClimateToday: UIImageView!
    @IBOutlet weak var baseBoard: UILabel!
    
    @IBOutlet weak var viewBarCollectionViewCe: UICollectionView!
    
    static let identifier: String = String(describing: CustomCollectionViewCell.self)
    
    static func nib () ->UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        ConfigViewBarCollectionView()
        viewBarCollectionViewCe.backgroundColor = UIColor.clear
    }

    let controller = Controller()
    func setupCell(with welcome: Welcome) {
       
        let dayOfWeekText = controller.GetDayOfWeek(welcome: welcome)
        let weatherImage = controller.imageDict[ welcome.weather[0].main ] ?? "Sun"
        let weatherCondition = String(welcome.weather[0].description)
        let translatedWeather = controller.translateWeather(weatherCondition)
        weatherToday.text = translatedWeather
        dayOfWeek.text = String(dayOfWeekText)
        city.text = String(welcome.name)
        weatherToday.text = String(translatedWeather)
        degreesToday.text = "\(controller.ConversionDegreesToday(welcome: welcome).tempToday) °C"
        minOfWeek.text =  controller.ConversionDegreesToday(welcome: welcome).minOfDay
        maxOfWeek.text =  controller.ConversionDegreesToday(welcome: welcome).maxOfDay
        pictureClimateToday.image =  UIImage(named: weatherImage)

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
        viewBarCollectionViewCe.delegate = self
        viewBarCollectionViewCe.dataSource = self
        if let layout = viewBarCollectionViewCe.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        viewBarCollectionViewCe.register(ViewBarCollectionViewCell.nib(), forCellWithReuseIdentifier: ViewBarCollectionViewCell.identifier)
    }
}

extension CustomCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoBar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = viewBarCollectionViewCe.dequeueReusableCell(withReuseIdentifier: ViewBarCollectionViewCell.identifier, for: indexPath) as? ViewBarCollectionViewCell
        cell?.setupBar (with: infoBar[indexPath.row])
        return cell ?? UICollectionViewCell()
    }

}
