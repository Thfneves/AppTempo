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
        Specifications (city: States.SaoPaulo, weatherToday: "Chuvoso", degreesToday: 30, dayOfWeek: .wednesday, minOfWeek: 10, maxOfWeek: 30,
                        
                        day1: .init(daysOfWeek1: .thursday, degrees1: 10, min1: 30, max1: 30),
                        day2: .init(daysOfWeek2: .sunday, degrees2: 11, min2: 20, max2: 25),
                        day3: .init(daysOfWeek3: .saturday, degrees3: 22, min3: 10, max3: 11),
                        day4: .init(daysOfWeek4: .saturday, degrees4: 22, min4: 10, max4: 11),
                        day5: .init(daysOfWeek5: .monday, degrees5: 18, min5: 5, max5: 8),
                        day6: .init(daysOfWeek6: .wednesday, degrees6: 13, min6: 10, max6: 12),
                        day7: .init(daysOfWeek7: .tuesday, degrees7: 14, min7: 50, max7: 53)
                        
                       ),
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



