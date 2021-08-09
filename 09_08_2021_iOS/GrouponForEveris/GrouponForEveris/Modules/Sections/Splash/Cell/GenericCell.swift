//
//  GenericCell.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import UIKit

protocol GenericCellProtocol {
    func configCell(data: CardDataViewModel)
}

class GenericCell: UITableViewCell, ReuseIdentifierView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GenericCell: GenericCellProtocol {
    func configCell(data: CardDataViewModel) {
       
    }
}
