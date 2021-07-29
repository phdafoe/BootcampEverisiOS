//
//  PostTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/7/21.
//

import UIKit

protocol PostTableViewCellProtocol {
    func configCell(model: PostModel)
}


class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myMensajePostLBL: UILabel!
    @IBOutlet weak var myImagenPost: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PostTableViewCell: PostTableViewCellProtocol {
    
    internal func configCell(model: PostModel) {
        self.myMensajePostLBL.text = model.mensajePosteo
        self.myImagenPost.image = model.imagenPost
    }
}
