//
//  Controller.swift
//  AppTempo
//
//  Created by Thiago Neves on 25/12/24.
//

import Foundation
struct Controller{
    
    
    func GetDayOfWeek(welcome: Welcome) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(welcome.dt))
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR") // Configuração para o Brasil
        formatter.dateFormat = "EEEE" // Mostra o dia da semana por extenso
        let getDayOfWeek = formatter.string(from: date).capitalized
        return getDayOfWeek
    }
    func translateWeather(_ weatherCondition: String)-> String {
      
        if let translatedCondition = WeatherTranslate[weatherCondition.lowercased()] {
            return translatedCondition.0
        } else {
            return "Tradução não encontrada"
        }
        
    }
    
    func weatherIcon(_ weatherCondition: String)-> String {
        
        if let translatedCondition = WeatherTranslate[weatherCondition.lowercased()] {
            return translatedCondition.1
        } else {
            return ""
        }
    }
    
    
    func ConversionDegreesToday(welcome: Welcome) ->Temp{
        let tempToday = welcome.main.temp - 273.15
        let minOfDay = welcome.main.tempMin - 273.15
        let maxOfDay = welcome.main.tempMax - 273.15
        return Temp(
            minOfDay: String(format: "%.1f", minOfDay),
            maxOfDay: String(format: "%.1f", maxOfDay),
            tempToday:String(format: "%.1f", tempToday)
            )
    }
    
   
    
}
