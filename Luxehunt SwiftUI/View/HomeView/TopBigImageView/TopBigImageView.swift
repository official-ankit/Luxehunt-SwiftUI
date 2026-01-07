//
//  TopBigImageView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI


    struct TopBigImageView: View {
        
        let images = ["BigBanner", "BigBanner", "BigBanner", "BigBanner"]
        
        var body: some View {
            TabView {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 490)
                        .clipped()
                }
            }
            .frame(height: 490)
            .tabViewStyle(.page(indexDisplayMode: .automatic))
        }
    }

#Preview {
    TopBigImageView()
}

