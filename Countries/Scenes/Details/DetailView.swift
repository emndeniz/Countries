//
//  ContentView.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import SwiftUI
import MapKit



struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel

    
    var body: some View {
        
        
        content()
            .ignoresSafeArea()
            .onAppear(perform: viewModel.getAPIData)
    }
}


private extension DetailView {
    func content() -> some View {
        if  $viewModel.dataSource.isEmpty {
            return AnyView(loading)
      } else {
          return AnyView(details(model: viewModel.dataSource.first!))
        
      }
    }
    
    var loading: some View {
        Text("Loading...")
        .foregroundColor(.gray)
    }
    
    func details(model:DetailModel) -> some View {
        
        VStack {
            AsyncImage(url: model.flagURL) { image in
                               image
                                   .resizable()
                                   .aspectRatio(contentMode: .fill)
                                   
                               
                           } placeholder: {
                               Color.gray
                           }
                           .frame(height: 240)
                           
            Group {
                Text(model.commonName)
                Text(model.officialName)
                Text(model.capital)
                Text(model.area)
                Text(model.population)
                Text(model.region)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing], 16)
                        .padding([.top, .bottom], 12)
            
            Map(coordinateRegion: $viewModel.dataSource.first!.location)
                .padding([.leading, .trailing, .top], 16)
                .padding([.bottom], 24)
            
        }
        
    }
}





struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(countryName: "germany"))
    }
}
