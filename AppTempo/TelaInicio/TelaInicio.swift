//
//  TelaInicio.swift
//  AppTempo
//
//  Created by Thiago Neves on 13/10/24.
//

import UIKit

class TelaInicio: UIViewController{

    
    @IBOutlet weak var TableViewCidade: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        // Do any additional setup after loading the view.
    }
    func configTableView(){
                TableViewCidade.delegate = self
                TableViewCidade.dataSource = self
                TableViewCidade.register(UINib(nibName: "CidadeTableViewCell", bundle: nil), forCellReuseIdentifier: "CidadeTableViewCell")
    }
    
        var cidade: [descricao] = [
    descricao(diaSemana:"Segunda",municipio: "São Paulo", temperaturaTermica: 28.0, sensacaoTermica: 2, minimaDia: 20.0, maximaDia: 30.0, humidade: 0.0, ceu: 0.0),
    descricao(diaSemana:"terca",municipio: "Rio de Janeiro", temperaturaTermica: 38.0, sensacaoTermica: 12, minimaDia: 28.0, maximaDia: 10.0, humidade: 0.0, ceu: 0.0),
    descricao(diaSemana:"quarta",municipio: "Curitiba", temperaturaTermica: 28.0, sensacaoTermica: 2, minimaDia: 20.0, maximaDia: 30.0, humidade: 0.0, ceu: 0.0),
    descricao(diaSemana:"quinta",municipio: "Bahia", temperaturaTermica: 48.0, sensacaoTermica: 2, minimaDia: 30.0, maximaDia: 80.0, humidade: 0.0, ceu: 0.0),
        ]
}
    

extension TelaInicio: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cidade.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: CidadeTableViewCell.identifier, for: indexPath) as? CidadeTableViewCell
       // cell?.config(cidade:config [indexPath.row])
                return cell ?? UITableViewCell()
    }
    
}
    
    

