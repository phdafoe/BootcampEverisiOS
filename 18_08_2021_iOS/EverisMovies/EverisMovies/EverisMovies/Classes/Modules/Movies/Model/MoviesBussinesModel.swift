//
//  MoviesBussinesModel.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/8/21.
//

import Foundation

struct MoviesBussinesModel {
    let results: [ResultViewModel]?
}

struct ResultViewModel: Identifiable {
    let artistName: String?
    let id: String?
    let name: String?
    let artworkUrl100: String?
    let url: String?
}
