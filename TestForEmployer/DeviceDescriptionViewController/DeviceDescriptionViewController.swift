//
//  DeviceDescriptionViewController.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 27.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit

final class DeviceDescriptionViewController: UIViewController {
    
    private lazy var contentView = DeviceDscriptionView()
    
    var device: Device? {
        didSet {
            guard let device = device else { return }
            contentView.configure(device: device)
        }
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
