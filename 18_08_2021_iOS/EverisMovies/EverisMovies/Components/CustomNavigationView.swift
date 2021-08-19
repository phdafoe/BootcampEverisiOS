//
//  CustomNavigationView.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/8/21.
//

import SwiftUI

struct CustomNavigationView: View {
    var body: some View {
        ZStack{
            Text("Seasons").font(.system(size: 20))
            HStack(spacing: 12){
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                })
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "magnifyingglass")
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "alarm")
                })
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "cart")
                })
                
            }
            .font(.callout)
            .foregroundColor(.black)
        }
        .background(Color.white)
        .padding(.horizontal, 12)
    }
}

//struct CustomNavigationView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomNavigationView()
//    }
//}
