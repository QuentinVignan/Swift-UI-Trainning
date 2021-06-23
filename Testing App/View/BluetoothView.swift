//
//  BluetoothView.swift
//  Testing App
//
//  Created by Quentin Vignan on 17/06/2021.
//

import Foundation
import SwiftUI


struct BluetoothView: View {
    @ObservedObject var bluetooth = BLEManager();
    @State var index = 0
    var body: some View {
        ZStack {
            VStack {
                if (!bluetooth.isSwitchedOn) {
                    Text("Bluetooth OFF")
                        .font(.title)
                }
                else {
                    Text("Bluetooth ON")
                        .font(.title)
                }
                List(bluetooth.peripherals) { peripheral in
                    HStack {
                        Text(String(peripheral.id))
                        Spacer()
                        Text(peripheral.name)
                        Spacer()
                        Text(String(peripheral.rssi))
                    }
                }
            }
            HStack {
                Button(action: {
                    self.index = 1
                    bluetooth.startScanning()
                }, label: {
                    HStack(spacing: 25, content: {
                        Text("Start Scanning")
                            .foregroundColor(self.index == 1 ? Color.green : Color.black)
                            
                    })
                    .padding(.vertical , 10)
                    .padding(.horizontal)
                    .background(self.index == 1 ? Color.green.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                })
                Button(action: {
                    self.index = 2
                    bluetooth.stopScanning()
                }, label: {
                    HStack(spacing: 25, content: {
                        Text("Stop Scanning")
                            .foregroundColor(self.index == 2 ? Color.red : Color.black)
                            
                    })
                    .padding(.vertical , 10)
                    .padding(.horizontal)
                    .background(self.index == 2 ? Color.red.opacity(0.2) : Color.clear)
                    .cornerRadius(10)
                })
            }
            .frame(width: UIScreen.main.bounds.width , alignment: .center)
            .offset(y: UIScreen.main.bounds.height / 3 )
        }.background(Color.white)
        
        
       
    }
}
