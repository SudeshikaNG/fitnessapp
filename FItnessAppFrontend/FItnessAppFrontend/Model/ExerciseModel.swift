//
//  ExerciseModel.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-18.
//

import Foundation

struct WorkoutList: Codable{
    let exercises:[Workout]
}

struct Workout: Codable{
    let manualId:String
    let name:String
    let sets:Int?
    let reps:Int?
    let type:String
    let gender:String
    let category:String
    let time:String?
    let videoLink:String?
    let image:Data?

}




//{"_id":{"$oid":"6465e05471c7d37dbeb55ac8"},"m_id":"12","name":"Jogging or Running","sets":{"$numberInt":"0"},"reps":{"$numberInt":"0"},"type":"fl","gender":"male","category":"cardio","time":"45 mins"}
