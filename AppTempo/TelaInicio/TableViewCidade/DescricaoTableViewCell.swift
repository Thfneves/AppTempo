//
//  DescricaoTableViewCell.swift
//  AppTempo
//
//  Created by Thiago Neves on 13/10/24.
//

import UIKit



enum diasSemana: String{
    case segunda = "Segunda-feira"
     case terca = "Terça-feira"
     case quarta = "Quarta-feira"
     case quinta = "Quinta-feira"
     case sexta = "Sexta-feira"
     case sabado = "Sábado"
     case domingo = "Domingo"
    
}
struct descricao{
    var diaSemana: diasSemana
    var municipio: String
    var temperaturaTermica: Double
    var sensacaoTermica: Double
    var minimaDia:Double
    var maximaDia:Double
    var humidade:Double
    var ceu:  Double
}



