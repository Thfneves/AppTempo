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
    var dayOfWeek: DayOfTheWeek // dia da semana
    var minOfWeek: Double
    var maxOfWeek: Double
    var day1: Day1
    var day2: Day2
    var day3: Day3
    var day4: Day4
    var day5: Day5
    var day6: Day6
    var day7: Day7
}

struct Day1{
    var daysOfWeek1: DayOfTheWeek
    var degrees1: Double
    var min1: Double
    var max1: Double
    
}
struct Day2{
    var daysOfWeek2: DayOfTheWeek
    var degrees2: Double
    var min2: Double
    var max2: Double
        
}
struct Day3{
    var daysOfWeek3: DayOfTheWeek
    var degrees3: Double
    var min3: Double
    var max3: Double
        
}
struct Day4{
    var daysOfWeek4: DayOfTheWeek
    var degrees4: Double
    var min4: Double
    var max4: Double
        
}
struct Day5{
    var daysOfWeek5: DayOfTheWeek
    var degrees5: Double
    var min5: Double
    var max5: Double
        
}
struct Day6{
    var daysOfWeek6: DayOfTheWeek
    var degrees6: Double
    var min6: Double
    var max6: Double
}
struct Day7{
    var daysOfWeek7: DayOfTheWeek
    var degrees7: Double
    var min7: Double
    var max7: Double
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
