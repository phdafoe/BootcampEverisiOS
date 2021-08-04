//
//  ContactModel.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import Foundation

// MARK: - ContactosModel
struct ContactosModel: Codable {
    let arrayContacts: [ArrayContact]?

    enum CodingKeys: String, CodingKey {
        case arrayContacts = "arrayContacts"
    }
}

// MARK: - ArrayContact
struct ArrayContact: Codable {
    let firstName: String?
    let lastName: String?
    let usernameTwitter: String?
    let createdPost: String?
    let experienciaCV: String?
    let numeroSeguidores: String?
    let abstractoVC: String?
    let descriptionCV: String?
    let imageProfile: String?
    let imagePost: String?
    let telefonoMovil: String?
    let telefonoTrabajo: String?
    let email: String?
    let cuentaLinkedin: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "firstName"
        case lastName = "lastName"
        case usernameTwitter = "usernameTwitter"
        case createdPost = "createdPost"
        case experienciaCV = "experienciaCV"
        case numeroSeguidores = "numeroSeguidores"
        case abstractoVC = "abstractoVC"
        case descriptionCV = "descriptionCV"
        case imageProfile = "imageProfile"
        case imagePost = "imagePost"
        case telefonoMovil = "telefonoMovil"
        case telefonoTrabajo = "telefonoTrabajo"
        case email = "email"
        case cuentaLinkedin = "cuentaLinkedin"
    }
}

extension ContactosModel {
    
    static var stubbedContacts: [ArrayContact]? {
        do {
            let response: ContactosModel? = try Bundle.main.loadAndDecodeJSON(filename: "contacts")
            return response?.arrayContacts ?? []
        } catch {
            
        }
        return nil
    }
}

extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: ".json") else {
            return nil
        }
        let data = try? Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodeModel = try? jsonDecoder.decode(D.self, from: data!)
        return decodeModel
    }
}


















