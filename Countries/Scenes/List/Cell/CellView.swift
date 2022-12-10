//
//  ListCellView.swift
//  Countries
//
//  Created by Emin on 10.12.2022.
//

import SwiftUI

struct CellView: View {
    
    private let viewModel: CellViewModel
    
    
    init(viewModel: CellViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        HStack {
            
            AsyncImage(url: viewModel.imageURL) { image in
                      image
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          
                  } placeholder: {
                      Color.gray
                  }
                  .frame(width: 50, height: 50)
               
            VStack {
                Text(viewModel.name)
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding([.leading, .trailing], 16)
            .padding([.top, .bottom], 12)
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .leading)
       
            

    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(viewModel: CellViewModel(item: nil))
    }
}

