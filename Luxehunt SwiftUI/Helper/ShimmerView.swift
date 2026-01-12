//
//  ShimmerView.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 12/01/26.
//

import SwiftUI

struct ShimmerView: View {
    @State private var phase: CGFloat = 0
    
    // Modern palette: Use subtle off-grays for a premium feel
    let baseColor = Color(white: 0.85)
    let highlightColor = Color(white: 0.95)
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // 1. The base "skeleton" layer
                baseColor
                
                // 2. The animated "Glaze" layer
                LinearGradient(
                    stops: [
                        .init(color: .clear, location: 0.35),
                        .init(color: highlightColor, location: 0.5),
                        .init(color: .clear, location: 0.65)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .scaleEffect(2.5) // Extends the gradient for a smoother sweep
                .offset(x: -geo.size.width + (phase * geo.size.width * 2))
            }
            .onAppear {
                withAnimation(
                    .linear(duration: 2.0)
                    .repeatForever(autoreverses: false)
                ) {
                    phase = 1
                }
            }
        }
        .clipped()
    }
}


