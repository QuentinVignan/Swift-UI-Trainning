//
//  WaveView.swift
//  Testing App
//
//  Created by Quentin Vignan on 19/06/2021.
//

import Foundation
import SwiftUI

struct WaveView: View {
    @State private var phase = 0.0
    var body: some View {
        ZStack {
            Wave(strength: 50, frequency: 12 , phase: self.phase)
                .stroke(Color.red, lineWidth: 6)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                        self.phase = .pi * 2
                    }
                }.zIndex(3)
            
        }
        
    }
}
