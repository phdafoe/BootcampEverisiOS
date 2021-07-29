//
//  PerfilTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/7/21.
//

import UIKit


protocol PerfilTableViewCellProtocol {
    func configCell(model: PerfilModel)
}

class PerfilTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var myImageViewPerfil: UIImageView!
    @IBOutlet weak var myUsruarioTwitterLBL: UILabel!
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myPuestoTrabajoLBL: UILabel!
    @IBOutlet weak var myLugarDondeVivoLBL: UILabel!
    @IBOutlet weak var myNumeroSeguidoresBL: UILabel!
    
    
    // MARK: - Actions
    @IBAction func enviaMail(_ sender: Any) {
        
    }
    
    @IBAction func compartirInfo(_ sender: Any) {
        
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PerfilTableViewCell: PerfilTableViewCellProtocol {
    
    internal func configCell(model:PerfilModel) {
        self.myImageViewPerfil.image = model.imagePerfil
        self.myUsruarioTwitterLBL.text = model.perfilTwitter
        self.myNombreLBL.text = model.nombre
        self.myPuestoTrabajoLBL.text = model.puestoTrabajo
        self.myLugarDondeVivoLBL.text = model.lugarVivo
        self.myNumeroSeguidoresBL.text = "Seguidores \(model.numeroSeguidores ?? 0)"
    }
}
