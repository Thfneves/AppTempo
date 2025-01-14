//
//  screen1ViewController.swift
//  AppTempo
//
//  Created by Thiago Neves on 19/10/24.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiRun()
        configCollectionView()
        collectionView.backgroundColor = UIColor.clear
    }
    
    private var service = Service()
    
    func configCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        collectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
    
    func ApiRun() {
        service.getExchangeRate { [weak self] (resultado) in
            DispatchQueue.main.async {
                if let resultadoDesempacotado = resultado {
                    self?.itensList = [resultadoDesempacotado]
                    self?.collectionView.reloadData()
                } else {
                    Swift.print("Erro: resultado retornou nil")
                }
            }
        }
    }
    
    var itensList: [Welcome] = []
    
}

extension HomeScreenViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itensList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        cell?.setupCell (with: itensList[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
