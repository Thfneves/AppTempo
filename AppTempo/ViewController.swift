//
//  ViewController.swift
//  AppTempo
//
//  Created by Thiago Neves on 12/10/24.
//

import UIKit
import AVKit
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func HomeScreen(_ sender: UIButton) {
        let vc: HomeScreen? = UIStoryboard(name: "HomeScreen", bundle: nil).instantiateViewController(withIdentifier: "HomeScreen") as? HomeScreen
        vc?.modalPresentationStyle = .fullScreen
        present( vc ??  UIViewController(), animated: true)
        
    }
}


