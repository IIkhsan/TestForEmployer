//
//  ViewController.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 25.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit
import CoreBluetooth

//TODO: Вынести текст в localizable

class DevicesViewController: UIViewController {
    
    //MARK: - Private propertyes
    
    private lazy var contentView = DevicesView()
    private var devices: [Device] = []
    private var manager: CBCentralManager?
    
    //MARK: - View lifecycle
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CBCentralManager(delegate: self, queue: nil, options: nil)
        
    }
    
    func showBluetoothAlertWithMessage(title: String?, description: String?, isSwitchOff: Bool) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        if isSwitchOff {
            guard let url = URL(string: "App-Prefs:root=General") else { return }
            alert.addAction(UIAlertAction(title: "Включить bluetooth", style: .default, handler: { action in
                let app = UIApplication.shared
                app.open(url, options: [:], completionHandler: nil)
            }))
        } else {
            alert.addAction(UIAlertAction(title: "Понятно", style: .default, handler: nil))
        }
        show(alert, sender: nil)
    }
}

//MARK: - CentralManagerDelegate

extension DevicesViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        let state = central.state
        switch state {
        case .poweredOff:
            showBluetoothAlertWithMessage(title: "Блютуз выключен", description: "Включите Bluetooth в настройках", isSwitchOff: true)
        case .poweredOn:
            central.scanForPeripherals(withServices: nil, options: nil)
        case .unsupported:
            showBluetoothAlertWithMessage(title: "Система не поддерживает Bluetooth LE", description: nil, isSwitchOff: false)
        case .unknown:
            showBluetoothAlertWithMessage(title: "Состояние bluetooth неизвестно", description: "Попробуйте включить и выключить в настройках", isSwitchOff: true)
        case .resetting:
            showBluetoothAlertWithMessage(title: "Связь с bluetooth была прервана", description: "Попробуйте включить и выключить в настройках", isSwitchOff: true)
        case .unauthorized:
            showBluetoothAlertWithMessage(title: "Приложение не имеет доступ к bluetooth", description: "Включите его в настройках приложения", isSwitchOff: true)
        @unknown default:
            fatalError()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        devices.enumerated().forEach { index, device in
            if device.peripheral.isEqual(peripheral) {
                devices[index].RSSI = RSSI.intValue
                return
            }
        }
        let device = Device(name: peripheral.name ?? "No name", peripheral: peripheral, RSSI: RSSI.intValue)
        devices.append(device)
    }
}
