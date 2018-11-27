//
//  SelfConstraintBuilder.swift
//  SwiftLayout
//
//  Created by Jake Sawyer on 10/23/18.
//  Copyright © 2018 SwiftKick Mobile. All rights reserved.
//

import Foundation

public class SelfConstraintBuilder: ConstraintBuilder {
    
    public let constrainable: Constrainable
    
    public internal(set) var constraints = [NSLayoutConstraint]()
    
    public init(for constrainable: Constrainable) {
        self.constrainable = constrainable
        if let view = constrainable as? UIView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func makeDimensionConstraint(anchor: NSLayoutDimension, relation: NSLayoutConstraint.Relation, constant rawConstant: CGFloat, priority: UILayoutPriority, activate: Bool) -> NSLayoutConstraint {
        var constant = rawConstant
        if #available(iOS 11, *), constant == .systemSpacing {
            print("[SwiftLayout] Unsupported usage of `CGFloat.systemSpacing` with `SelfConstraintBuilder`! Using `8` as a placeholder value")
            constant = 8
        }
        let result: NSLayoutConstraint
        switch relation {
        case .equal:
            result = anchor.constraint(equalToConstant: constant)
        case .lessThanOrEqual:
            result = anchor.constraint(lessThanOrEqualToConstant: constant)
        case .greaterThanOrEqual:
            result = anchor.constraint(greaterThanOrEqualToConstant: constant)
        }
        result.priority = priority
        if activate {
            result.isActive = true
        }
        return result
    }
}
