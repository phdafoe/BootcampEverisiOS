//
//  DescriptorTableViewCell.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 11/8/21.
//

import UIKit

protocol DescriptorTableViewCellProtocol {
    func configCell(model: CardViewModel)
}


class DescriptorTableViewCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - Outlets
    @IBOutlet weak var myDescriptorLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension DescriptorTableViewCell: DescriptorTableViewCellProtocol {
    
    func configCell(model: CardViewModel) {
        self.myDescriptorLBL.text = model.finePrint
    }
}
