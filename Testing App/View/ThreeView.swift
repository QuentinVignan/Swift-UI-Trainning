//
//  ThreeView.swift
//  Testing App
//
//  Created by Quentin Vignan on 17/06/2021.
//

import Foundation
import SwiftUI



struct ThreeView: View {
    @State var dragAmount = CGSize.zero
    @State var color = "red"
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .foregroundColor(self.color == "red" ? Color.red : (self.color == "green" ? Color.green : Color.blue))
                    .frame(width: 200, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .rotation3DEffect(.degrees(-Double(dragAmount.width) / 20), axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(.degrees(Double(dragAmount.height / 20)), axis: (x: 1, y: 0, z: 0))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    dragAmount = .zero
                                }
                            }
                    )
                
            }
            .frame(width: 400, height: 400)
            .zIndex(2)
            
            HStack {
                Button(action: {
                    self.color = "green"
                }, label: {
                    HStack(spacing: 25, content: {
                        Text("Green")
                            .foregroundColor(self.color == "green" ? Color.green : Color.black)
                            
                    })
                    .padding(.vertical , 10)
                    .padding(.horizontal)
                    .background(self.color == "green" ? Color.green.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                })
                Button(action: {
                    self.color = "red"
                }, label: {
                    HStack(spacing: 25, content: {
                        Text("Red")
                            .foregroundColor(self.color == "red" ? Color.red : Color.black)
                            
                    })
                    .padding(.vertical , 10)
                    .padding(.horizontal)
                    .background(self.color == "red" ? Color.red.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                })
                Button(action: {
                    self.color = "blue"
                }, label: {
                    HStack(spacing: 25, content: {
                        Text("Blue")
                            .foregroundColor(self.color == "blue" ? Color.blue : Color.black)
                            
                    })
                    .padding(.vertical , 10)
                    .padding(.horizontal)
                    .background(self.color == "blue" ? Color.blue.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                })
            }.zIndex(1)
            .frame(width: UIScreen.main.bounds.width , height: 30, alignment: .center)
            .offset(y: UIScreen.main.bounds.height / 1.75)
        }
    }
}


