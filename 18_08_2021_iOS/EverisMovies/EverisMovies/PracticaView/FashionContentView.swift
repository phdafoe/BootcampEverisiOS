//
//  FashionContentView.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/8/21.
//

import SwiftUI

struct FashionContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                CustomNavigationView()
                CustomMainView()
            }.navigationBarHidden(true)
        }
    }
}

struct FashionContentView_Previews: PreviewProvider {
    static var previews: some View {
        FashionContentView()//.previewDevice("iPhone 11 Pro")
    }
}
