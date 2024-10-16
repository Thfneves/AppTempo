//
//  TelaInicio.swift
//  AppTempo
//
//  Created by Thiago Neves on 13/10/24.
//

import UIKit

class HomeScreen: UIViewController{
    
    
    @IBOutlet weak var TableViewCidade: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        // Do any additional setup after loading the view.
    }
    func configTableView(){
        TableViewCidade.delegate = self
        TableViewCidade.dataSource = self
        TableViewCidade.register(UINib(nibName: CidadeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CidadeTableViewCell.identifier)
    }
    
    var city: [Description] = [
        Description(dayOfTheWeek: .monday ,municipality: States.SaoPaulo, temperatureThermal: 28.0, thermalSensation: 2, minimaDay: 20.0, maximaDay: 30.0, humidity: 0.0, sky: Sky.rain),
        Description(dayOfTheWeek: .thursday,municipality: States.RioDeJaneiro, temperatureThermal: 38.0, thermalSensation: 12, minimaDay: 28.0, maximaDay: 10.0, humidity: 0.0, sky: Sky.cloudy),
        Description(dayOfTheWeek: .sunday ,municipality: States.Minas, temperatureThermal: 28.0, thermalSensation: 2, minimaDay: 20.0, maximaDay: 30.0, humidity: 0.0, sky: Sky.sun)
        //  dayoftheweek: . Monday, city: State of Sao Paulo, thermal temperature: 28.0, thermal sensation: 2, minimum day: 20.0, maximum day: 30.0, humidity: 0.0, sky: 0.0),
    ]
}



extension HomeScreen: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        city.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CidadeTableViewCell.identifier, for: indexPath) as? CidadeTableViewCell
        cell?.config(with: city[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
}



