//
//  SecondGetStartedViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-14.
//

import UIKit

class SecondGetStartedViewController: UIViewController, UITextFieldDelegate {
    
    var userDetails : [String:Any] = [:]
    
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
        textField.keyboardType = .default
        textField.textColor = .orange
        textField.placeholder="Weight"
        textField.attributedPlaceholder=NSAttributedString(string: "Weight", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textField.autocorrectionType = .no
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
        textField.keyboardType = .default
        textField.textColor = .orange
        textField.placeholder="Height"
        textField.attributedPlaceholder=NSAttributedString(string: "Height", attributes: [NSAttributedString.Key.foregroundColor:UIColor.gray])
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        textField.autocorrectionType = .no
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
        label.textColor = .black
        label.backgroundColor = .orange
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
        checkBox.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
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
        checkBox.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
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
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 50, bottom: 0, right: 50)
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
    
    @objc func goalSelected(_ sender:UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender == goalOneCheckBoxBtn{
            if sender.isSelected{
                sender.backgroundColor = .orange
                goalTwoCheckBoxBtn.backgroundColor = view.backgroundColor
                goalTwoCheckBoxBtn.isSelected=false
                userDetails["goal"]="wg"
                print("goal 1 selected")
                
            }
            else{
                goalTwoCheckBoxBtn.isSelected=true
                sender.backgroundColor = view.backgroundColor
                goalTwoCheckBoxBtn.backgroundColor = .orange
                userDetails["goal"]="fl"
                print("goal 2 deselected")
            }
        }
        else if sender == goalTwoCheckBoxBtn{
            if sender.isSelected{
                goalOneCheckBoxBtn.isSelected=false
                sender.backgroundColor = .orange
                goalOneCheckBoxBtn.backgroundColor = view.backgroundColor
                userDetails["goal"]="fl"
                print("goal 2 selected")
                
            }
            else{
                goalOneCheckBoxBtn.isSelected=true
                sender.backgroundColor = view.backgroundColor
                goalOneCheckBoxBtn.backgroundColor = .orange
                userDetails["goal"]="wg"
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
        backBtn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
        
    }
    
    @objc func navigate(){
        validateTextFields()
        
        if userDetails["goal"] == nil{
            showAlert()
        }
        else{
            userDetails["weight"] = weightTxt.text
            userDetails["height"] = heightTxt.text
            userDetails["m_id"]=UUID().uuidString
            userDetails["bmi"] = calculateBMI()

            print("secondvc")
            print(userDetails)
            
            sendDataToAPI()
            
            let resultsVC = ResultsViewController()
            resultsVC.userDetails=userDetails
            navigationController?.pushViewController(resultsVC, animated: true)
        }
    
    }
    
    @objc func navigateBack(){

        navigationController?.popViewController(animated: true)
    }
    
    func validateTextFields() -> Bool {
        let textFields: [UITextField] = [weightTxt, heightTxt]
        
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
    
    func calculateBMI()->Double{
        let weightText = weightTxt.text!
        let heightText = heightTxt.text!
        let weight = Double(weightText)!
        let height = Double(heightText)!
        
        return weight / (height * height)
    }
    
    func sendDataToAPI(){
        
        // Define the API endpoint URL
        guard let url = URL(string: "http://localhost:8080/user") else {
            print("Invalid URL")
            return
        }
        
        // Create the HTTP request object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Adjust the HTTP method as per your API requirements
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // Set the appropriate Content-Type header
        
        // Create a dictionary with the data you want to send
        
        do {
            // Convert the dictionary to JSON data
            let jsonData = try JSONSerialization.data(withJSONObject: userDetails, options: [])
            
            // Attach the JSON data to the request
            request.httpBody = jsonData
            
            // Create a URLSession and initiate the data task
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                // Process the API response
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        // Request successful
                        if let responseData = data {
                            // Parse and handle the response data
                            print("success")
                            print(data)
                        }
                    } else {
                        // Request failed with an error status code
                        print("Error status code: \(httpResponse.statusCode)")
                    }
                }
            }
            
            // Start the data task
            task.resume()
        } catch {
            print("Error converting data to JSON: \(error)")
        }
        
        
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
        view.addSubview(backBtn)
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
        
//        heightTxt.topAnchor.constraint(equalTo: weightTxt.bottomAnchor, constant: 50).isActive=true
        
//        vstack2.topAnchor.constraint(equalTo: heightTxt.bottomAnchor, constant: 20).isActive=true
        
        hstack.topAnchor.constraint(equalTo: goalLabel.bottomAnchor,constant: 30).isActive=true
        hstack.leadingAnchor.constraint(equalTo: vstack2.leadingAnchor).isActive=true
        hstack.trailingAnchor.constraint(equalTo: vstack2.trailingAnchor).isActive=true
        
        nextBtn.heightAnchor.constraint(equalToConstant: 50).isActive=true
        nextBtn.widthAnchor.constraint(equalToConstant: 400).isActive=true
        nextBtn.topAnchor.constraint(equalTo: vstack.bottomAnchor, constant: 20).isActive=true
        nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive=true
        nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive=true
        
        vstack.topAnchor.constraint(equalTo: backBtn.bottomAnchor,constant: 20).isActive=true
        vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive=true
        vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive=true
        
        goalLabel.heightAnchor.constraint(equalToConstant: 40).isActive=true
        goalLabel.widthAnchor.constraint(equalToConstant: 10).isActive=true
        
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
