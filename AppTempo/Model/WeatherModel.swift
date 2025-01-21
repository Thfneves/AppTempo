//
//  Api.swift
//  AppTempo
//
//  Created by Thiago Neves on 15/11/24.
// https://openweathermap.org/current

import Foundation



struct WeatherModel: Codable {
    let coord: Coordinates
    let weather: [Weather]
    let base: String
    let main: Main
    //    let clouds: Clouds nebulosidade
    let dt: Int    // hora dos dados
    let sys: Sys
    let timezone, id: Int // mudanca em segundos
    let name: String //nome da cidade
    let cod: Int

}
// MARK: - Coord
struct Coordinates: Codable {
    let lon, lat: Double
}
// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp               //temperatura, unidade padrao
        case feelsLike = "feels_like" // sensacao termica
        case tempMin = "temp_min"     // minima
        case tempMax = "temp_max"    // maxima
    }
}
// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
}
// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: WeatherType
    let description: String
    let icon: String
}

enum WeatherType: String, Codable {
    case clear = "Limpo"
    case clearSky = "Céu limpo"
    case clouds = "Nublado"
    case mist = "Neblina"
    case fewClouds = "Poucas nuvens"
    case scatteredClouds = "Nuvens dispersas"
    case brokenClouds = "Nuvens quebradas"
    case rain = "Chuva"
    case thunderstorm = "Tempestade"
    case unknown // Caso padrão para valores não reconhecidos
    
    init(rawValue: String) {
        switch rawValue.lowercased() {
        case "clear":
            self = .clear
        case "clear sky":
            self = .clearSky
        case "clouds":
            self = .clouds
        case "mist":
            self = .mist
        case "few clouds":
            self = .fewClouds
        case "scattered clouds":
            self = .scatteredClouds
        case "broken clouds":
            self = .brokenClouds
        case "rain":
            self = .rain
        case "thunderstorm":
            self = .thunderstorm
        default:
            self = .unknown
        }
    }
}





