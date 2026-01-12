//
//  TrendingDealShimmerView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct TrendingDealShimmerView: View {
    // Parameters to handle different screen sizes
    var width: CGFloat
    var imageHeight: CGFloat
    var totalHeight: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image Placeholder
            ShimmerEffectView()
                .frame(width: width, height: imageHeight)
                .clipped()
            
            VStack(alignment: .leading, spacing: 8) {
                // Brand Name (Red text replacement)
                ShimmerEffectView()
                    .frame(width: width * 0.4, height: 16)
                    .cornerRadius(4)
                
                // Brand Description
                ShimmerEffectView()
                    .frame(width: width * 0.7, height: 14)
                    .cornerRadius(4)
                
                // Price Row (Offer Price, Price, Discount)
                HStack(spacing: 8) {
                    ShimmerEffectView().frame(width: 35, height: 14).cornerRadius(4)
                    ShimmerEffectView().frame(width: 35, height: 14).cornerRadius(4)
                    ShimmerEffectView().frame(width: 25, height: 14).cornerRadius(4)
                }
            }
            .padding(10)
            
            Spacer()
        }
        .frame(width: width, height: totalHeight)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.15), lineWidth: 1)
        )
    }
}
