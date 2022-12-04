//
//  ContentView.swift
//  CountriesApp
//
//  Created by Emin on 5.12.2022.
//

import SwiftUI

struct CountriesListView: View {
    var body: some View {
        VStack {
            Image(systemName: "photo.circle")
                .frame(width: 300, height: 300)
                .foregroundColor(.red)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
