//
//  LoginViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-20.
//

import UIKit

class LoginViewController: UIViewController {
        
        let navBar = UINavigationBar()
        
        let screenTitle:UILabel={
            let label=UILabel()
            label.text="Login"
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 25, weight: .bold)
            label.textColor = .white
            label.adjustsFontSizeToFitWidth=true
            return label
                
        }()
        
        let unTxt:UITextField={
            let textField=UITextField()
            textField.translatesAutoresizingMaskIntoConstraints=false
            textField.borderStyle = .bezel
            textField.keyboardType = .default
            textField.textColor = .orange
            textField.placeholder="Username"
            textField.attributedPlaceholder=NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
            textField.borderStyle = .none
            textField.backgroundColor = .clear
            textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            textField.autocorrectionType = .no
            return textField
                
        }()
        
        let pwTxt:UITextField={
            let textField=UITextField()
            textField.translatesAutoresizingMaskIntoConstraints=false
            textField.borderStyle = .bezel
            textField.keyboardType = .default
            textField.textColor = .orange
            textField.placeholder="Password"
            textField.attributedPlaceholder=NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
            textField.borderStyle = .none
            textField.backgroundColor = .clear
            textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            textField.autocorrectionType = .no
            return textField
                
        }()
        
        
        let lineViewUn:UIView={
           let line=UIView()
            line.backgroundColor = .white
            line.translatesAutoresizingMaskIntoConstraints=false
            return line
        }()
        
        let lineViewPw:UIView={
           let line=UIView()
            line.backgroundColor = .white
            line.translatesAutoresizingMaskIntoConstraints=false
            return line
        }()
        
        
        let loginBtn:UIButton={
            let button=UIButton()
            button.translatesAutoresizingMaskIntoConstraints=false
            button.backgroundColor = .orange
            button.setTitle("Login", for: .normal)
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
            stack.layoutMargins = UIEdgeInsets(top: 10, left: 50, bottom: 100, right: 50)
            stack.isLayoutMarginsRelativeArrangement = true
            stack.alpha=0.9
            stack.layer.cornerRadius=5
            return stack
                
        }()
        
        let bgImage:UIImageView={
                let image=UIImageView()
                image.translatesAutoresizingMaskIntoConstraints=false
                image.contentMode = .scaleAspectFill
                image.clipsToBounds=true
                image.image = .init(named: "login3")
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

        override func viewDidLoad() {
            super.viewDidLoad()
    //        view.backgroundColor = .systemMint
            view.addSubview(bgImage)
            view.sendSubviewToBack(bgImage)

            configureNavBar()
            addComponents()
            addConstraints()
            
            loginBtn.addTarget(self, action: #selector(navigate), for: .touchUpInside)
            backBtn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
            
        }
        
        @objc func navigate(){
            
            validateTextFields()
            
            var userCred : [String:Any] = [:]
            userCred["un"] = unTxt.text
            userCred["pw"] = pwTxt.text
            
            let profileVC = ProfileViewController()
            profileVC.userCred = userCred
            navigationController?.pushViewController(profileVC, animated: true)
        }
    
    @objc func navigateBack(){

        navigationController?.popViewController(animated: true)
    }
    
    func validateTextFields() -> Bool {
        let textFields: [UITextField] = [unTxt, pwTxt]
        
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
            unTxt.addSubview(lineViewUn)
            pwTxt.addSubview(lineViewPw)
            vstack.addArrangedSubview(unTxt)
            vstack.addArrangedSubview(pwTxt)
            view.addSubview(backBtn)
            view.addSubview(loginBtn)
            view.addSubview(vstack)

        }
        
        
        func addConstraints(){
            screenTitle.heightAnchor.constraint(equalToConstant: 100).isActive=true
            screenTitle.widthAnchor.constraint(equalToConstant: 200).isActive=true
            
            unTxt.widthAnchor.constraint(equalToConstant: 40).isActive=true
            
//            pwTxt.topAnchor.constraint(equalTo: unTxt.bottomAnchor,constant: 100).isActive=true
            
            lineViewUn.leadingAnchor.constraint(equalTo: unTxt.leadingAnchor).isActive=true
            lineViewUn.trailingAnchor.constraint(equalTo: unTxt.trailingAnchor).isActive=true
            lineViewUn.bottomAnchor.constraint(equalTo: unTxt.bottomAnchor).isActive=true
            lineViewUn.heightAnchor.constraint(equalToConstant: 1).isActive=true
            
            lineViewPw.leadingAnchor.constraint(equalTo: pwTxt.leadingAnchor).isActive=true
            lineViewPw.trailingAnchor.constraint(equalTo: pwTxt.trailingAnchor).isActive=true
            lineViewPw.bottomAnchor.constraint(equalTo: pwTxt.bottomAnchor).isActive=true
            lineViewPw.heightAnchor.constraint(equalToConstant: 1).isActive=true
            
            loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive=true
            loginBtn.widthAnchor.constraint(equalToConstant: 400).isActive=true
            loginBtn.topAnchor.constraint(equalTo: vstack.bottomAnchor, constant: 30).isActive=true
            loginBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive=true
            loginBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive=true
                    
            vstack.topAnchor.constraint(equalTo: backBtn.bottomAnchor,constant: 50).isActive=true
            vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive=true
            vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive=true
            
            bgImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
            bgImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
            
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
