//
//  MoviesView.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/8/21.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var presenter: MoviesPresenter
    
    var body: some View {
        VStack{
            if !self.presenter.arrayMovies.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                        ForEach(self.presenter.arrayMovies) { itemRow in
                            NavigationLink(
                                destination: Text(itemRow.artistName ?? ""),
                                label: {
                                    CardCarrouselMovies(pModel: MoviesViewModel(
                                                            artworkUrl100: itemRow.artworkUrl100,
                                                            url: itemRow.url,
                                                            name: itemRow.name))
                                }).buttonStyle(PlainButtonStyle())
                            
                        }
                    })
                }
            } else{
                Button(action: {
                    self.presenter.fetchDataFromItunes()
                }, label: {
                    Text("try again")
                })
            }
        }
        .navigationTitle("iTunes Movies")
        .onAppear(perform: {
            self.presenter.fetchDataFromItunes()
        })
    }
}

struct CardCarrouselMovies: View {
    
    var model: MoviesViewModel
    @ObservedObject var loadImageFromData = MoviesPresenter()
    
    
    init(pModel: MoviesViewModel) {
        self.model = pModel
        self.loadImageFromData.getImageFromURL(imageUrl: model.artworkUrl100 ?? "")
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading){
            Image(uiImage: (self.loadImageFromData.data.isEmpty ? UIImage(named: "placeholder") : UIImage(data: self.loadImageFromData.data))!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 270)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top))
                .frame(width: 180, height: 270)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.red, lineWidth: 1)
                )
            Text(model.name ?? "")
                .padding()
                .font(.callout)
                .foregroundColor(Color.white)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(presenter: MoviesPresenter())
    }
}
