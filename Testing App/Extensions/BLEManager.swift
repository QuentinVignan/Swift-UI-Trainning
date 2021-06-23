//
//  BLEManager.swift
//  Testing App
//
//  Created by Quentin Vignan on 15/06/2021.
//

import Foundation
import CoreBluetooth


struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}

class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    
    var myCentral: CBCentralManager!
    @Published var isSwitchedOn = false
    @Published var peripherals = [Peripheral]()
    
        override init() {
            super.init()
     
            myCentral = CBCentralManager(delegate: self, queue: nil)
            myCentral.delegate = self
        }


    func centralManagerDidUpdateState(_ central: CBCentralManager) {
         if central.state == .poweredOn {
             isSwitchedOn = true
         }
         else {
             isSwitchedOn = false
         }
    }


    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var peripheralName: String!
       
        
            if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
                peripheralName = name
            }
            else {
                peripheralName = "Unknown"
            }
            let newPeripheral = Peripheral(id: peripherals.count, name: peripheralName, rssi: RSSI.intValue)
            print(newPeripheral)
            peripherals.append(newPeripheral)
        }
    
    
    func startScanning() {
        let new = [Peripheral]()
        peripherals = new
        myCentral.scanForPeripherals(withServices: nil, options: nil)
     }
    
    func stopScanning() {
        myCentral.stopScan()
    }
    
}
