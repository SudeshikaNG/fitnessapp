//
//  GetStartedViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-13.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    let navBar = UINavigationBar()
    
    let screenTitle:UILabel={
        let label=UILabel()
        label.text="Let's Get Started"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let nameTxt:UITextField={
        let textField=UITextField()
        textField.translatesAutoresizingMaskIntoConstraints=false
        textField.borderStyle = .bezel
        textField.keyboardType = .default
        textField.textColor = .white
        textField.placeholder="Your Name"
        textField.attributedPlaceholder=NSAttributedString(string: "Your Name", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        return textField
            
    }()
    
    let ageTxt:UITextField={
        let textField=UITextField()
        textField.translatesAutoresizingMaskIntoConstraints=false
        textField.borderStyle = .bezel
        textField.keyboardType = .numberPad
        textField.textColor = .white
        textField.placeholder="Your Age"
        textField.attributedPlaceholder=NSAttributedString(string: "Your Age", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        return textField
            
    }()
    
    
    let lineViewName:UIView={
       let line=UIView()
        line.backgroundColor = .white
        line.translatesAutoresizingMaskIntoConstraints=false
        return line
    }()
    
    let lineViewAge:UIView={
       let line=UIView()
        line.backgroundColor = .white
        line.translatesAutoresizingMaskIntoConstraints=false
        return line
    }()
    
    let femaleCheckBoxBtn:UIButton={
        let checkBox=UIButton()
        checkBox.translatesAutoresizingMaskIntoConstraints=false
        checkBox.setImage(UIImage(named: "unchecked"), for: .normal)
        checkBox.setImage(UIImage(named: "checked"), for: .selected)
        checkBox.setTitle("Female", for: .normal)
        checkBox.setTitleColor(.white, for: .normal)
        checkBox.titleLabel?.font = .systemFont(ofSize: 16)
        checkBox.layer.cornerRadius=5
        checkBox.addTarget(self, action: #selector(genderSelected(_:)), for: .touchUpInside)
        return checkBox
    }()
    
    let maleCheckBoxBtn:UIButton={
        let checkBox=UIButton()
        checkBox.translatesAutoresizingMaskIntoConstraints=false
        checkBox.setImage(UIImage(named: "unchecked"), for: .normal)
        checkBox.setImage(UIImage(named: "checked"), for: .selected)
        checkBox.setTitle("Male", for: .normal)
        checkBox.setTitleColor(.white, for: .normal)
        checkBox.titleLabel?.font = .systemFont(ofSize: 16)
        checkBox.layer.cornerRadius=5
        checkBox.addTarget(self, action: #selector(genderSelected(_:)), for: .touchUpInside)
        return checkBox
    }()
    
    let nextBtn:UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .orange
        button.setTitle("Next", for: .normal)
        return button
            
    }()
    
    let vstack:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .vertical
        stack.spacing=50
        stack.distribution = .equalSpacing
        stack.backgroundColor = .black
        stack.layoutMargins = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.alpha=0.9
        stack.layer.cornerRadius=5
        return stack
            
    }()

    let hstack:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing=50
        stack.distribution = .fillEqually
        return stack
            
    }()
    
    let bgImage:UIImageView={
            let image=UIImageView()
            image.translatesAutoresizingMaskIntoConstraints=false
            image.contentMode = .scaleAspectFill
            image.clipsToBounds=true
            image.image = .init(named: "bgImage1")
            return image
        }()
    
    @objc func genderSelected(_ sender:UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender == maleCheckBoxBtn{
            if sender.isSelected{
                sender.backgroundColor = .orange
                femaleCheckBoxBtn.backgroundColor = view.backgroundColor
                femaleCheckBoxBtn.isSelected=false
                print("male selected")
                
            }
            else{
                
                femaleCheckBoxBtn.isSelected=true
                sender.backgroundColor = view.backgroundColor
                femaleCheckBoxBtn.backgroundColor = .orange
                print("male deselected")
            }
        }
        else if sender == femaleCheckBoxBtn{
            if sender.isSelected{
                maleCheckBoxBtn.isSelected=false
                sender.backgroundColor = .orange
                maleCheckBoxBtn.backgroundColor = view.backgroundColor
                print("female selected")
                
            }
            else{
                maleCheckBoxBtn.isSelected=true
                sender.backgroundColor = view.backgroundColor
                maleCheckBoxBtn.backgroundColor = .orange
                print("female deselected")
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemMint
        view.addSubview(bgImage)
        view.sendSubviewToBack(bgImage)

        configureNavBar()
        addComponents()
        addConstraints()
        
        nextBtn.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        
    }
    
    @objc func navigate(){
        let secondGetStartedVC = SecondGetStartedViewController()
        navigationController?.pushViewController(secondGetStartedVC, animated: true)
    }
    
    func addComponents(){
        //view.addSubview(screenTitle)
        vstack.addArrangedSubview(screenTitle)
        nameTxt.addSubview(lineViewName)
        ageTxt.addSubview(lineViewAge)
        vstack.addArrangedSubview(nameTxt)
        vstack.addArrangedSubview(ageTxt)
        hstack.addArrangedSubview(maleCheckBoxBtn)
        hstack.addArrangedSubview(femaleCheckBoxBtn)
        vstack.addArrangedSubview(hstack)
        view.addSubview(nextBtn)
        view.addSubview(vstack)
    }
    
    
    func addConstraints(){
        screenTitle.heightAnchor.constraint(equalToConstant: 100).isActive=true
        screenTitle.widthAnchor.constraint(equalToConstant: 200).isActive=true
        
        nameTxt.widthAnchor.constraint(equalToConstant: 40).isActive=true
        
        ageTxt.topAnchor.constraint(equalTo: nameTxt.bottomAnchor,constant: 100).isActive=true
        
        lineViewName.leadingAnchor.constraint(equalTo: nameTxt.leadingAnchor).isActive=true
        lineViewName.trailingAnchor.constraint(equalTo: nameTxt.trailingAnchor).isActive=true
        lineViewName.bottomAnchor.constraint(equalTo: nameTxt.bottomAnchor).isActive=true
        lineViewName.heightAnchor.constraint(equalToConstant: 1).isActive=true
        
        lineViewAge.leadingAnchor.constraint(equalTo: ageTxt.leadingAnchor).isActive=true
        lineViewAge.trailingAnchor.constraint(equalTo: ageTxt.trailingAnchor).isActive=true
        lineViewAge.bottomAnchor.constraint(equalTo: ageTxt.bottomAnchor).isActive=true
        lineViewAge.heightAnchor.constraint(equalToConstant: 1).isActive=true
        
        hstack.topAnchor.constraint(equalTo: ageTxt.bottomAnchor, constant: 50).isActive=true
        
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive=true
        nextBtn.widthAnchor.constraint(equalToConstant: 400).isActive=true
//        nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive=true
//        nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
//        nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
                
        vstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 100).isActive=true
        vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive=true
        vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive=true
    }
    
    
    
    
/////////////////////////////////////////////////navbar////////////////////////////////////////////////////
    let screenHeading:UILabel={
        let label=UILabel()
        label.text="Fitness on Track"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.backgroundColor = .black
        label.adjustsFontSizeToFitWidth=true
        return label
    }()
    
    func configureNavBar(){
        
        
        view.addSubview(navBar)
        
        //navigationItem.titleView=appTitle
        let titleItem=UIBarButtonItem(customView: screenHeading)
        navigationItem.leftBarButtonItem=titleItem
        //navBar.setItems([navigationItem], animated: false)
        navigationItem.rightBarButtonItem=UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(showSettings))
//        navigationController?.navigationBar.barTintColor = UIColor.red
        navBar.translatesAutoresizingMaskIntoConstraints=false
        navBar.heightAnchor.constraint(equalToConstant: 44).isActive=true
        navBar.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive=true
        navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive=true
        navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive=true
        navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive=true
        navBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive=true
    }
    
    @objc func showSettings(){
        
    }
}
