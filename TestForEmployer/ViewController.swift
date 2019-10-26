//
//  ViewController.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 25.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    //MARK: - Private propertyes
    
    private lazy var contentView = DevicesView()
    private var devices: [Device] = []
    private var manager: CBCentralManager = CBCentralManager(delegate: self, queue: nil)
    
    //MARK: - View lifecycle
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.scanForPeripherals(withServices: nil, options: nil)
        
    }

}

extension ViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        <#code#>
    }
}
