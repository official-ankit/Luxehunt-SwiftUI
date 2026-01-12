//
//  FilterCell.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct FilterCell: View {
    @State var filterName:String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text(filterName).foregroundColor(.black)
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
