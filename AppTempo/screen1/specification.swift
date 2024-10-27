//
//  specification.swift
//  AppTempo
//
//  Created by Thiago Neves on 19/10/24.
//

import Foundation

struct Specifications{
//    var city : States

    var climate: Climate
    var day: DayOfTheWeek
    var humidity:Double
   // var weekDaysInfo: [WeekDaysInfo]
//Today-> First view on xib
    var City : States
    var WeatherToday: Double //Clima hoje
    var DegreesToday: Double   // Graus hOJE
    var DayOfWeek: String // dia da semana
    var MinOfWeek: Double
    var MaxOfWeek: Double
    
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
enum DayOfTheWeek: String{
    case monday = "Monday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    
}






// 1 mostrar tudo da celula, feito
// 2 criar as conexoes e linkar as info feito
// 3 acrescentar a variavel e criar as structs ( array)
// 4 linkar as informacoes novas na tela.
// funcoes assincronas na terca e lidar com var opcionalidades.
// seg ver aula de funcoes assincronas.
