//
//  DevicesView.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 26.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit

final class DevicesView: UIView {
    
    private struct Appearance {
        
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    
    private func commonInit() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func makeConstraints() {
        
    }
}
