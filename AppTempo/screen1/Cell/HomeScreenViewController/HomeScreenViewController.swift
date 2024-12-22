//
//  screen1ViewController.swift
//  AppTempo
//
//  Created by Thiago Neves on 19/10/24.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiRun()
        configCollectionView()
        CollectionView.backgroundColor = UIColor.clear
        
        // Do any additional setup after loading the view.
    }
    private var service = Service()
    
    func configCollectionView(){
        CollectionView.delegate = self
        CollectionView.dataSource = self
        if let layout = CollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        CollectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
    
    
    func ApiRun() {
        service.getExchangeRate { [weak self] (resultado) in
            DispatchQueue.main.async {
                if let resultadoDesempacotado = resultado {
                    self?.itensList = [resultadoDesempacotado] // Adiciona ao array
                    self?.CollectionView.reloadData()
                } else {
                    Swift.print("Erro: resultado retornou nil")
                }
            }
        }
    }
    var itensList: [Welcome] = []
    
    
    func getDayOfWeek(from welcome: Welcome) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(welcome.dt)) // Converte timestamp para Date
        
        // Configurando o DateFormatter para obter apenas o dia da semana
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR") // Configuração para o Brasil
        formatter.dateFormat = "EEEE" // Formato para exibir o dia da semana completo
        
        let dayOfWeek = formatter.string(from: date) // Gera o dia da semana
        return dayOfWeek.capitalized // Deixa a primeira letra maiúscula
    }
  


}

extension HomeScreenViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itensList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        cell?.setupCell (with: itensList[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
