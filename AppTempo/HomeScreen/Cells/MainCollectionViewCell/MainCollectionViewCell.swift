

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var weatherToday: UILabel! //Clima hoje
    @IBOutlet weak var degreesToday: UILabel!   // Graus hOJE
    @IBOutlet weak var dayOfWeek: UILabel! // dia da semana
    @IBOutlet weak var minOfWeek: UILabel!
    @IBOutlet weak var maxOfWeek: UILabel!
    
    @IBOutlet weak var pictureClimateToday: UIImageView!
    @IBOutlet weak var baseBoard: UILabel!
    
    @IBOutlet weak var viewBarCollectionViewCe: UICollectionView!
    
    static let identifier: String = String(describing: MainCollectionViewCell.self)
    
    static func nib () ->UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        ConfigViewBarCollectionView()
        viewBarCollectionViewCe.backgroundColor = UIColor.clear
    }
    var tempTroughDay: TempTroughDay?
    
    
    
    let controller = Controller()
    func setupCell(with weatherModel: WeatherModel) {
       
        let dayOfWeekText = controller.GetDayOfWeek(welcome: weatherModel)
        let weatherImage = Controller.imageDict[ weatherModel.weather[0].main ] ?? "Sun"
        let weatherCondition = String(weatherModel.weather[0].description)
        let translatedWeather = weatherModel.weather[0].main.rawValue
        weatherToday.text = translatedWeather
        dayOfWeek.text = String(dayOfWeekText)
        city.text = String(weatherModel.name)
        weatherToday.text = String(translatedWeather)
        degreesToday.text = "\(Int(weatherModel.main.temp)) °C"
        minOfWeek.text =  "\(Int(weatherModel.main.tempMin))°C"
        maxOfWeek.text =  "\(Int(weatherModel.main.tempMax))°C"
        pictureClimateToday.image =  UIImage(named: weatherImage)

        tempTroughDay = TempTroughDay( minTempToday: weatherModel.main.tempMin, maxTempToday: weatherModel.main.tempMax)
    }

    
    

    func ConfigViewBarCollectionView(){
        viewBarCollectionViewCe.delegate = self
        viewBarCollectionViewCe.dataSource = self
        if let layout = viewBarCollectionViewCe.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        viewBarCollectionViewCe.register(TempByHourCollectionViewCell.nib(), forCellWithReuseIdentifier: TempByHourCollectionViewCell.identifier)
    }
}

extension MainCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempTroughDay?.hours.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = viewBarCollectionViewCe.dequeueReusableCell(withReuseIdentifier: TempByHourCollectionViewCell.identifier, for: indexPath) as? TempByHourCollectionViewCell
        
        if let tempTroughDay = self.tempTroughDay{
            cell?.setupBar (with: tempTroughDay.hours[indexPath.row])
            return cell ?? UICollectionViewCell()
        }else{
            print("error CollectionVireCell tempTrougDay")
            return UICollectionViewCell()
        }
        
    }

}
