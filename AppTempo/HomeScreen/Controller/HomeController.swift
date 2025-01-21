//
//  Controller.swift
//  AppTempo
//
//  Created by Thiago Neves on 25/12/24.
//
import Foundation
struct Controller{
      
    enum Climate: String{
        case cloudy = "Cloudy"
        case sun = "Sun"
        case rain = "Rain"
    }
    
    static  let imageDict: [WeatherType: String] = [
        .clear: "Sun",
        .clearSky: "Sun",
        .clouds: "Cloudy",
        .mist: "Cloudy",
        .fewClouds: "Cloudy",
        .scatteredClouds: "Cloudy",
        .brokenClouds: "Cloudy",
        .rain: "Rain",
        .thunderstorm: "Rain",
        .unknown: "Sun"
    ]

    struct DayTemp{
        var minOfDay: String
        var maxOfDay: String
        var tempToday: String
       
    }

    func GetDayOfWeek(welcome: WeatherModel) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(welcome.dt))
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR") // Configuração para o Brasil
        formatter.dateFormat = "EEEE" // Mostra o dia da semana por extenso
        let getDayOfWeek = formatter.string(from: date).capitalized
        return getDayOfWeek
    }

    func ConversionDegreesToday(welcome: WeatherModel) ->DayTemp{
        let tempToday = welcome.main.temp - 273.15
        let minOfDay = welcome.main.tempMin - 273.15
        let maxOfDay = welcome.main.tempMax - 273.15
        return DayTemp(
            minOfDay: String(format: "%.1f", minOfDay),
            maxOfDay: String(format: "%.1f", maxOfDay),
            tempToday:String(format: "%.1f", tempToday)
        )
    }
    
}
struct InfoBar{
    var timerBar: String
    var ChangeOfRainBar: Int
    var degreesBar: Int
    var weatherImageBar: Controller.Climate?
}

