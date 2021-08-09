//
//  CuponCell.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 9/8/21.
//

import UIKit
import Kingfisher

protocol CuponCellProtocol {
    func configCell(data: DataViewModel)
}

class CuponCell: UITableViewCell, ReuseIdentifierView {
    
    
    @IBOutlet weak var myImageCuponView: UIImageView!
    @IBOutlet weak var myTendenciaLBL: UILabel!
    @IBOutlet weak var myTagsBL: UILabel!
    @IBOutlet weak var myDescripcionBL: UILabel!
    @IBOutlet weak var myPrecioLBL: UILabel!
    @IBOutlet weak var myPromocionLBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CuponCell: CuponCellProtocol{
    func configCell(data: DataViewModel) {
        //
    }
}
