//
//  SecondGetStartedViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-14.
//

import UIKit

class SecondGetStartedViewController: UIViewController {
        
        let navBar = UINavigationBar()
        
        let screenTitle:UILabel={
            let label=UILabel()
            label.text="Additional Information"
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 25, weight: .bold)
            label.textColor = .white
            label.adjustsFontSizeToFitWidth=true
            return label
                
        }()
        
        let weightTxt:UITextField={
            let textField=UITextField()
            textField.translatesAutoresizingMaskIntoConstraints=false
            textField.borderStyle = .bezel
            textField.keyboardType = .numberPad
            textField.textColor = .white
            textField.placeholder="Weight"
            textField.attributedPlaceholder=NSAttributedString(string: "Weight", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
            textField.borderStyle = .none
            textField.backgroundColor = .clear
            return textField
                
        }()
    
    let weightUnit:UILabel={
        let label=UILabel()
        label.text="kg"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .right
        label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
        
        let heightTxt:UITextField={
            let textField=UITextField()
            textField.translatesAutoresizingMaskIntoConstraints=false
            textField.borderStyle = .bezel
            textField.keyboardType = .numberPad
            textField.textColor = .white
            textField.placeholder="Height"
            textField.attributedPlaceholder=NSAttributedString(string: "Height", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
            textField.borderStyle = .none
            textField.backgroundColor = .clear
            return textField
                
        }()
    
    let heightUnit:UILabel={
        let label=UILabel()
        label.text="m"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .right
        label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth=true
        return label
            
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
    
    let goalLabel:UILabel={
        let label=UILabel()
        label.text="Your Goal "
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
        
        let goalOneCheckBoxBtn:UIButton={
            let checkBox=UIButton()
            checkBox.translatesAutoresizingMaskIntoConstraints=false
            checkBox.setImage(UIImage(named: "unchecked"), for: .normal)
            checkBox.setImage(UIImage(named: "checked"), for: .selected)
            checkBox.setTitle("Weight Gain", for: .normal)
            checkBox.setTitleColor(.white, for: .normal)
            checkBox.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            checkBox.layer.cornerRadius=5
            checkBox.addTarget(self, action: #selector(goalSelected(_:)), for: .touchUpInside)
            return checkBox
        }()
        
        let goalTwoCheckBoxBtn:UIButton={
            let checkBox=UIButton()
            checkBox.translatesAutoresizingMaskIntoConstraints=false
            checkBox.setImage(UIImage(named: "unchecked"), for: .normal)
            checkBox.setImage(UIImage(named: "checked"), for: .selected)
            checkBox.setTitle("Fat Loss", for: .normal)
            checkBox.setTitleColor(.white, for: .normal)
            checkBox.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
            checkBox.layer.cornerRadius=5
            checkBox.addTarget(self, action: #selector(goalSelected(_:)), for: .touchUpInside)
            return checkBox
        }()
        
    let vstack2:UIStackView={
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
            stack.layoutMargins = UIEdgeInsets(top: 50, left: 50, bottom: 5, right: 50)
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
            stack.spacing=10
            stack.distribution = .fillProportionally
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
        
        @objc func goalSelected(_ sender:UIButton){
            sender.isSelected = !sender.isSelected
            
            if sender == goalOneCheckBoxBtn{
                if sender.isSelected{
                    sender.backgroundColor = .orange
                    goalTwoCheckBoxBtn.backgroundColor = view.backgroundColor
                    goalTwoCheckBoxBtn.isSelected=false
                    print("goal 1 selected")
                    
                }
                else{
                    goalTwoCheckBoxBtn.isSelected=true
                    sender.backgroundColor = view.backgroundColor
                    goalTwoCheckBoxBtn.backgroundColor = .orange
                    print("goal 2 deselected")
                }
            }
            else if sender == goalTwoCheckBoxBtn{
                if sender.isSelected{
                    goalOneCheckBoxBtn.isSelected=false
                    sender.backgroundColor = .orange
                    goalOneCheckBoxBtn.backgroundColor = view.backgroundColor
                    print("goal 2 selected")
                    
                }
                else{
                    goalOneCheckBoxBtn.isSelected=true
                    sender.backgroundColor = view.backgroundColor
                    goalOneCheckBoxBtn.backgroundColor = .orange
                    print("goal 2 deselected")
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
            let resultsVC = ResultsViewController()
            navigationController?.pushViewController(resultsVC, animated: true)
        }
        
        func addComponents(){
            //view.addSubview(screenTitle)
            vstack.addArrangedSubview(screenTitle)
            weightTxt.addSubview(lineViewName)
            heightTxt.addSubview(lineViewAge)
            vstack.addArrangedSubview(weightTxt)
            vstack.addArrangedSubview(heightTxt)
            hstack.addArrangedSubview(goalOneCheckBoxBtn)
            hstack.addArrangedSubview(goalTwoCheckBoxBtn)
            vstack2.addArrangedSubview(goalLabel)
            vstack2.addArrangedSubview(hstack)
            vstack.addArrangedSubview(vstack2)
            view.addSubview(nextBtn)
            view.addSubview(vstack)
            
            weightTxt.rightView = weightUnit
            weightTxt.rightViewMode = .always
            
            heightTxt.rightView = heightUnit
            heightTxt.rightViewMode = .always
        }
        
        
        func addConstraints(){
            screenTitle.heightAnchor.constraint(equalToConstant: 100).isActive=true
            screenTitle.widthAnchor.constraint(equalToConstant: 200).isActive=true
            
            weightTxt.widthAnchor.constraint(equalToConstant: 40).isActive=true
            
            //heightTxt.topAnchor.constraint(equalTo: weightTxt.bottomAnchor,constant: 80).isActive=true
            
            lineViewName.leadingAnchor.constraint(equalTo: weightTxt.leadingAnchor).isActive=true
            lineViewName.trailingAnchor.constraint(equalTo: weightTxt.trailingAnchor).isActive=true
            lineViewName.bottomAnchor.constraint(equalTo: weightTxt.bottomAnchor).isActive=true
            lineViewName.heightAnchor.constraint(equalToConstant: 1).isActive=true
            
            lineViewAge.leadingAnchor.constraint(equalTo: heightTxt.leadingAnchor).isActive=true
            lineViewAge.trailingAnchor.constraint(equalTo: heightTxt.trailingAnchor).isActive=true
            lineViewAge.bottomAnchor.constraint(equalTo: heightTxt.bottomAnchor).isActive=true
            lineViewAge.heightAnchor.constraint(equalToConstant: 1).isActive=true
            
            vstack2.topAnchor.constraint(equalTo: heightTxt.bottomAnchor, constant: 35).isActive=true
            
            hstack.leadingAnchor.constraint(equalTo: vstack2.leadingAnchor).isActive=true
            hstack.trailingAnchor.constraint(equalTo: vstack2.trailingAnchor).isActive=true
            
            nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive=true
            nextBtn.widthAnchor.constraint(equalToConstant: 400).isActive=true
//            nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive=true
//            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
//            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
                    
            vstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 80).isActive=true
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
