//
//  CuponCell.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 9/8/21.
//

import UIKit
import Kingfisher

protocol CuponCellProtocol {
    func configCell(data: CardViewModel)
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
    func configCell(data: CardViewModel) {
        let url = URL(string: data.largeImageUrl ?? "")
        self.myImageCuponView.layer.cornerRadius = 20
        self.myImageCuponView.layer.borderColor = UIColor.gray.cgColor
        self.myImageCuponView.layer.borderWidth = 1
        self.myImageCuponView.kf.setImage(with: url,
                                          placeholder: UIImage(named: "placeholder"),
                                          options: [
                                            .scaleFactor(UIScreen.main.scale),
                                            .transition(.fade(1)),
                                            .cacheOriginalImage
                                          ],
                                          completionHandler: nil)
        self.myTendenciaLBL.text = "Tendencia"
        if !(data.tags?.isEmpty ?? false) {
            self.myTagsBL.text = data.tags?[0].name ?? ""
        }
        self.myDescripcionBL.text = data.highlightsHtml
        self.myPrecioLBL.text = "Desde \(data.priceSummary?.value?.formattedAmount ?? "")"
        self.myPromocionLBL.text =  data.descriptor
    }
}
