//
//  TopBigImageView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI

struct TopBigImageView: View {

    let imgBanner: String

    var body: some View {
        AsyncImage(url: URL(string: imgBanner)) { phase in
            switch phase {

            case .empty:
                ShimmerView()
                    .frame(height: 490)
                    .cornerRadius(15)

            case .success(let image):
                image
                    .resizable()
                    .frame(height: 490)

            case .failure:
                ShimmerView()
                    .frame(height: 490)
                    .cornerRadius(15)

            @unknown default:
                EmptyView()
            }
        }
        .frame(height: 490)
        .frame(maxWidth: .infinity)
        .clipped()
    }
}


