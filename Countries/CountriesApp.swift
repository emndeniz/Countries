//
//  CountriesAppApp.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import SwiftUI

@main
struct CountriesApp: App {
    
    var body: some Scene {
        WindowGroup {
            ListView(viewModel: ListViewModel())
        }
    }
}
