//
//  DeviceTableViewCell.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 26.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit

final class DeviceTableViewCell: UITableViewCell, ConfigurableCell {
    
    private struct Appearance {
        static var sSpace: CGFloat { return 16 }
        static var xsSpace: CGFloat { return 8 }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var rssiLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func commonInit() {
        addSubview()
        makeConstraints()
    }
    
    private func addSubview() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(rssiLabel)
    }
    
    private func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Appearance.sSpace)
            make.trailing.leading.equalToSuperview().inset(Appearance.sSpace)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(Appearance.xsSpace)
            make.leading.trailing.equalTo(titleLabel)
        }
        rssiLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(Appearance.xsSpace)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview().inset(Appearance.sSpace)
        }
    }
    
    func configure(data: DeviceViewModel) {
        titleLabel.text = data.name
        descriptionLabel.text = data.identifier
        rssiLabel.text = "\(data.rssi)"
    }
}
