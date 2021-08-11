//
//  MapTableViewCell.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 11/8/21.
//

import UIKit
import MapKit

protocol MapTableViewCellProtocol {
    func configCell(model: CardViewModel)
}

class MapTableViewCell: UITableViewCell, ReuseIdentifierView {
    
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MapTableViewCell: MapTableViewCellProtocol {
    
    func configCell(model: CardViewModel) {
        // 1 -> Creamos un piunto en el mapa
        let latitud: CLLocationDegrees = model.division?.lat ?? 0.0
        let longitud: CLLocationDegrees = model.division?.lng ?? 0.0
        // 2 -> Creamos el zoom
        let latDelta: CLLocationDegrees = 0.001
        let longDelta: CLLocationDegrees = 0.001
        // 3 -> unimos la localizacion y el zoom
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        self.myMapView.setRegion(region, animated: false)
        
        // 4 -> Chincheta
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = model.division?.name
        annotation.subtitle = "AQUI ANDRES"
        
        self.myMapView.addAnnotation(annotation)
        
        
    }
}
