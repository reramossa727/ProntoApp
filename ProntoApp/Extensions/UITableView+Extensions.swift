//
//  UITableView+Extensions.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/28/19.
//  Copyright © 2019 reramos. All rights reserved.
//


import UIKit

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
    
}

extension NSObject: ClassNameProtocol {}

public extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
    
    func isLastVisibleCell(at: IndexPath) -> Bool {
        let possibleLastCell = self.cellForRow(at: at)
        return self.visibleCells.last == possibleLastCell
    }
}


