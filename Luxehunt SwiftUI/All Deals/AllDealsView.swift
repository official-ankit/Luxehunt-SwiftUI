//
//  AllDealsView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 08/01/26.
//

import SwiftUI

struct AllDealsView: View {

    @StateObject var dealViewModel = DealsViewModel()

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack{
            VStack{
                Color.white.frame(height:1)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(dealViewModel.products, id: \.id) { item in
                            TrendingDealView(
                                imgTrendingDeal: item.image,
                                lblBrandName: item.brand,
                                contImageHeight: 280,
                                contFrameHeight: 352
                            )
                            .onAppear {
                                if item.id == dealViewModel.products.last?.id {
                                    dealViewModel.fetchDealList()
                                }
                            }
                        }
                        if dealViewModel.isLoading {
                            ProgressView()
                                .padding()
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(.horizontal, 4)
                }
                .onAppear {
                    dealViewModel.fetchDealList()
                }
            }
        }//.ignoresSafeArea()
    }
}


//#Preview {
//    AllDealsView()
//}
