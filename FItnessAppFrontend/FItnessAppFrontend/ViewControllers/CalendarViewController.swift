//
//  RoutineViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-15.
//

import UIKit

class CalendarViewController: UIViewController, UICalendarSelectionSingleDateDelegate, UICalendarViewDelegate {
    
    var gender : Any?
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
        return true
    }
    
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        print("Date is: ", dateComponents )
        
        guard let gender = gender else{
            return
        }
        
        let dailyExerciseListVC=DailyExerciseListVC()
        dailyExerciseListVC.gender = gender
        navigationController?.pushViewController(dailyExerciseListVC, animated: true)
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        .image(UIImage(systemName: "checkmark"))
        
    }
        
        let navBar = UINavigationBar()
    
    let calendarView=UICalendarView()
    
    let titleLabel:UILabel={
        let label=UILabel()
        label.text="Workout Schedule"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .orange
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let tipImage:UIImageView={
            let image=UIImageView()
            image.translatesAutoresizingMaskIntoConstraints=false
            image.contentMode = .scaleAspectFill
            image.clipsToBounds=true
            image.image = .init(named: "tips")
            return image
        }()

    let vstack:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .vertical
        stack.spacing=10
        stack.distribution = .equalSpacing
        stack.backgroundColor = .black
        stack.isLayoutMarginsRelativeArrangement = true
        return stack

    }()
    
    let hstack:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .horizontal
        stack.spacing=5
        stack.distribution = .equalSpacing
        stack.backgroundColor = .white
        stack.isLayoutMarginsRelativeArrangement = true
        return stack

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
            view.backgroundColor = .black

            createCalendar()
            
            configureNavBar()
            addComponents()
            addConstraints()
            
            backBtn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)

        }

        @objc func navigateBack(){

            navigationController?.popViewController(animated: true)
        }

    func createCalendar(){
        calendarView.translatesAutoresizingMaskIntoConstraints=false
//        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.fontDesign = .rounded
        calendarView.tintColor = .red
        
        let selection=UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior=selection
        
        calendarView.delegate=self

    }

    func addComponents(){
        vstack.addArrangedSubview(backBtn)
        vstack.addArrangedSubview(tipImage)
        vstack.addArrangedSubview(titleLabel)
        hstack.addArrangedSubview(calendarView)
        view.addSubview(vstack)
        view.addSubview(hstack)
    }

    func addConstraints(){
        
        vstack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive=true
        
        hstack.topAnchor.constraint(equalTo: vstack.bottomAnchor).isActive=true
        hstack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive=true
        hstack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
        hstack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
        
        tipImage.topAnchor.constraint(equalTo: backBtn.bottomAnchor).isActive=true
        tipImage.heightAnchor.constraint(equalToConstant: view.bounds.size.height/5).isActive=true
        tipImage.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive=true
        tipImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive=true
        
        titleLabel.leadingAnchor.constraint(equalTo: vstack.leadingAnchor).isActive=true
        titleLabel.trailingAnchor.constraint(equalTo: vstack.trailingAnchor).isActive=true
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
            //navBar.setItems([navigationItem], animated: false)
            navigationItem.rightBarButtonItem=UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(showLogin))
            navBar.translatesAutoresizingMaskIntoConstraints=false
            navBar.heightAnchor.constraint(equalToConstant: 44).isActive=true
            navBar.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive=true
            navBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive=true
            navBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive=true
            navBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive=true
            navBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive=true
        }
        
    @objc func showLogin(){
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

    }



