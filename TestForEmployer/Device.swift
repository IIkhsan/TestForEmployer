//
//  Device.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 26.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import CoreBluetooth

struct Device {
    let name: String
    let peripheral: CBPeripheral
    var RSSI: Int
    var isConnected: Bool
}

//extension Device: Codable {
//    
//}
