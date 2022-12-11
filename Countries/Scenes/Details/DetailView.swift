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
            Text("Fill me!")
        }
        
    }
}





struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(countryName: "germany"))
    }
}
