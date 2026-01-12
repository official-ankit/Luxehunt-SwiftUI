//
//  FilterHeaderLabel.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct FilterHeaderLabel: View {
    @State var lblHeader:String = ""
    
    var body: some View {
        HStack{
            Text(lblHeader).foregroundColor(.salesLabel)
                .font(.custom("Inter", size: 14))
        }
    }
}

//#Preview {
//    FilterHeaderLabel()
//}
