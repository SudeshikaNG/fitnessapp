////
////  ConfigureNavBarViewController.swift
////  FItnessAppFrontend
////
////  Created by Sudeshika Gunawardena on 2023-05-13.
////
//
//import UIKit
//
//func configureNavBar(for navigationItem:UINavigationItem){
//
//    let navBar = UINavigationBar()
//    view.addSubview(navBar)
//
//    //navigationItem.titleView=appTitle
//    let titleItem=UIBarButtonItem(customView: screenHeading)
//    navigationItem.leftBarButtonItem=titleItem
//    //navBar.setItems([navigationItem], animated: false)
//    navigationItem.rightBarButtonItem=UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings))
//
//    navBar.translatesAutoresizingMaskIntoConstraints=false
//    navBar.heightAnchor.constraint(equalToConstant: 44).isActive=true
//    navBar.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive=true
//    navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive=true
//    navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive=true
//    navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive=true
//    navBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive=true
//
//
//
//
//}
//
//@objc func showSettings(){
//
//}
