//
//  ExerciseImageLoad.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-19.
//

import UIKit

class ExerciseImageLoad: UIImageView {

    func loadImage(from url:URL){
        //loading image from url
//        guard let url=URL(string:exercise.image!)else {
//            return
//        }
        
       let task = URLSession.shared.dataTask(with: url){
            [weak self] (data, res, error) in
            
            if let error=error{
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            
            if let data=data,
               let newImage=UIImage(data: data){
                DispatchQueue.main.async {
                    self?.image=newImage
                }
            }
        }
        task.resume()
    }
}
