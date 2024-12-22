//
//  specification.swift
//  AppTempo
//
//  Created by Thiago Neves on 19/10/24.
//

import Foundation

struct Specifications{
    // var weekDaysInfo: [WeekDaysInfo]
    //Today-> First view on xib
    var city : States
    var weatherToday: String //Clima hoje
    var degreesToday: Double   // Graus hOJE
    var dayOfWeek: String // dia da semana
    var minOfWeek: Double
    var maxOfWeek: Double
    var currentTimestamp: TimeInterval?
    
}

//struct Day1{
//    var daysOfWeek1: DayOfTheWeek
//    var degrees1: Double
//    var min1: Double
//    var max1: Double
//}
//struct Day2{
//    var daysOfWeek2: DayOfTheWeek
//    var degrees2: Double
//    var min2: Double
//    var max2: Double
//
//}
//struct Day3{
//    var daysOfWeek3: DayOfTheWeek
//    var degrees3: Double
//    var min3: Double
//    var max3: Double
//}
//struct Day4{
//    var daysOfWeek4: DayOfTheWeek
//    var degrees4: Double
//    var min4: Double
//    var max4: Double
//}
//struct Day5{
//    var daysOfWeek5: DayOfTheWeek
//    var degrees5: Double
//    var min5: Double
//    var max5: Double
//}
//struct Day6{
//    var daysOfWeek6: DayOfTheWeek
//    var degrees6: Double
//    var min6: Double
//    var max6: Double
//}
//struct Day7{
//    var daysOfWeek7: DayOfTheWeek
//    var degrees7: Double
//    var min7: Double
//    var max7: Double
//}


enum States: String{
    case SaoPaulo = "SaoPaulo"
    case RioDeJaneiro = "Rio de janeiro"
    case Minas = "Minas Gerais"
    case Parana = "Parana"
    case SantaCatarina = "Santa Catarina"
}

enum Climate: String{
    case cloudy = "Cloudy"
    case sun = "Sun"
    case rain = "Rain"
}
//enum DayOfTheWeek: String{
//    case monday = "Monday"
//    case tuesday = "Tuesday"
//    case wednesday = "Wednesday"
//    case thursday = "Thursday"
//    case friday = "Friday"
//    case saturday = "Saturday"
//    case sunday = "Sunday"
//
//}

// bar
struct InfoBar{
    var timerBar: String
    var ChangeOfRainBar: Int
    var degreesBar: Int
    var weatherImageBar: Climate
}
struct Temp{
    var minOfDay: String
    var maxOfDay: String
    var tempToday: String
}

let WeatherTranslate: [String: String] = [
    //    case clearSky =
    //    case fewClouds = "few clouds"
    //    case scatteredClouds = "scattered clouds"
    //    case brokenClouds = "broken clouds"
    //    case rain = "rain"
    //    case thunderstorm = "thunderstorm"
    //    case snow = "snow"
    //    case mist = "mist"
    //
    //    func dictionaryWeather() {
    //            switch self{
    //            case .clearSky:
    //                return "Céu limpo"
    //            case .fewClouds:
    //                return "poucas nuvens"
    //            case .scatteredClouds:
    //                return "nuvens dispersas"
    //            case .brokenClouds:
    //                return "Chuva com nevoa"
    //            case .rain:
    //                return "Chuva"
    //            case .thunderstorm:
    //                return "Tempestade"
    //            case .snow:
    //                return "neve"
    //            case .mist:
    //                return "névoa"
    "clear sky": "Céu limpo",
    "few clouds": "poucas nuvens",
    "scattered clouds": "nuvens dispersas",
    "broken clouds": "Chuva com nevoa",
    "rain": "Chuva",
    "thunderstorm": "Tempestade",
    "snow": "neve",
    "mist": "névoa",
    "clouds": "Nuvens"
]

