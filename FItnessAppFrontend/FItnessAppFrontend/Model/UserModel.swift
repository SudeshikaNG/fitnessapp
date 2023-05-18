//
//  UserModel.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-18.
//

import Foundation


struct UserModel:Codable{
    let name:String
    let age: Int
    let gender: String
    let weight: Decimal
    let height:Decimal
    let bmi:Decimal
    let goal:String
}
