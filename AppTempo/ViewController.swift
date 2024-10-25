//
//  ViewController.swift
//  AppTempo
//
//  Created by Thiago Neves on 19/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func HomeButton(_ sender: UIButton) {
        let vc: HomeScreenViewController? = UIStoryboard(name: "HomeScreenViewController", bundle:
        nil).instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController
        vc?.modalPresentationStyle = .fullScreen
        present(vc ?? UIViewController(), animated: true)
    }
    
}

// teste

