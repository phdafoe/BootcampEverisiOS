//
//  MonthsTableViewCell.swift
//  AppIntroTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/7/21.
//

import UIKit

protocol MonthsTableViewCellProtocol {
    func setupCell(name: String)
}


class MonthsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var nameMonthsLBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MonthsTableViewCell: MonthsTableViewCellProtocol {
    
    internal func setupCell(name: String){
        self.nameMonthsLBL.text = name
    }
    
}
