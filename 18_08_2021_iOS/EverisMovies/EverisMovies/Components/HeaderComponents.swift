//
//  HeaderComponents.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/8/21.
//

import SwiftUI

struct HeaderComponents: View {
    var body: some View {
        VStack(spacing: 20){
            CustomTitle(title: "Vistas y Modificadores")
            CustomSubtitle(subTitle: "Conceptos básicos")
            CustomDescription(description: "Construir una vista en SwiftUI es muy fácil y lo que hace es basicamente contener subvistas")
        }
    }
}

struct HeaderComponents_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponents()
    }
}

struct CustomTitle: View {
    
    var title: String
    
    var body: some View {
        VStack{
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.black)
                .cornerRadius(10)
        }
    }
}

struct CustomSubtitle: View {
    
    var subTitle: String
    
    var body: some View {
        VStack{
            Text(subTitle)
                .padding(.horizontal, 20)
                .font(.custom("Arial", size: 18))
                .foregroundColor(.gray)
        }
    }
}

struct CustomDescription: View {
    
    var description: String
    
    var body: some View {
        VStack{
            Text(description)
                .padding(20)
                .font(.title)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
        }
    }
}
