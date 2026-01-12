//
//  TrendingDealView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 06/01/26.
//

import SwiftUI

struct TrendingDealView: View {
    @State var imgTrendingDeal = ""
    @State var lblBrandName = "Addidas"
    @State var lblBrandText = "Java"
    @State var lblOfferPrice = "783"
    @State var lblPrice = "602"
    @State var lblDiscount = "20"
    
    var contImageHeight: CGFloat = 184
    var contFrameHeight: CGFloat = 252
    var constFrameWidht: CGFloat = UIScreen.main.bounds.width / 2

    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 0) {
                AsyncImage(url: URL(string: imgTrendingDeal)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(
                            width: constFrameWidht,
                            height: contImageHeight
                        )
                        .clipped()
                } placeholder: {
                    Color.gray.opacity(0.1)
                        .frame(
                            width: constFrameWidht,
                            height: contImageHeight
                        )
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text(lblBrandName)
                        .font(.custom("PlayfairDisplay-Regular", size: 16))
                        .foregroundColor(.red)
                    
                    Text(lblBrandText)
                        .font(.custom("Inter", size: 14))
                    
                    HStack(spacing: 6) {
                        Text("$\(lblOfferPrice)")
                            .font(.custom("Inter", size: 14))
                            .foregroundColor(.gray)
                            .strikethrough()
                        
                        Text("$\(lblPrice)")
                            .font(.custom("Inter", size: 14))
                        
                        Text("$\(lblDiscount)")
                            .font(.custom("Inter", size: 14))
                    }
                }
                .padding(10)
                
                Spacer()
            }
            .frame(width: constFrameWidht, height: contFrameHeight)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            
        } .cornerRadius(8)
    }
}


//#Preview {
//    TrendingDealView()
//}
