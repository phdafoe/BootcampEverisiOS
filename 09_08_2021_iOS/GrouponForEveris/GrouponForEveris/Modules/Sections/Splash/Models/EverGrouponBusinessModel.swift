//
//  EverGrouponBusinessModel.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import Foundation

struct EverGrouponBusinessModel: Decodable {
    
    let cards: [CardBusinessModel]?
    
    init(cards: [CardBusinessModel]) {
        self.cards = cards
    }
    
}

struct CardBusinessModel: Decodable{
    let data: CardDataViewModel?
    
    init(data: CardDataViewModel){
        self.data = data
    }
    
}


struct CardDataViewModel: Decodable {
    let isAutoRefundEnabled: Bool?
    
    init(isAutoRefundEnabled: Bool) {
        self.isAutoRefundEnabled = isAutoRefundEnabled
    }
    
}
