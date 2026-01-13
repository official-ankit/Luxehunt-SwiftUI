//
//  InAppWebView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 13/01/26.
//

import Foundation

import SwiftUI
import WebKit

struct InAppWebView: UIViewRepresentable {

    let urlString: String
    let webView = WKWebView()

    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else { return }
        uiView.load(URLRequest(url: url))
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("✅ WebView Loaded Successfully")
        }
    }
}

