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
        VStack {
            
            if let viewModel = viewModel.dataSource {
                content
            }else {
                Text("Loading...")
            }
           
        }.ignoresSafeArea()
    }
}


private extension DetailView {
    var content : some View {
        Text("Fill it")
    }
}





struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(countryName: "germany"))
    }
}
