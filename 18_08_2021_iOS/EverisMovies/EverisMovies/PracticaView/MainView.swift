//
//  MainView.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/8/21.
//

import SwiftUI

struct MainView: View {
    
    
    // MARK: - ViewController
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20){
                
                HeaderComponents()
                
                Group{
                    Button(action: {
                        
                    }) {
                        Text("Botón con sombra")
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    
                    Button(action: {
                        
                    }) {
                        Text("Botón con sombra")
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    
                    Button(action: {
                        
                    }) {
                        Text("Botón con sombra")
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    
                    Button(action: {
                        
                    }) {
                        Text("Botón con sombra")
                    }
                    .padding()
                    .font(.title)
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                }
            }
        }
    }
}

struct RefactoringView: View {
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                HeaderComponents()
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 50))
                
                Image("CapturaDos")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(3)
                    .overlay(
                        Text("SwiftUI")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        , alignment: .topTrailing
                    )
                    .blur(radius: 1.0)
            }
            
        }
        
    }
}

struct Shapes: View {
    var body: some View {
        VStack {
            HeaderComponents()
            
            Text("Se puede meter shapes para decorar vistas")
                .padding(12)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(.black)
                )
                .padding(4)
            
            Text("Se puede ajustar el fondo pero NO con un shape")
                .padding(12)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                //.cornerRadius(12)
                .padding(4)
                .shadow(radius: 10)
        }
    }
}

struct HorizontalStackView: View {
    var body: some View {
        
        VStack{
            
            HeaderComponents()
            
            HStack {
                Text("Leading")
                Text("Center")
                Text("Trailing")
            }
            .padding()
            .border(Color.black)
            
            HStack{
                Image(systemName: "1.circle").foregroundColor(.yellow)
                Image(systemName: "2.circle").foregroundColor(.blue)
                Image(systemName: "3.circle").foregroundColor(.red)
            }
            .padding()
            .font(.largeTitle)
            
            HStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 100){
                        Button(action: {
                            // Aqui va la accion
                        }) {
                            Image(systemName: "a.circle.fill").foregroundColor(.red)
                        }
                        Image(systemName: "b.circle.fill").foregroundColor(.red)
                        Image(systemName: "c.circle.fill").foregroundColor(.red)
                        Image(systemName: "d.circle.fill").foregroundColor(.red)
                        Image(systemName: "e.circle.fill").foregroundColor(.red)
                    }
                    .padding(.horizontal, 20)
                    
                }
            }
            .padding(.vertical, 30)
            .font(.largeTitle)
            .background(Color.yellow)
        }
    }
}

struct ZStackView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20){
                Spacer()
                HeaderComponents()
                Spacer()
            }
        }
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        //MainView()//.preferredColorScheme(.dark)
        //RefactoringView()
        //Shapes()
        //HorizontalStackView()
        ZStackView()
    }
}




