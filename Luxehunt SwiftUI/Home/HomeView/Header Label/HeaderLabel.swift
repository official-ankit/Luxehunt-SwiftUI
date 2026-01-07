//
//  HeaderLabel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 06/01/26.
//

import SwiftUI

struct HeaderLabel: View {
    @State var headerLabel:String = "Trending Deal"
    
    var body: some View {
        HStack{
          Text(headerLabel)
            Spacer()
        }
            .padding(.vertical, 10)
        
    }
}

#Preview {
    HeaderLabel()
}
