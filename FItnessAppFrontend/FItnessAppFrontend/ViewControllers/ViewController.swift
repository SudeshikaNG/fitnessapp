//
//  ViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-11.
//

import UIKit

class ViewController: UIViewController {
    
    let logoView:UIImageView={
        let image=UIImageView()
        image.translatesAutoresizingMaskIntoConstraints=false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 80
        image.clipsToBounds=true
        image.image = .init(named: "logo")
        return image
    }()
    
    let appTitle:UILabel={
        let label=UILabel()
        label.text="Fitness on Track"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=label.font.withSize(20)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth=true
        return label
    }()
    
    let startBtn:UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .orange
        button.setTitle("Get Started", for: .normal)
        button.layer.cornerRadius=15
        return button
    }()
    
    let vstack:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .vertical
        stack.spacing=5
        stack.distribution = .equalSpacing
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Fitness For Life"
        view.backgroundColor = .black
        
        addComponents()
        setConstraints()
        
        startBtn.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        
    }
    
    @objc func navigate(){
        let landingVC = LandingViewController()
        navigationController?.pushViewController(landingVC, animated: true)
    }
    
    func setConstraints(){
        
        logoView.heightAnchor.constraint(equalToConstant: 200).isActive=true
        logoView.widthAnchor.constraint(equalToConstant: 50).isActive=true
        
        appTitle.widthAnchor.constraint(equalToConstant: 20).isActive=true
        appTitle.heightAnchor.constraint(equalToConstant: 30).isActive=true
        appTitle.topAnchor.constraint(equalTo: logoView.bottomAnchor,constant: 20).isActive=true
        
        startBtn.widthAnchor.constraint(equalToConstant: 10).isActive=true
        startBtn.heightAnchor.constraint(equalToConstant: 50).isActive=true
        startBtn.topAnchor.constraint(equalTo: appTitle.bottomAnchor,constant: 20).isActive=true

        vstack.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive=true
        vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive=true
        vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive=true
    }
    
    
    func addComponents(){
        vstack.addArrangedSubview(logoView)
        vstack.addArrangedSubview(appTitle)
        vstack.addArrangedSubview(startBtn)
        view.addSubview(vstack)
    }

}

