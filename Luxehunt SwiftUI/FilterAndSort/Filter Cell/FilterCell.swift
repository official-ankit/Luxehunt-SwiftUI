//
//  FilterCell.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct FilterCell: View {
    @State var filterName:String = ""
    @State var isSelectedFilter: Bool
    var body: some View {
        VStack(alignment: .leading){
            Text(filterName).foregroundColor(.black)
                .font(.custom("Inter", size: 14))
                .lineLimit(1)                    
//                    .truncationMode(.tail)
                .padding(.horizontal,10)
                .padding(.vertical,10)
        }.overlay(content: {
            RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 1)
        })
    }
}

//#Preview {
//    FilterCell()
//}
