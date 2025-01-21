//
//  Api.swift
//  AppTempo
//
//  Created by Thiago Neves on 15/11/24.
// https://openweathermap.org/current

import Foundation



struct Welcome: Codable {
    let coord: Coord
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
struct Coord: Codable {
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
    let icon: String  //Ícone de identificação do clima
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

enum ErrorRequest: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorURLRequest(Swift.Error)
    case errorUrl(urlString: String)
    case errorDetail(detail: String)
}

class Service {
    // https://api.openweathermap.org/data/2.5/weather?lat=-23.5317&lon=-46.7899&appid=66ff5a1ed488a4391d2d3a2471d5682a
    
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather?"
    let api = "66ff5a1ed488a4391d2d3a2471d5682a"
    
    var latitude:  String =  "-23.5317"
    var longitude: String =  "-46.7899"
    
    let urlString: String
    init(){
        urlString = "\(baseUrl)lat=\(latitude)&lon=\(longitude)&appid=\(api)"// //
        //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    }
    
    func getExchangeRate(completion: @escaping (Welcome?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            print("A URL nao está no formato correto")
            completion(nil)
            return      }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                
                guard let dataNotNil = data else {
                    print("A API nao retornou nenhum dado")
                    return
                }
                do{
                    let person = try JSONDecoder().decode(Welcome.self, from: dataNotNil )
                    completion(person)
                } catch {
                    return
                }
            }
        }.resume()
    }
}

