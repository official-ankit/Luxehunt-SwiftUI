//
//  TopBigImageView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 05/01/26.
//

import SwiftUI


    struct TopBigImageView: View {
        
        
         var imgBanner = "BigBanner"
        
        var body: some View {
            HStack{
                AsyncImage(url: URL(string: imgBanner)){ img in
                    img.resizable()
                        .frame(height: 490)
                    
                } placeholder: {
                    Image(imgBanner)
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: 490)
                }
                
            }
            
        }
    }

#Preview {
    TopBigImageView()
}

