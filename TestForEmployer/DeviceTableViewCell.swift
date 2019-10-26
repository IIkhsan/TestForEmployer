//
//  DeviceTableViewCell.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 26.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit

final class DeviceTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        
    }
    
    private func addSubview() {
        
    }
    
    private func makeConstraints() {
        
    }
}
