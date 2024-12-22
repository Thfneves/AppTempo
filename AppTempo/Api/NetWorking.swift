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




// MARK: - Clouds
//struct Clouds: Codable {
//    let all: Int
//}      por ser traduzido, pode ser algo importante, nao vou tirar agora

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
        //       case pressure, humidity   caso precise retornar, colocar o codable. do tipo Int
        
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    //   let sunrise, sunset: Int hora do por do sol e nascer do sol
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String   //Grupo de parâmetros climáticos (chuva, neve, nuvens etc.)
    let description: String  //ondições climáticas dentro do grupo. Por favor, encontre mais aqui. Você pode obter a saída em seu idioma. Saiba mais
    let icon: String  //Ícone de identificação do clima
}
// todas as posicoes do array trarao o mesmo resultado " todas as variaveis, porque todo array e uma lista de variaveis do mesmo tipo"

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
                    print(person)
                    
                    
                } catch {
                    print(error)
                    return
                }
            }
        }.resume()
    }

}

