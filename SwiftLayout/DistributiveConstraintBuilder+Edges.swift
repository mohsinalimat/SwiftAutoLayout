//
//  DistributiveConstraintBuilder+Edges.swift
//  SwiftLayout
//
//  Created by Jake Sawyer on 11/13/18.
//  Copyright © 2018 SwiftKick Mobile. All rights reserved.
//

import Foundation

public extension DistributiveConstraintBuilder {
    /**
     Horizontally distribute the before and after constrainables via their leading and trailing anchors.
     This method returns a single constraint.
     - Parameters:
         - relation: The relationship between the anchors. Defaults to `.equal`
         - constant: The constant for the constraint. Defaults to 0
         - multiplier: The multiplier for the constraint. Defaults to 1
         - priority: The priority for the constraint. Defaults to `.required`. Note that `.required` constraints must be activated and cannot be deactivated. Specify a lower value for dynamically activated constraints.
         - activate: Whether or not this constraint should be activated now. Disable this if you want to activate the constraint later.
     - Returns: The constraint builder. Access any constraints built so far in the order declared via its `constraints` property.
     */
    @discardableResult
    func leadingTrailing(_ relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, activate: Bool = true) -> DistributiveConstraintBuilder {
        constraints.append(makeConstraint(first: beforeConstrainable.trailingAnchorInfo, second: afterConstrainable.leadingAnchorInfo, relation: relation, constant: constant, multiplier: multiplier, priority: priority, activate: activate, inverse: true))
        return self
    }
    
    /**
     Vertically distribute the before and after constrainables via their top and bottom anchors.
     This method returns a single constraint.
     - Parameters:
         - relation: The relationship between the anchors. Defaults to `.equal`
         - constant: The constant for the constraint. Defaults to 0
         - multiplier: The multiplier for the constraint. Defaults to 1
         - priority: The priority for the constraint. Defaults to `.required`. Note that `.required` constraints must be activated and cannot be deactivated. Specify a lower value for dynamically activated constraints.
         - activate: Whether or not this constraint should be activated now. Disable this if you want to activate the constraint later.
     - Returns: The constraint builder. Access any constraints built so far in the order declared via its `constraints` property.
     */
    @discardableResult
    func topBottom(_ relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0, multiplier: CGFloat = 1, priority: UILayoutPriority = .required, activate: Bool = true) -> DistributiveConstraintBuilder {
        constraints.append(makeConstraint(first: beforeConstrainable.bottomAnchorInfo, second: afterConstrainable.topAnchorInfo, relation: relation, constant: constant, multiplier: multiplier, priority: priority, activate: activate, inverse: true))
        return self
    }
    
}
