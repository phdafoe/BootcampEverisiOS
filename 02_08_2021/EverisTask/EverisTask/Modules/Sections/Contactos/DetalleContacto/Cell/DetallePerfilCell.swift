//
//  DetallePerfilCell.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/8/21.
//

import UIKit

protocol DetallePerfilCellProtocol {
    func configCell(model: ArrayContact)
}


class DetallePerfilCell: UITableViewCell {
    
    @IBOutlet weak var myIMagenPerfil: UIImageView!
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoBL: UILabel!
    @IBOutlet weak var myEmailLBL: UILabel!
    @IBOutlet weak var myLinkedInLBL: UILabel!
    @IBOutlet weak var myDescripcionBL: UILabel!
    @IBOutlet weak var myExperienciaBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupView() {
        self.myIMagenPerfil.layer.cornerRadius = self.myIMagenPerfil.frame.width / 2
        self.myIMagenPerfil.layer.borderWidth = 1
        self.myIMagenPerfil.layer.borderColor = UIColor.white.cgColor
    }
    
}

extension DetallePerfilCell: DetallePerfilCellProtocol{
    func configCell(model: ArrayContact){
        self.myIMagenPerfil.image = UIImage(named: model.imageProfile ?? "placeholder")
        self.myNombreLBL.text = model.firstName
        self.myApellidoBL.text = model.lastName
        self.myEmailLBL.text = model.email
        self.myLinkedInLBL.text = model.cuentaLinkedin
        self.myDescripcionBL.text = model.descriptionCV
        self.myExperienciaBL.text = model.experienciaCV
    }
}
