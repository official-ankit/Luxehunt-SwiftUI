//
//  WebView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 13/01/26.
//

import SwiftUI

struct WebView: View {
    let data: ProductDetail

        var body: some View {
            VStack(spacing: 0) {
                
                // 🔹 Custom Header (Optional)
                HStack {
                    Text(data.brand ?? "")
                        .font(.headline)
                    Spacer()
                }
                .padding()
                .background(Color.white)

                Divider()

                // 🔹 WebView
                InAppWebView(urlString: data.original_link ?? "")
            }.onAppear{
                print(data)
                print(data.original_link)
            }
            .ignoresSafeArea()
        }
    }

//#Preview {
//    WebView()
//}
