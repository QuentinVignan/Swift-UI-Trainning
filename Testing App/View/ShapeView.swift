//
//  ShapeView.swift
//  Testing App
//
//  Created by Quentin Vignan on 17/06/2021.
//

import Foundation
import SwiftUI


struct ShapeView: View {
    var body: some View {
        HStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 150, height: 150)
                    Text("Rectangle")
                        .font(.system(size: 20))
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.red)
                        .frame(width: 150, height: 150)
                    Text("Rounded Rectangle")
                        .font(.system(size: 15))
                }
                ZStack {
                    Capsule()
                        .fill(Color.green)
                        .frame(width: 200, height: 100)
                    Text("Capsule")
                }
                ZStack {
                    Ellipse()
                        .fill(Color.blue)
                        .frame(width: 150, height: 100)
                    Text("Ellipse")
                }
                ZStack {
                    Circle()
                        .fill(Color.orange)
                        .frame(width: 150, height: 150)
                    Text("Circle")
                }
                

                

                

                
            }.offset(x: UIScreen.main.bounds.size.width / 4, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        }
    }
}
