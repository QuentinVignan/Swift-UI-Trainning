//
//  Wave.swift
//  Testing App
//
//  Created by Quentin Vignan on 19/06/2021.
//

import Foundation
import SwiftUI

struct Wave: Shape {
    var animatableData: Double {
        get { phase }
        set { self.phase = newValue }
    }
    var strength: Double
    var frequency: Double
    var phase: Double

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midWidth = width / 2
        let midHeight = height / 2
        let oneOverMidWidth = 1 / midWidth
        let wavelength = width / frequency
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, through: width, by: 1) {
            let relativeX = x / wavelength
            let distanceFromMidWidth = x - midWidth
            let normalDistance = oneOverMidWidth * distanceFromMidWidth

            let parabola = -(normalDistance * normalDistance) + 1
            let sine = sin(relativeX + phase)
            let y = parabola * strength * sine + midHeight
            path.addLine(to: CGPoint(x: x, y: y))
        }

        return Path(path.cgPath)
    }
}


