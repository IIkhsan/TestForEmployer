//
//  DeviceViewModel.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 27.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

struct DeviceViewModel {
    let name: String
    let rssi: Int
    let identifier: String
    let didSelectDeivce: (_ index: Int) -> Void
}
