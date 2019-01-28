//
//  UIVIewControllerExtension.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 06/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//


import UIKit

extension UIViewController {
    func getConstraint(_ constraint:Constraint, from constraints: [NSLayoutConstraint]?) -> NSLayoutConstraint? {
        guard let constraints = constraints else { return nil }
        let constraintName:String?
        
        switch constraint {
        case .leading: constraintName = "leftAnchorConstraint"
        case .trailing: constraintName = "rightAnchorConstraint"
        case .top: constraintName = "topAnchorConstraint"
        case .bottom: constraintName = "bottomAnchorConstraint"
        }
        
        for constraint in constraints {
            if constraint.identifier == constraintName {
                return constraint
            }
        }
        
        return nil
    }
}
