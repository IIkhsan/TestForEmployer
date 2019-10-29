//
//  NetworkManager.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 26.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

protocol NetworkManagerProtocol {
    func sendDevice(device: Device, complition: @escaping ((Result<Bool, Error>) -> Void))
    func sendDeviceData(deviceID: Int, RSSI: Int, complition: @escaping ((Result<Bool, Error>) -> Void))
}
