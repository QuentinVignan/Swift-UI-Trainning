//
//  AnimationView.swift
//  Testing App
//
//  Created by Quentin Vignan on 17/06/2021.
//

import Foundation
import SwiftUI


struct AnimationView: View {
    @State private var phase = 0.0
    
        var body: some View {
            ZStack {
                ForEach(0..<10) { i in
                    Wave(strength: 50, frequency: 10, phase: self.phase)
                        .stroke(Color.red.opacity(Double(i) / 10), lineWidth: 5)
                        .offset(y: CGFloat(i) * 10)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    self.phase = .pi * 2
                }
            
        }
    }
}

