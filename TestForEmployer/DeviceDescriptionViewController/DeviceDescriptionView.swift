//
//  DeviceDescriptionView.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 27.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit

final class DeviceDscriptionView: UIView {
    
    private struct Appearance {
        static var sSpace: CGFloat { return  16}
    }
    
    //MARK: - Propertyes
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var macIdentifierLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubviews()
        makeConstraints()
    }
    
    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(macIdentifierLabel)
    }
    
    private func makeConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Appearance.sSpace)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).inset(Appearance.sSpace)
        }
        macIdentifierLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Appearance.sSpace)
            make.top.equalTo(nameLabel.snp.bottom).offset(Appearance.sSpace)
        }
    }
    
    func configure(device: Device) {
        nameLabel.text = device.name
        macIdentifierLabel.text = device.peripheral.identifier.uuidString
    }
}
