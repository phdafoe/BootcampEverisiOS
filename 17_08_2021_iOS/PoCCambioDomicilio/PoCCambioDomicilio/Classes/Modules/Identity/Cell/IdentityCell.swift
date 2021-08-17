//
//  IdentityCell.swift
//  PoCCambioDomicilio
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/8/21.
//

import UIKit

protocol IdentityCellDelegate: AnyObject {
    func showInfoProfile(_ cell: UITableViewCell, showMoreInfo: Bool)
}

protocol IdentityCellProtocol {
    func configCell(model: IdentityCellModel)
}

class IdentityCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - Variables
    weak var delegate: IdentityCellDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewDataContainer: UIView!
    @IBOutlet weak var imageProfileView: UIImageView!
    @IBOutlet weak var labelGreeting: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelLastNamePlaceholder: UILabel!
    @IBOutlet weak var labelUpdate: UILabel!
    @IBOutlet weak var labelLastName: UILabel!
    @IBOutlet weak var labelIdentityDocPlaceholder: UILabel!
    @IBOutlet weak var labelIdentityData: UILabel!
    @IBOutlet weak var labelValidityPlaceholder: UILabel!
    @IBOutlet weak var labelValidityData: UILabel!
    @IBOutlet weak var labelAddressPlaceholder: UILabel!
    @IBOutlet weak var labelAddressData: UILabel!
    @IBOutlet weak var labelCityPlaceholder: UILabel!
    @IBOutlet weak var labelCityData: UILabel!
   
    // MARK: - Actions
    @IBAction func showMoreInfoProfile(_ sender: Any) {
        self.delegate?.showInfoProfile(self, showMoreInfo: true)
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

extension IdentityCell: IdentityCellProtocol{
    func configCell(model: IdentityCellModel) {
        self.labelGreeting.text = model.greeting
        self.labelName.text = model.name
        self.labelUpdate.text = model.lastUpdate
        self.labelLastNamePlaceholder.text = model.lastNamePlaceholder
        self.labelLastName.text = model.lastNameData
        self.labelIdentityDocPlaceholder.text = model.identityDocPlaceholder
        self.labelIdentityData.text = model.identityData
        self.labelValidityPlaceholder.text = model.validityPlaceholder
        self.labelValidityData.text = model.validityData
        self.labelAddressPlaceholder.text = model.addressPlaceholder
        self.labelAddressData.text = model.addressData
        self.labelCityPlaceholder.text = model.cityPlaceholder
        self.labelCityData.text = model.cityData
        
        if let data = model.photo{
            self.imageProfileView.image = UIImage(data: data)
        } else {
            self.imageProfileView.image = UIImage(named: "ico_identity_face")
        }
        self.imageProfileView.layer.cornerRadius = self.imageProfileView.bounds.width / 2
    }
}

struct IdentityCellModel {
    
    var photo: Data?
    var greeting: String?
    var name: String?
    var lastUpdate: String?
    var lastNamePlaceholder: String?
    var lastNameData: String?
    var identityDocPlaceholder: String?
    var identityData: String?
    var validityPlaceholder: String?
    var validityData: String?
    var addressPlaceholder: String?
    var addressData: String?
    var cityPlaceholder: String?
    var cityData: String?

}
