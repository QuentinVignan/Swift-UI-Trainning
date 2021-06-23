//
//  DimensionView.swift
//  Testing App
//
//  Created by Quentin Vignan on 17/06/2021.
//

import Foundation
import SwiftUI


struct DimensionView: View {
    @State private var sides: Double = 4
    @State private var scale: Double = 1.0
    @State private var color = 1
       
       var body: some View {
           VStack {
               AnimatePolygone(sides: sides, scale: scale)
                .stroke(self.color == 1 ? Color.red : (self.color == 2 ? Color.green : Color.blue)  , lineWidth: (sides < 3) ? 10 : ( sides < 7 ? 5 : 2))
                   .padding(20)
                   .animation(.easeInOut(duration: 3.0))
                   .layoutPriority(1)
               
               
               
                VStack {
                    Text("\(Int(sides)) sides")
                    
                    Slider(value: $sides, in: 0...30)
                     .frame(width: 200, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    HStack {
                        Button(action: {
                            self.color = 2
                        }, label: {
                            HStack(spacing: 25, content: {
                                Text("Green")
                                    .foregroundColor(self.color == 2 ? Color.green : Color.black)
                                    
                            })
                            .padding(.vertical , 10)
                            .padding(.horizontal)
                            .background(self.color == 2 ? Color.green.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                        })
                        Button(action: {
                            self.color = 1
                        }, label: {
                            HStack(spacing: 25, content: {
                                Text("Red")
                                    .foregroundColor(self.color == 1 ? Color.red : Color.black)
                                    
                            })
                            .padding(.vertical , 10)
                            .padding(.horizontal)
                            .background(self.color == 1 ? Color.red.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                        })
                        Button(action: {
                            self.color = 3
                        }, label: {
                            HStack(spacing: 25, content: {
                                Text("Blue")
                                    .foregroundColor(self.color == 3 ? Color.blue : Color.black)
                                    
                            })
                            .padding(.vertical , 10)
                            .padding(.horizontal)
                            .background(self.color == 3 ? Color.blue.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                        })
                    }
                }.zIndex(1)
                
                
           }.padding(.bottom , 60)
       }
}




