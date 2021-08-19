//
//  CustomMainView.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/8/21.
//

import SwiftUI

struct CustomMainView: View {
    
    @State private var dressSelected = "Dress"
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    
                }, label: {
                    HStack{
                        Text("Casual Dress").font(.headline)
                        Spacer()
                        Image(systemName: "chevron.down").font(.title3)
                    }
                    .padding()
                })
                .foregroundColor(.black)
                
                Button(action: {
                    
                }, label: {
                    HStack{
                        Image(systemName: "slider.horizontal.3").padding()
                    }
                })
                .foregroundColor(.black)
                .contextMenu(ContextMenu(menuItems: {
                    Text("Menu Item 1")
                    Text("Menu Item 2")
                    Text("Menu Item 3")
                }))
            }
            
            HStack{
                ForEach(typesDresses, id: \.self) { item in
                    HStack{
                        Button(action: {
                            self.dressSelected = item
                        }, label: {
                            Text(item).font(.system(size: 8, weight: .semibold, design: .default))
                                .padding()
                        })
                        .foregroundColor(self.dressSelected == item ? .white : .black)
                        .background(self.dressSelected == item ? Color.black : Color.clear)
                        .cornerRadius(10)
                    }
                }
            }
            
            DetailLazyVGridScrollView()
        }
        .padding()
        .background(Color.white)
    }
}

struct DetailLazyVGridScrollView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(customData) { itemCustomData in
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                    ForEach(itemCustomData.myRows) { itemRow in
                        NavigationLink(
                            destination: DetailFashionContentView(model: itemRow),
                            label: {
                                CardCarrousel(model: itemRow)
                            })
                            .buttonStyle(PlainButtonStyle())
                    }
                })
            }
        }
    }
}

struct CardCarrousel: View {
    
    var model: Row
    
    var body: some View {
        VStack(spacing: 20){
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(model.name).font(.headline)
                    Text(model.price).fontWeight(.black)
                }
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image("option").renderingMode(.original).foregroundColor(.black)
                })
                .padding(.trailing, 15)
            }
        }
    }
}

//struct CustomMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomMainView().previewDevice("iPhone 11")
//    }
//}

// MARK: - Models Data
struct CustomType: Identifiable {
    var id: Int
    var myRows: [Row]
}

struct Row: Identifiable {
    var id: Int
    var name: String
    var image: String
    var price: String
}

var customSizes = ["S", "M", "L", "XL"]
var typesDresses = ["Dress", "Pants", "Blazers", "Jackets"]
var customData = [CustomType(
                    id: 0,
                    myRows: [Row(id: 0,
                                 name: "Fit and Flare",
                                 image: "p1",
                                 price: "€199"),
                             Row(id: 1,
                                 name: "Fit and Summer",
                                 image: "p21",
                                 price: "€399"),
                             Row(id: 2,
                                 name: "Empire an Flare",
                                 image: "p12",
                                 price: "€299"),
                             Row(id: 3,
                                 name: "Fit and Vibes",
                                 image: "p22",
                                 price: "€99"),
                             Row(id: 4,
                                 name: "Empire and Vibes",
                                 image: "p1",
                                 price: "€199"),
                             Row(id: 5,
                                 name: "Fit and Empire",
                                 image: "p12",
                                 price: "€399")])]
