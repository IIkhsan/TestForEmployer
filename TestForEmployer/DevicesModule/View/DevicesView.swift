//
//  DevicesView.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 26.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit
import SnapKit

final class DevicesView: UIView {
    
    private struct Appearance {
        static var estimatedRowHeight: CGFloat { return 48 }
    }
    
    //MARK: - Propertyes
    
    var devices: [DeviceViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.register(DeviceTableViewCell.self, forCellReuseIdentifier: DeviceTableViewCell.reuseIdentifier)
        table.tableFooterView = UIView()
        table.estimatedRowHeight = Appearance.estimatedRowHeight
        table.rowHeight = UITableView.automaticDimension
        table.dataSource = self
        table.delegate = self
        return table
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
        viewStyle()
        addSubviews()
        makeConstraints()
    }
    
    private func viewStyle() {
        backgroundColor = .white
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - TableViewDelegates

extension DevicesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = TableCellConfigurator<DeviceTableViewCell, DeviceViewModel>(item: devices[indexPath.row])
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeviceTableViewCell.reuseIdentifier, for: indexPath) as? DeviceTableViewCell else { return UITableViewCell() }
        cellModel.configure(cell: cell)
        return cell
    }
}

extension DevicesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        devices[indexPath.row].didSelectDeivce(indexPath.row)
    }
}
