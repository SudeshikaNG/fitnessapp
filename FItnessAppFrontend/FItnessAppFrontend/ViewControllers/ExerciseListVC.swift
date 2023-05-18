//
//  ExerciseListVC.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-16.
//

import UIKit

class ExerciseListVC: UIViewController {
    let navBar = UINavigationBar()

    var tableView = UITableView()
    
    var exercise : [Exercise]=[]
    
    struct Cells{
        static let exerciseCell="ExerciseCell"
    }
    
    let calendarBtn:UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .orange
        button.setTitle("View Calendar", for: .normal)
        button.titleLabel?.font=UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        return button
            
    }()

let vstack2:UIStackView={
    let stack=UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints=false
    stack.axis = .vertical
    stack.spacing=50
    stack.distribution = .equalSpacing
    stack.backgroundColor = .white
    stack.isLayoutMarginsRelativeArrangement = true
    stack.backgroundColor = .black
    return stack
        
}()
     
    let headImage:UIImageView={
        let image=UIImageView()
        image.translatesAutoresizingMaskIntoConstraints=false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds=true
        image.image = .init(named: "headImg3")
        return image
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        addComponents()
        addConstraints()
        
        exercise=fetchData()//populate array with image list
        configureTableView()
        
        calendarBtn.addTarget(self, action: #selector(navigateCalendar), for: .touchUpInside)
        
    }
    

    func configureTableView(){
//        vstack2.addArrangedSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //set row height
        tableView.rowHeight=100
        //register cells
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: Cells.exerciseCell)
        //set constraints
        tableView.pin(to: view)
        
        tableView.backgroundColor=UIColor(red: 0.13, green: 0.13, blue: 0.12, alpha: 1.00)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /////////////////////////////////////////////////////////////new codes///////////////////////////////////////////////////////////////////////////
    
    @objc func navigateCalendar(){
        let calendarVC=CalendarViewController()
        navigationController?.pushViewController(calendarVC, animated: true)
    }
    
    func addComponents(){
        vstack2.addArrangedSubview(calendarBtn)
//        vstack2.addArrangedSubview(tableView)
    
        view.addSubview(headImage)
        view.addSubview(vstack2)
        view.addSubview(tableView)
    }
    
    func addConstraints(){
        
        calendarBtn.heightAnchor.constraint(equalToConstant: 45).isActive=true
        
        headImage.heightAnchor.constraint(equalToConstant: view.bounds.size.height/4).isActive=true
        headImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive=true
        headImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
        headImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
        
        vstack2.topAnchor.constraint(equalTo: headImage.bottomAnchor, constant: 20).isActive=true
        vstack2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
        vstack2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
        
        tableView.topAnchor.constraint(equalTo: vstack2.bottomAnchor, constant: 5).isActive=true
//        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
//        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
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

extension ExerciseListVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercise.count
    }
    
    //what cells showing
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: Cells.exerciseCell) as! ExerciseCell
        let exercise=exercise[indexPath.row]
        cell.set(exercise: exercise)
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    
}

//dummy data
extension ExerciseListVC{
    func fetchData()->[Exercise]{
        let img1=Exercise(image: Images.img1!, title: "Star Jumps")
        let img2=Exercise (image: Images.img2!, title: "Ex2")
        
        return[img1,img2]
    }
}
