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
   
    @IBAction func ButtonCadastro(_ sender: UIButton) {
        
        let vc: TelaCadastro? = UIStoryboard(name: "TelaCadastro", bundle: nil).instantiateViewController(withIdentifier: "TelaCadastro") as? TelaCadastro
                vc?.modalPresentationStyle = .formSheet
                present( vc ??  UIViewController(), animated: true)
    }
    
    @IBAction func TelaInicio(_ sender: UIButton) {
        let vc: TelaInicio? = UIStoryboard(name: "TelaInicio", bundle: nil).instantiateViewController(withIdentifier: "TelaInicio") as? TelaInicio
        vc?.modalPresentationStyle = .fullScreen
                present( vc ??  UIViewController(), animated: true)
        
        
        
        
    }
}


