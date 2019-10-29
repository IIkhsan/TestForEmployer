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

final class DevicesViewController: UIViewController {
    
    //MARK: - Private propertyes
    
    private lazy var contentView = DevicesView()
    private var devices: [Device] = [] {
        willSet {
            title = "Доступные девайсы: \(newValue.count)"
            let deviceViewModels: [DeviceViewModel] = newValue
                .sorted(by: { $0.RSSI > $1.RSSI })
                .compactMap { device in
                    return DeviceViewModel(
                        name: device.name,
                        rssi: device.RSSI,
                        identifier: device.peripheral.identifier.uuidString,
                        didSelectDeivce: showDeviceDetail
                    )
            }
            contentView.devices = deviceViewModels
        }
    }
    private var manager: CBCentralManager?
    
    //MARK: - View lifecycle
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CBCentralManager(delegate: self, queue: nil, options: nil)
        title = "Доступные девайсы"
    }
    
    //MARK: -
    
    private func showBluetoothAlertWithMessage(title: String?, description: String?, isSwitchOff: Bool) {
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
    
    private func showDeviceDetail(index: Int) {
        let viewController = DeviceDescriptionViewController()
        viewController.device = devices[index]
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//MARK: - Bluetooth central manager delegate

extension DevicesViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        let state = central.state
        switch state {
        case .poweredOff:
            showBluetoothAlertWithMessage(
                title: "Блютуз выключен",
                description: "Включите Bluetooth в настройках",
                isSwitchOff: true
            )
        case .poweredOn:
            central.scanForPeripherals(
                withServices: nil,
                options: nil
            )
        case .unsupported:
            showBluetoothAlertWithMessage(
                title: "Система не поддерживает Bluetooth LE",
                description: nil, isSwitchOff: false
            )
        case .unknown:
            showBluetoothAlertWithMessage(
                title: "Состояние bluetooth неизвестно",
                description: "Попробуйте включить и выключить в настройках", isSwitchOff: true
            )
        case .resetting:
            showBluetoothAlertWithMessage(
                title: "Связь с bluetooth была прервана",
                description: "Попробуйте включить и выключить в настройках",
                isSwitchOff: true
            )
        case .unauthorized:
            showBluetoothAlertWithMessage(
                title: "Приложение не имеет доступ к bluetooth",
                description: "Включите его в настройках приложения",
                isSwitchOff: true
            )
        @unknown default:
            fatalError()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        var isEqualPeripherals = false
        devices.enumerated().forEach { index, device in
            if device.peripheral.identifier == peripheral.identifier {
                isEqualPeripherals = true
                devices[index].RSSI = RSSI.intValue
                return
            }
        }
        if isEqualPeripherals == false {
            let device = Device(name: peripheral.name ?? "No name",
                                peripheral: peripheral,
                                RSSI: RSSI.intValue,
                                isConnected: false)
            devices.append(device)
        }
    }
}
