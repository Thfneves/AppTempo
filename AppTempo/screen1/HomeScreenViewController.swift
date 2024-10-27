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
        configCollectionView()
        CollectionView.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }
    
    
    func configCollectionView(){
        CollectionView.delegate = self
        CollectionView.dataSource = self
        if let layout = CollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = .zero
        }
        CollectionView.register(CustomCollectionViewCell.nib(), forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }

    var itensList: [Specifications] = [
   //     Specifications ( city: States.SaoPaulo, currentTemperature: 13, thermalSensation: 14, minimumOfTheDay: 44, maximumOfTheDay: 44, climate: Climate.sun,
   //                      day: DayOfTheWeek.sunday, humidity: 34, weekDaysInfo),
    Specifications ( city: States.SaoPaulo, currentTemperature: 13, thermalSensation: 14, minimumOfTheDay: 44, maximumOfTheDay: 44, climate: Climate.cloudy, day: DayOfTheWeek.sunday, humidity: 34 )
//                         day: DayOfTheWeek.sunday, humidity: 34 ),
//        Specifications ( city: States.SaoPaulo, currentTemperature: 13, thermalSensation: 14, minimumOfTheDay: 44, maximumOfTheDay: 44, climate: Climate.rain,
//                         day: DayOfTheWeek.sunday, humidity: 34 )
    ]
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


//  arrumar tela custom
//
//

