//
//  TempByHour.swift
//  AppTempo
//
//  Created by Thiago Neves on 21/01/25.
//

// Foi criada uma funcao de simulacao da temperatura por hora ja que a API utilizada nao dispnibiliza essas informacoes no plano gratuito.

struct TempByHour {
    var timerBar: String
    var chanceOfRainBar: Int
    var degreesBar: Int
    var weatherImageBar: ClimateIcon?
}



struct TempTroughDay {
    var hours: [TempByHour]
    
    init(minTempToday: Double, maxTempToday: Double) {
        self.hours = []
        
        let peakHour = 15 // Hora de pico da temperatura
        let maxRainHours = 5 // Máximo de horas consecutivas de chuva
        
        // Determina aleatoriamente a quantidade de horas de chuva (0 a 5)
        let rainDuration = Int.random(in: 1...maxRainHours)
        
        // Determina aleatoriamente o horário de início da chuva
        let rainStartHour = rainDuration > 0 ? Int.random(in: 0...(24 - rainDuration)) : nil
        
        for i in 0...23 {
            var degrees: Int
            
            // Calcula a temperatura baseada no horário do dia
            if i <= peakHour {
                let progress = Double(i) / Double(peakHour)
                degrees = Int(minTempToday + (progress * (maxTempToday - minTempToday)))
            } else {
                let remainingHours = 24 - peakHour
                let progress = Double(i - peakHour) / Double(remainingHours)
                degrees = Int(maxTempToday - (progress * (maxTempToday - minTempToday)))
            }
            
            // Determina a chance de chuva
            var chanceOfRain: Int = 0
            if let rainStart = rainStartHour, i >= rainStart && i < rainStart + rainDuration {
                // Durante o período de chuva, chance aleatória entre 50% e 90%
                chanceOfRain = Int.random(in: 50...90)
            }
            
            // Define o tipo de clima (exemplo: nublado ou chuvoso)
            let weatherImage: ClimateIcon? = chanceOfRain > 0 ? .rain : .cloudy
            
            // Adiciona os dados ao array de horas
            hours.append(
                TempByHour(
                    timerBar: "\(i)h",
                    chanceOfRainBar: chanceOfRain,
                    degreesBar: degrees,
                    weatherImageBar: weatherImage
                )
            )
        }
    }
}
