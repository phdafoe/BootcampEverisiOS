//
//  Constants.swift
//  iCoCambioDomicilio
//
//  Created by Andres Felipe Ocampo Eljaiek on 12/8/21.
//

import Foundation

struct Constants {
    
    static let jsonMIMEtype = "application/json"
    static let userTokenHeader = "userToken"
    static let contentTypeHeader = "Content-Type"
    static let dateFormat = "yyyy-MM-dd"
    static let presentationDateFormat = "dd/MM/yyyy"
    
    struct URL {
 
        static let loginLegalConditions = "https://pre-carpetaciudadana.redsara.es/carpeta/info/condicionesLegales.htm"
        static let termisAndConditionsMoreInfo = "https://pre-carpetaciudadana.redsara.es/carpeta/info/politicaPrivacidad.htm"
        static let settingsLegalConditions = "https://pre-carpetaciudadana.redsara.es/carpeta/info/condicionesLegales.htm"
        static let settingsTermsAndConditions = "https://pre-carpetaciudadana.redsara.es/carpeta/info/politicaPrivacidad.htm"
        static let whatIsClaveMoreInfo = "https://clave.gob.es/clave_Home/clave/queEs.html"
        
        static let baseUrl = "https://w9x3sqbas6.execute-api.eu-west-1.amazonaws.com/api/"
        static var getIdentity = "dgp/consulta-identidad?tipoDocumento=NIF&identificador=99999999R&nombre=JUAN&apellido1=MENDILUCE&apellido2=MENDILUCE"
        static var getAddress = "ine/consulta-residencia-fecha?tipoDocumento=DNI&identificador=99999999R&nombre=JUAN&apellido1=MENDILUCE&apellido2=MENDILUCE"
        
    }
        
}
