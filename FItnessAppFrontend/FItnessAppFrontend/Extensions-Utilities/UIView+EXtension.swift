//
//  UIView+EXtension.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-16.
//

import UIKit

extension UIView {

    func pin(to superView:UIView){
        translatesAutoresizingMaskIntoConstraints=false
//        topAnchor.constraint(equalTo: superView.topAnchor).isActive=true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive=true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive=true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive=true
    }

}
