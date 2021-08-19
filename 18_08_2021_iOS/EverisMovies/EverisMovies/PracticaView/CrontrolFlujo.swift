//
//  CrontrolFlujo.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/8/21.
//

import SwiftUI

struct CrontrolFlujo: View {
    
    @State private var showActionSheet = false
    @State private var showAlert = false
    @State private var showCustomPopup = false
    
    @State private var showNexView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 20) {
                        HeaderComponents()
                        Divider()
                        
                        NavigationLink(
                            destination: MainView(),
                            isActive: self.$showNexView,
                            label: {
                                Button(action: {
                                    self.showActionSheet.toggle()
                                }) {
                                    HStack{
                                        Image(systemName: "play")
                                        Text("Muestra un ActionSheet")
                                    }
                                    .font(.title)
                                    .foregroundColor(.black)
                                }.actionSheet(isPresented: self.$showActionSheet, content: {
                                    ActionSheet(title: Text("Action Sheet"),
                                                message: Text("Esta es una hoja de acciones"),
                                                buttons: [.default(Text("Botón 1"), action: {
                                                    // Esta es la accion del Boton 1
                                                    self.showNexView.toggle()
                                                }), .default(Text("Botón 2"), action: {
                                                    // Esta es la accion del Boton 2
                                                }), .cancel({
                                                    // Esta es la accion del Cancelar
                                                })])
                                })
                            })

                        CustomButtonView(showAlert: self.$showAlert)
                            .alert(isPresented: self.$showAlert, content: {
                                Alert(title: Text("olaaa"),
                                      message: Text("Aqui tenemos un AlertView"),
                                      primaryButton: .default(Text("OK"), action: {
                                        // Esta es la accion del OK
                                      }),
                                      secondaryButton: .cancel({
                                        // Esta es la accion del Cancel
                                      }))
                            })
                        
                        Button(action: {
                            self.showCustomPopup.toggle()
                        }) {
                            HStack{
                                Image(systemName: "play")
                                Text("Muestra un CustomPopup")
                            }
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.green)
                        }
                        
                    }
                }
                .blur(radius: self.showCustomPopup ? 10 : 0)
                
                if showCustomPopup{
                    CustomPopupView(title: "CustomPopup",
                                    message: "Este es un custom Popup que se pintará encima de la vista padre y hara un efecto blur y pondrá el fondo medio opaco, Este es un custom Popup que se pintará encima de la vista padre y hara un efecto blur y pondrá el fondo medio opaco, Este es un custom Popup que se pintará encima de la vista padre y hara un efecto blur.",
                                    hideCustomPopup: self.$showCustomPopup)
                }
                
            }.navigationBarHidden(true)
        }
    }
}

struct CustomButtonView: View {
    
    @Binding var showAlert: Bool
    
    var body: some View {
        
        Button(action: {
            self.showAlert.toggle()
        }) {
            HStack{
                Image(systemName: "play")
                Text("Muestra un ActionSheet")
            }
            .font(.title)
            .foregroundColor(.black)
        }
        .padding()
        .background(Color.orange)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct CustomPopupView: View {
    
    var title: String
    var message: String
    @Binding var hideCustomPopup: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
            VStack(spacing: 20){
                HStack{
                    Spacer()
                    Text(title)
                        .bold()
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        
                    Spacer()
                    Button(action: {
                        self.hideCustomPopup = false
                    }) {
                        Image(systemName: "xmark")
                    }
                }
                
                Divider()
                Text(message)
                    .font(.custom("Arial", size: 14))
                
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.70)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(radius: 10)
        }

    }
}

struct CrontrolFlujo_Previews: PreviewProvider {
    static var previews: some View {
        CrontrolFlujo()
        /*CustomPopupView(title: "CustomPopup",
                        message: "Este es un custom Popup que se pintará encima de la vista padre y hara un efecto blur y pondrá el fondo medio opaco, Este es un custom Popup que se pintará encima de la vista padre y hara un efecto blur y pondrá el fondo medio opaco, Este es un custom Popup que se pintará encima de la vista padre y hara un efecto blur.",
                        hideCustomPopup: .constant(true))*/
    }
}
