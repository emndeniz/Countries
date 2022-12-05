//
//  ContentView.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import SwiftUI
import MapKit

struct CountryDetailView: View {
    
    @ObservedObject var viewModel: DetailViewModel
    


    var body: some View {
        VStack {

            Text("Hi")
          
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(viewModel: DetailViewModel())
    }
}
