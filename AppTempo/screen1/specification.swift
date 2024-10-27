//
//  specification.swift
//  AppTempo
//
//  Created by Thiago Neves on 19/10/24.
//

import Foundation

struct Specifications{
    var city : States
    var currentTemperature: Double
    var thermalSensation: Double
    var minimumOfTheDay: Double
    var maximumOfTheDay: Double
    var climate: Climate
    var day: DayOfTheWeek
    var humidity:Double
   // var weekDaysInfo: [WeekDaysInfo]
    
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

// Criar enum para city e tem outro, preciso conferir com o gabriel.
// Fazer POO usando struct, enum  para o array.
// 1 mostrar tudo da celula,
// 2 criar as conexoes e linkar as info
// 3 acrescentar a variavel e criar as structs ( array)
// 4 linkar as informacoes novas na tela.
// funcoes assincronas na terca e lidar com var opcionalidades.
// seg ver aula de funcoes assincronas.
