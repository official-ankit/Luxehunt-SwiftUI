//
//  AllDealsView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 08/01/26.
//

import SwiftUI

struct AllDealsView: View {
    @StateObject var dealViewModel = DealsViewModel()
    var column = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        ZStack{
            LazyVGrid(columns: column, spacing: 5) {
                ForEach(dealViewModel.products,id: \.product.id){ item in
                    TrendingDealView(lblBrandName: item.product.brand,contImageHeight: 280)
                    
                }
            }
        }
            .onAppear{
                dealViewModel.fetchAllDeals(page: 1)
            }
    }
    
}

#Preview {
    AllDealsView()
}
