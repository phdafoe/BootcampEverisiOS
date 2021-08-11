//
//  LinkTableViewCell.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 11/8/21.
//

import UIKit

protocol LinkTableViewCellDelegate: AnyObject {
    func sendModelData(_ cell: UITableViewCell, url: String)
}

protocol LinkTableViewCellProtocol {
    func configCell(model: CardViewModel)
}


class LinkTableViewCell: UITableViewCell, ReuseIdentifierView {

    // MARK: - Variables
    var dataUrl: String?
    weak var delegate: LinkTableViewCellDelegate!
    
    // MARK: - Outlets
    @IBOutlet weak var myLinkBTN: UIButton!
    
    // MARK: - Actions
    
    @IBAction func showLinkGrouponACTION(_ sender: Any) {
        if let dataUrlDes = self.dataUrl {
            self.delegate.sendModelData(self, url: dataUrlDes)
        }
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

extension LinkTableViewCell: LinkTableViewCellProtocol {
    func configCell(model: CardViewModel) {
        self.dataUrl = model.dealUrl ?? ""
        self.myLinkBTN.setTitle(model.dealUrl ?? "", for: .normal)
    }
}
