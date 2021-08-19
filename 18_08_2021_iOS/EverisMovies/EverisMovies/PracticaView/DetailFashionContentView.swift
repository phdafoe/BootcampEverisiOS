//
//  DetailFashionContentView.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/8/21.
//

import SwiftUI

struct DetailFashionContentView: View {
    
    @SwiftUI.Environment(\.presentationMode) var presentMode
    @State private var mySize = ""
    
    var model: Row
    
    var body: some View {
        ScrollView {
            VStack {
                headerInformation
                footerInformation
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var headerInformation: some View {
        ZStack(alignment: .topLeading) {
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.size.width, height: 400)
            
            
            HStack{
                GeometryReader { geometry in
                    
                    Button(action: {
                        self.presentMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white.opacity(0.7))
                    .clipShape(Circle())
                    .offset(x: 20, y: 20)
                    
                    Button(action: {
                        // Aqui se hace la action
                    }) {
                        Image(systemName: "magnifyingglass").foregroundColor(.black)
                    }
                    .offset(x: geometry.size.width - 80, y: 20)
                    
                    Button(action: {
                        // Aqui se hace la action
                    }) {
                        Image(systemName: "cart").foregroundColor(.black)
                    }
                    .offset(x: geometry.size.width - 40, y: 20)
                }
            }
        }
    }
    
    private var footerInformation: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                VStack{
                    Text(model.name).font(.largeTitle)
                    Text(model.price).fontWeight(.heavy)
                }
                Spacer()
                HStack(spacing: 10){
                    Circle().fill(Color.red).frame(width: 20, height: 20)
                    Circle().fill(Color.green).frame(width: 20, height: 20)
                    Circle().fill(Color.blue).frame(width: 20, height: 20)
                }
            }
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .font(.subheadline)
            
            Text("Select Size")
            
            HStack{
                ForEach(customSizes, id: \.self) { item in
                    Button(action: {
                        self.mySize = item
                    }, label: {
                        Text(item)
                            .padding()
                            .border(Color.black, width: self.mySize == item ? 1.5 : 0)
                    })
                    .foregroundColor(.black)
                }
            }
            
            HStack{
                Button(action: {
                    self.presentMode.wrappedValue.dismiss()
                }, label: {
                    Text("Add to Cart").padding().border(Color.black, width: 1.5)
                })
                .foregroundColor(.black)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Buy Now").padding()
                })
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(10)
                
            }
            .padding([.leading, .trailing, .top], 20)
            
        }
        .padding()
        .background(
            roundedShape()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0.0, y: -50)
        )
        .padding(.top, -280)
    }
}


struct roundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
