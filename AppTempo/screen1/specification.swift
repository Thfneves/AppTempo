//
//  specification.swift
//  AppTempo
//
//  Created by Thiago Neves on 19/10/24.
//

import Foundation

struct Specifications{

    var city : States
    var weatherToday: [String: (String,String)] = WeatherTranslate //Clima hoje
    var degreesToday: Double   // Graus hOJE
    var dayOfWeek: String // dia da semana
    var minOfWeek: Double
    var maxOfWeek: Double
    var currentTimestamp: TimeInterval?
    var dayOfWeekTranslate: String
    
  
    
}

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

let WeatherTranslate: [String: (String, String)] = [
    
    "Clear": ("Céu limpo","Sun"),
    "clear sky": ("Céu limpo","Sun"),
    
    "clouds": ("Nublado","Cloudy"),
    "mist": ("neblina","Cloudy"),
    "few clouds": ("nublado","Cloudy"),
    
    "scattered clouds": ("nublado","Cloudy"),
    "broken clouds": ("Chuva com neblina","Rain"),
    "rain": ("Chuva","Rain"),
    
    "thunderstorm": ("Chuvas fortes","Rain")
   
 
    
]



