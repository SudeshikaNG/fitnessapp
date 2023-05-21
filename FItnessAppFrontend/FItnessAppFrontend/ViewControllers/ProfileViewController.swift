//
//  ProfileViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-20.
//

import UIKit

class ProfileViewController: UIViewController {
        
        var userCred : [String:Any] = [:]
        
        var userData :User?
        
        let navBar = UINavigationBar()
        
        let screenTitle:UILabel={
            let label=UILabel()
            label.text="Profile Information"
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 25, weight: .bold)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
    
    let unLabel:UILabel={
        let label=UILabel()
        label.text="Username : "
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 18, weight: .thin)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth=true
        return label
        
    }()
    
    let unValLabel:UILabel={
        let label=UILabel()
//        label.text="BMI : "
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth=true
        return label
        
    }()
        
        let bmiLabel:UILabel={
            let label=UILabel()
            label.text="BMI : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .thin)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let bmiValLabel:UILabel={
            let label=UILabel()
    //        label.text="BMI : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let waterLabel:UILabel={
            let label=UILabel()
            label.text="Water Intake : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .thin)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let waterValLabel:UILabel={
            let label=UILabel()
    //        label.text="Water Intake : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let caloryLabel:UILabel={
            let label=UILabel()
            label.text="Calory Intake : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .thin)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let caloryValLabel:UILabel={
            let label=UILabel()
    //        label.text="Calory Intake : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let weightLabel:UILabel={
            let label=UILabel()
            label.text="Weight : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .thin)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let weightValLabel:UILabel={
            let label=UILabel()
    //        label.text="Weight : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let heightLabel:UILabel={
            let label=UILabel()
            label.text="Height :"
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .thin)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let heightValLabel:UILabel={
            let label=UILabel()
    //        label.text="Height :"
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let goalLabel:UILabel={
            let label=UILabel()
            label.text="Goal : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .thin)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let goalValLabel:UILabel={
            let label=UILabel()
    //        label.text="Goal : "
            label.translatesAutoresizingMaskIntoConstraints=false
            label.textAlignment = .center
            label.font=UIFont.systemFont(ofSize: 18, weight: .bold)
            label.textColor = .black
            label.adjustsFontSizeToFitWidth=true
            return label
            
        }()
        
        let workoutBtn:UIButton={
            let button=UIButton()
            button.translatesAutoresizingMaskIntoConstraints=false
            button.backgroundColor = .orange
            button.setTitle("View Workout Routine", for: .normal)
            button.titleLabel?.font=UIFont.systemFont(ofSize: 18, weight: .bold)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius=10
            return button
            
        }()
        
        let vstack:UIStackView={
            let stack=UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints=false
            stack.axis = .vertical
            stack.spacing=50
            stack.distribution = .equalSpacing
            stack.backgroundColor = .white
            stack.layoutMargins = UIEdgeInsets(top: 5, left: 50, bottom: 30, right: 50)
            stack.isLayoutMarginsRelativeArrangement = true
            stack.alpha=0.8
            stack.layer.cornerRadius=5
            return stack
            
        }()
    
    let hstack0:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing=10
        stack.distribution = .fillProportionally
        return stack
        
    }()
    
        
        let hstack1:UIStackView={
            let stack=UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints=false
            stack.axis = .horizontal
            stack.alignment = .center
            stack.spacing=10
            stack.distribution = .fillProportionally
            return stack
            
        }()
        
        let hstack2:UIStackView={
            let stack=UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints=false
            stack.axis = .horizontal
            stack.alignment = .center
            stack.spacing=10
            stack.distribution = .fillProportionally
            return stack
            
        }()
        
        let hstack3:UIStackView={
            let stack=UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints=false
            stack.axis = .horizontal
            stack.alignment = .center
            stack.spacing=10
            stack.distribution = .fillProportionally
            return stack
            
        }()
        
        let hstack4:UIStackView={
            let stack=UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints=false
            stack.axis = .horizontal
            stack.alignment = .center
            stack.spacing=10
            stack.distribution = .fillProportionally
            return stack
            
        }()
        
        let hstack5:UIStackView={
            let stack=UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints=false
            stack.axis = .horizontal
            stack.alignment = .center
            stack.spacing=10
            stack.distribution = .fillProportionally
            return stack
            
        }()
        
        let hstack6:UIStackView={
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
            image.image = .init(named: "fmres")
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
            view.addSubview(bgImage)
            view.sendSubviewToBack(bgImage)
            
            configureNavBar()
            addComponents()
            addConstraints()
            
            let anonymousFunction={
                (fetchedUser:User) in
                DispatchQueue.main.async {
                    self.userData = fetchedUser
                    print("user details")
                    print(self.userData)
                    self.setData()
                }
            }
            
            fetchDataFromApi(onCompletion: anonymousFunction)
            
    //        print("***************")
    //        print(userData)
            
            backBtn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
            workoutBtn.addTarget(self, action: #selector(navigateExercise), for: .touchUpInside)
            
        }
        
    @objc func navigateBack(){

        navigationController?.popViewController(animated: true)
    }
        
        @objc func navigateExercise(){
            
            let exerciseListVC=ExerciseListVC()
            exerciseListVC.gender=userData?.gender
            navigationController?.pushViewController(exerciseListVC, animated: true)
        }
        
        func fetchDataFromApi(onCompletion: @escaping (User) -> Void) {
            
            print("inside fetch api")
            var urlString: String
            
            if let un = userCred["un"], let pw = userCred["pw"] {
                print(un)
                urlString = "http://localhost:8080/user/\(un)/\(pw)"

                print("baseurl")
                print(urlString)
                
                guard let url = URL(string: urlString) else {
                    print("Error creating URL")
                    return
                }
                
    //           var request = URLRequest(url: url)
    //            request.timeoutInterval=60
                
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print("Error fetching data: \(error.localizedDescription)")
                        return
                    }
                    
                    guard let data = data else {
                        print("Data is nil")
                        return
                    }
                    
                    print("data")
                    print(data)
                    do {
                        let decoder = JSONDecoder()
                        let userResponse = try decoder.decode(APIResponse.self, from: data)
                        let user=userResponse.data.first
                        print("userResponse")
                        print(user)
                        onCompletion(user!)
                    } catch {
                        print("Error decoding user data: \(error.localizedDescription)")
                    }
                }
                
                task.resume()
            }
        }
        
        func setData(){
            
            guard let user = userData else {
                
                return
            }
            
            let bmi = ( user.bmi * 100).rounded()/100
            unValLabel.text=user.username
            bmiValLabel.text="\(bmi)"
            weightValLabel.text="\(user.weight)"
            heightValLabel.text="\(user.height)"

            if (user.gender == "female"){
                waterValLabel.text="2.7 Litres"
                caloryValLabel.text="2400-3000"
                goalValLabel.text="Weight Gain"
            }else{
                waterValLabel.text = "3.7 L"
                caloryValLabel.text="2800-3500"
                goalValLabel.text="Fat Loss"
            }
        
        }
        
        
        func addComponents(){
            
            hstack0.addArrangedSubview(unLabel)
            hstack0.addArrangedSubview(unValLabel)
            
            hstack1.addArrangedSubview(bmiLabel)
            hstack1.addArrangedSubview(bmiValLabel)
            
            hstack2.addArrangedSubview(weightLabel)
            hstack2.addArrangedSubview(weightValLabel)
            
            hstack3.addArrangedSubview(heightLabel)
            hstack3.addArrangedSubview(heightValLabel)
            
            hstack4.addArrangedSubview(waterLabel)
            hstack4.addArrangedSubview(waterValLabel)
            
            hstack5.addArrangedSubview(caloryLabel)
            hstack5.addArrangedSubview(caloryValLabel)
            
            hstack6.addArrangedSubview(goalLabel)
            hstack6.addArrangedSubview(goalValLabel)
            
            vstack.addArrangedSubview(screenTitle)
            vstack.addArrangedSubview(hstack0)
            vstack.addArrangedSubview(hstack1)
            vstack.addArrangedSubview(hstack2)
            vstack.addArrangedSubview(hstack3)
            vstack.addArrangedSubview(hstack4)
            vstack.addArrangedSubview(hstack5)
            vstack.addArrangedSubview(hstack6)
            vstack.addArrangedSubview(workoutBtn)
            
            view.addSubview(vstack)
//            view.addSubview(backBtn)
            
        }
        
        func addConstraints(){
            
            vstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive=true
            vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive=true
            vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive=true
            
            bmiLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor,constant: 40).isActive=true
            weightLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor,constant: 20).isActive=true
            heightLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor).isActive=true
            waterLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor).isActive=true
            caloryLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor).isActive=true
            goalLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor).isActive=true
            unLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor).isActive=true
            
            bmiValLabel.trailingAnchor.constraint(equalTo: vstack.trailingAnchor).isActive=true
            weightValLabel.trailingAnchor.constraint(equalTo: vstack.trailingAnchor).isActive=true
            heightValLabel.trailingAnchor.constraint(equalTo: vstack.trailingAnchor).isActive=true
            waterValLabel.trailingAnchor.constraint(equalTo: vstack.trailingAnchor).isActive=true
            caloryValLabel.trailingAnchor.constraint(equalTo: vstack.trailingAnchor).isActive=true
            goalValLabel.trailingAnchor.constraint(equalTo: vstack.trailingAnchor).isActive=true
            unValLabel.trailingAnchor.constraint(equalTo: vstack.trailingAnchor).isActive=true
            
            workoutBtn.heightAnchor.constraint(equalToConstant: 50).isActive=true
            workoutBtn.widthAnchor.constraint(equalToConstant: 10).isActive=true
            
//            backBtn.heightAnchor.constraint(equalToConstant: 30).isActive=true
//            backBtn.topAnchor.constraint(equalTo: vstack.bottomAnchor, constant: 20).isActive=true
//            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25).isActive=true
//            backBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -280).isActive=true
            
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

