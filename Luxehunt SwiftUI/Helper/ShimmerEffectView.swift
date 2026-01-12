//
//  ShimmerEffectView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct ShimmerEffectView: View {
    @State private var phase: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color(white: 0.94) // Subtle modern base gray
                
                LinearGradient(
                    stops: [
                        .init(color: .clear, location: 0.35),
                        .init(color: .white.opacity(0.8), location: 0.5),
                        .init(color: .clear, location: 0.65)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .scaleEffect(2.5)
                .offset(x: -geo.size.width + (phase * geo.size.width * 2))
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 1.8).repeatForever(autoreverses: false)) {
                phase = 1
            }
        }
    }
}
