//
//  ContentView.swift
//  Testing App
//
//  Created by Quentin Vignan on 15/06/2021.
//

import SwiftUI


struct ContentView: View {
    @State var index = 0
    @State var show = false
    @State var name = "Bluetooth"
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Image(uiImage: UIImage(named: "AppIcon") ?? UIImage())
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.top , 10)
                    
                        
                    Text("Testing")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(.top , 10)
                    
                    Text("Swift UI")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        self.index = 0
                        self.name = "Bluetooth"
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25, content: {
                            Text("Bluetooth")
                                .foregroundColor(self.index == 0 ? Color.red : Color.white)
                                
                        })
                        .padding(.vertical , 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color.red.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    })
                    
                    Button(action: {
                        self.index = 1
                        self.name = "Wave"
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25, content: {
                            Text("Wave")
                                .foregroundColor(self.index == 1 ? Color.red : Color.white)
                                
                        })
                        .padding(.vertical , 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color.red.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    })
                    Button(action: {
                        self.index = 2
                        self.name = "Shape example"
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25, content: {
                            Text("Shape example")
                                .foregroundColor(self.index == 2 ? Color.red : Color.white)
                                
                        })
                        .padding(.vertical , 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color.red.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    })
                    Button(action: {
                        self.index = 3
                        self.name = "Animation"
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25, content: {
                            Text("Animation")
                                .foregroundColor(self.index == 3 ? Color.red : Color.white)
                                
                        })
                        .padding(.vertical , 10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? Color.red.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    })
                    Button(action: {
                        self.index = 4
                        self.name = "3D"
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25, content: {
                            Text("3D")
                                .foregroundColor(self.index == 4 ? Color.red : Color.white)
                                
                        })
                        .padding(.vertical , 10)
                        .padding(.horizontal)
                        .background(self.index == 4 ? Color.red.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    })
                    Button(action: {
                        self.index = 5
                        self.name = "Shape Animated"
                        withAnimation {
                            self.show.toggle()
                        }
                    }, label: {
                        HStack(spacing: 25, content: {
                            Text("Shape Animated")
                                .foregroundColor(self.index == 5 ? Color.red : Color.white)
                                
                        })
                        .padding(.vertical , 10)
                        .padding(.horizontal)
                        .background(self.index == 5 ? Color.red.opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    })
                    
                    Spacer(minLength: 0)
                }
                .padding(.top , 25)
                .padding(.horizontal , 20)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
            }
            .padding(.top , UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom , UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            VStack(spacing: 0, content: {
                HStack(spacing: 15, content: {
                    Button(action: {
                        withAnimation{
                            self.show.toggle()
                        }
                    }, label: {
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    })
                    Text(self.name)
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                })
                .padding(.top , UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader {_ in
                    VStack {
                        if self.index == 0 {
                            BluetoothView()
                        }
                        else if self.index == 1 {
                            WaveView()
                        }
                        else if self.index == 2{
                            ShapeView()
                        }
                        else if self.index == 3{
                            AnimationView()
                        }
                        else if self.index == 4 {
                            ThreeView()
                        }
                        else if self.index == 5 {
                            DimensionView()
                        }
                    }
                }
                
            })
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
            
        }
        .background(Color.blue).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
