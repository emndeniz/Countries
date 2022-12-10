//
//  CountiresListView.swift
//  Countries
//
//  Created by Emin on 5.12.2022.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationView {
            content()
            .navigationTitle("Countries")
        }
        .onAppear(perform: viewModel.getAPIData)

    }
}


private extension ListView {
    func content() -> some View {
        if  $viewModel.dataSource.isEmpty {
            return AnyView(loading)
      } else {
          return AnyView(list)
        
      }
    }
    
    var list: some View {
        List{
            ForEach(viewModel.dataSource){ item in
                NavigationLink {
                    DetailView(viewModel: DetailViewModel(countryName: item.name))
                } label: {
                    CellView(viewModel: item)
                }
            }
        }
    }
    
    
    var loading: some View {
        Text("Loading...")
        .foregroundColor(.gray)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: ListViewModel())
    }
}
