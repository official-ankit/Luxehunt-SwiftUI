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
    @State var lblBrandText = "Java "
    @State var lblOfferPrice = "783 "
    @State var lblPrice = "602 "
    @State var lblDiscount = "20 "
    @State var contImageHeight = 184
    @State var contFrameHeight = 272
    @State var constFrameWidht = UIScreen.main.bounds.width / 2
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.red
            VStack(alignment: .leading, spacing: 0){
                AsyncImage(
                    url: URL(string: imgTrendingDeal),
                    content: { image in
                        image
                            .resizable()
                            .frame(height: CGFloat(contImageHeight))
                    },
                    placeholder: {
                        
                    }
                ).padding(.top, 0)
                VStack(alignment:.leading){
                    Text(lblBrandName)
                        .font(.custom("PlayfairDisplay-Black", size: 20))
                        .foregroundColor(.red)
                         
                    Text(lblBrandText)
                        .font(.custom("PlayfairDisplay-Black", size: 15))
                         
                    HStack(spacing: 5){
                        Text(lblOfferPrice)
                            .font(.custom("PlayfairDisplay-Black", size: 12))
                            .foregroundColor(.gray)
                        Text(lblPrice)
                            .font(.custom("PlayfairDisplay-Black", size: 12))
                        Text(lblDiscount)
                            .font(.custom("PlayfairDisplay-Black", size: 12))
                        
                    }
                 Spacer()
                }.padding(.horizontal,10)
            }.padding(.top,0)
//                .padding(.bottom, 10)
                
        }.frame(width: CGFloat(constFrameWidht), height: CGFloat(contFrameHeight))
        
        .cornerRadius(16)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 1)
            }.shadow(radius: 4)
            
           
    }
}

//#Preview {
//    TrendingDealView()
//}
