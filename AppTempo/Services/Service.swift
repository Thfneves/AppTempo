//
//  Service.swift
//  AppTempo
//
//  Created by Thiago Neves on 21/01/25.
//
import Foundation

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
    
    func getExchangeRate(completion: @escaping (WeatherModel?) -> Void) {
        
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
                    let person = try JSONDecoder().decode(WeatherModel.self, from: dataNotNil )
                    completion(person)
                } catch {
                    return
                }
            }
        }.resume()
    }
}
