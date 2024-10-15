//
//  CidadeTableViewCell.swift
//  AppTempo
//
//  Created by Thiago Neves on 13/10/24.
//

import UIKit

class CidadeTableViewCell: UITableViewCell {

    @IBOutlet weak var CorDoCeu: UILabel!
    @IBOutlet weak var Temperatura: UILabel!
    @IBOutlet weak var Cidade: UILabel!
    @IBOutlet weak var DiaSemana: UILabel!
    @IBOutlet weak var Humidade: UILabel!
    @IBOutlet weak var MinimaMaxima: UILabel!
    @IBOutlet weak var SensacaoTermica: UILabel!
    
    @IBOutlet weak var ViewImag: UIView!
    static let identifier: String = "CidadeTableViewCell"
    
    static func nib()-> UINib{
        return UINib(nibName: "CidadeTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code'
        
        
    }
        func config(with descricao: descricao){
        CorDoCeu.text = descricao.municipio
        Temperatura.text = String(descricao.temperaturaTermica)
        Cidade.text = descricao.municipio
        DiaSemana.text = descricao.diaSemana.rawValue
        Humidade.text = String(descricao.humidade)
        MinimaMaxima.text = String(descricao.minimaDia)
        }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
