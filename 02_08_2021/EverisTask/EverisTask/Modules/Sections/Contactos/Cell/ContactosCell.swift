//
//  ContactosCell.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import UIKit

protocol ContactosCellProtocol {
    func ceonfigCell(data: ArrayContact)
}


class ContactosCell: UITableViewCell {
    
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myNombreLBL: UILabel!
    @IBOutlet weak var myApellidoLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.myImagenPerfil.layer.cornerRadius = self.myImagenPerfil.frame.width / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ContactosCell: ContactosCellProtocol {
    internal func ceonfigCell(data: ArrayContact) {
        self.myImagenPerfil.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.myNombreLBL.text = data.firstName
        self.myApellidoLBL.text = data.lastName
    }
}
