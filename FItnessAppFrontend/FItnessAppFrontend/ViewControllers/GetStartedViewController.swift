//
//  GetStartedViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-13.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    var userDetails : [String:Any] = [:]
    
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
//        textField.keyboardType = .default
        textField.textColor = .orange
        textField.placeholder="Your Name"
        textField.attributedPlaceholder=NSAttributedString(string: "Your Name", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textField.autocorrectionType = .no
        return textField
            
    }()
    
    let ageTxt:UITextField={
        let textField=UITextField()
        textField.translatesAutoresizingMaskIntoConstraints=false
        textField.borderStyle = .bezel
        textField.keyboardType = .numberPad
        textField.textColor = .orange
        textField.placeholder="Your Age"
        textField.attributedPlaceholder=NSAttributedString(string: "Your Age", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textField.autocorrectionType = .no
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
        checkBox.titleLabel?.font = .systemFont(ofSize: 20)
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
        checkBox.titleLabel?.font = .systemFont(ofSize: 20)
        checkBox.layer.cornerRadius=5
        checkBox.addTarget(self, action: #selector(genderSelected(_:)), for: .touchUpInside)
        return checkBox
    }()
    
    let nextBtn:UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .orange
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.layer.cornerRadius=10
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
    
    let backBtn:UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .orange
        button.setTitle("< Back", for: .normal)
        button.contentHorizontalAlignment = .center
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font=UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius=5
        return button

    }()
    
    @objc func genderSelected(_ sender:UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender == maleCheckBoxBtn{
            if sender.isSelected{
                sender.backgroundColor = .orange
                femaleCheckBoxBtn.backgroundColor = view.backgroundColor
                femaleCheckBoxBtn.isSelected=false
                userDetails["gender"] = "male"
                print("male selected")
                
            }
            else{
                femaleCheckBoxBtn.isSelected=true
                sender.backgroundColor = view.backgroundColor
                femaleCheckBoxBtn.backgroundColor = .orange
                userDetails["gender"] = "female"
                print("male deselected")
            }
        }
        else if sender == femaleCheckBoxBtn{
            if sender.isSelected{
                maleCheckBoxBtn.isSelected=false
                sender.backgroundColor = .orange
                maleCheckBoxBtn.backgroundColor = view.backgroundColor
                userDetails["gender"] = "female"
                print("female selected")
                
            }
            else{
                maleCheckBoxBtn.isSelected=true
                sender.backgroundColor = view.backgroundColor
                maleCheckBoxBtn.backgroundColor = .orange
                userDetails["gender"] = "male"
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
        backBtn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
        
    }
    
    @objc func navigate(){
        
        validateTextFields()
        
        if userDetails["gender"] == nil{
            showAlert()
        }
        
        userDetails["name"] = nameTxt.text
        userDetails["age"] = ageTxt.text
        
        print("get started vc")
        print(userDetails)
        
        let secondGetStartedVC = SecondGetStartedViewController()
        secondGetStartedVC.userDetails = userDetails
        navigationController?.pushViewController(secondGetStartedVC, animated: true)
    }
    
    @objc func navigateBack(){

        navigationController?.popViewController(animated: true)
    }
    
    func validateTextFields() -> Bool {
        let textFields: [UITextField] = [nameTxt, ageTxt]
        
        for textField in textFields {
            if textField.text?.isEmpty ?? true {
                showAlert()
            }
        }
        return true
    }
        
    private func showAlert() {
            let alertController = UIAlertController(title: "Please Fill Out All Fields !!!", message: "Do not leave empty fields when submitting.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
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
        view.addSubview(backBtn)
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
        nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive=true
        nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive=true
        nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive=true
                
        vstack.topAnchor.constraint(equalTo: backBtn.bottomAnchor,constant: 50).isActive=true
        vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive=true
        vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive=true
        
        backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive=true
        backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive=true
        backBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -300).isActive=true
        backBtn.heightAnchor.constraint(equalToConstant: 30).isActive=true
    }
    
    
    
    
    /////////////////////////////////////////////////navbar////////////////////////////////////////////////////
        let screenHeading:UILabel={
            let label=UILabel()
            label.text="Fitness on Track"
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 20, weight: .bold)
            label.textColor = .white
//            label.backgroundColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
        }()
        
        func configureNavBar(){
            
            
            view.addSubview(navBar)
            
            //navigationItem.titleView=appTitle
            let titleItem=UIBarButtonItem(customView: screenHeading)
            navigationItem.leftBarButtonItem=titleItem
            navBar.translatesAutoresizingMaskIntoConstraints=false
            navBar.heightAnchor.constraint(equalToConstant: 44).isActive=true
            navBar.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive=true
            navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive=true
            navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive=true
            navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive=true
            navBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive=true
        }
}
