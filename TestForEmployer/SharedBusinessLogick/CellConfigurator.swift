//
//  CellConfigurator.swift
//  TestForEmployer
//
//  Created by Ильяс Ихсанов on 27.10.2019.
//  Copyright © 2019 secret. All rights reserved.
//

import UIKit

public protocol ConfigurableCell: AnyObject {
    associatedtype DataType
    func configure(data: DataType)
    static var reuseIdentifier: String { get }
}

extension ConfigurableCell {
    public static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

public protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
}

public class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    public static var reuseId: String { return String(describing: CellType.self) }

    public let item: DataType

    public init(item: DataType) {
        self.item = item
    }

    public func configure(cell: UIView) {
        (cell as? CellType)?.configure(data: item)
    }
}

public class CollectionCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UICollectionViewCell {
    public static var reuseId: String { return String(describing: CellType.self) }

    public let item: DataType

    public init(item: DataType) {
        self.item = item
    }

    public func configure(cell: UIView) {
        (cell as? CellType)?.configure(data: item)
    }
}
