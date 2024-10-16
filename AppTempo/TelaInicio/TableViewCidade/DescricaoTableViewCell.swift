//
//  DescricaoTableViewCell.swift
//  AppTempo
//
//  Created by Thiago Neves on 13/10/24.
//

import UIKit



enum DayOfTheWeek: String{    
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    
}

enum Sky: String{
    case rain = "Rain"
    case sun = "Sun"
    case cloudy = "Cloudy"
}

struct Description{
    var dayOfTheWeek: DayOfTheWeek
    var municipality: States
    var temperatureThermal: Double
    var thermalSensation: Double
    var minimaDay:Double
    var maximaDay:Double
    var humidity:Double
    var sky: Sky
    
}
enum States: String{
    case SaoPaulo = "SaoPaulo"
    case RioDeJaneiro = "Rio de janeiro"
    case Minas = "Minas Gerais"
    case Parana = "Parana"
    case SantaCatarina = "Santa Catarina"
    
    
}




