//
//  ExerciseModel.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-18.
//

import Foundation

struct Workouts: Codable {
    let status: Int
    let data: [Exercise]
}

struct Exercise: Codable{
    let m_id:String
    let name:String
    let sets:Int
    let reps:Int
    let type:String
    let gender:String
    let category:String
    let time:String?
    let videoLink:String?
    let image:String?

}

//{"_id":{"$oid":"6465ddd771c7d37dbeb55abe"},
//    "name":"Squats",
//    "sets":{"$numberInt":"3"},
//    "reps":{"$numberInt":"15"},
//    "type":"wg",
//    "gender":"female",
//    "category":"bodyweight",
//    "m_id":"2",
//    "time":"",
//    "image":"",
//    "videoLink":""
//}
