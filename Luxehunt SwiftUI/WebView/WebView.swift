//
//  WebView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 13/01/26.
//

import SwiftUI

struct WebView: View {
    @State var data:ProductDetail
    var body: some View {
        ZStack{
            Color.red
            Text(data.brand ?? "")
        }.onAppear{
           
        }
    }
}

//#Preview {
//    WebView()
//}
