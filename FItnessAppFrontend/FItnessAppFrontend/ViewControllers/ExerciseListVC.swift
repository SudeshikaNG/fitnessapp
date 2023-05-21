//
//  ExerciseListVC.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-16.
//

import UIKit

class ExerciseListVC: UIViewController {
    
    var gender : Any?
    
    let navBar = UINavigationBar()

    var tableView = UITableView()
    
    var exercise = [Exercise]()
    
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
        
        configureNavBar()
        addComponents()
        addConstraints()
        
        let anonymousFunction={
            (fetchedExerciseList:[Exercise]) in
            DispatchQueue.main.async {
                self.exercise = fetchedExerciseList
                self.tableView.reloadData()
            }
        }
        
        fetchDataFromApi(onCompletion: anonymousFunction)
        
//        exercise=fetchData()//populate array with image list
        configureTableView()
        
        calendarBtn.addTarget(self, action: #selector(navigateCalendar), for: .touchUpInside)
        backBtn.addTarget(self, action: #selector(navigateBack), for: .touchUpInside)
        
    }
    
    
    func fetchDataFromApi(onCompletion: @escaping ([Exercise])->()){
        
        if let gender = gender{
            print(gender)
            let urlSring="http://localhost:8080/exercises/\(gender)"
            guard let url=URL(string: urlSring) else{
                print("error getting url")
                return
            }
            
            //request to url - task+urlsession
            let task=URLSession.shared.dataTask(with: url){
                (data, res, error) in
                
                print(String(data: data!, encoding: .utf8))
                
                //check if data is nill
                guard let data = data else{
                    print("data is nil")
                    return
                }
                
                
                //decode json data
                guard let workoutsResponse=try? JSONDecoder().decode(Workouts.self, from: data)
                else{
                    print("Error decoding workouts data: \(error?.localizedDescription ?? "")")
                    return
                }
                
                print(workoutsResponse.data)
                onCompletion(workoutsResponse.data)
                
            }
            task.resume()
        }
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
        guard let gender=gender else{
            return 
        }
        let calendarVC=CalendarViewController()
        calendarVC.gender = gender
        navigationController?.pushViewController(calendarVC, animated: true)
    }
    
    @objc func navigateBack(){

        navigationController?.popViewController(animated: true)
    }
    
    func addComponents(){
        vstack2.addArrangedSubview(calendarBtn)
//        vstack2.addArrangedSubview(tableView)
    
        view.addSubview(headImage)
        view.addSubview(vstack2)
        view.addSubview(tableView)
        view.addSubview(backBtn)
    }
    
    func addConstraints(){
        
        calendarBtn.heightAnchor.constraint(equalToConstant: 45).isActive=true
        
        headImage.heightAnchor.constraint(equalToConstant: view.bounds.size.height/4).isActive=true
        headImage.topAnchor.constraint(equalTo: backBtn.topAnchor, constant: -5).isActive=true
        headImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
        headImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
        
        vstack2.topAnchor.constraint(equalTo: headImage.bottomAnchor, constant: 20).isActive=true
        vstack2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
        vstack2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
        
        tableView.topAnchor.constraint(equalTo: vstack2.bottomAnchor, constant: 5).isActive=true
//        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
//        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        
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
            //navBar.setItems([navigationItem], animated: false)
            navigationItem.rightBarButtonItem=UIBarButtonItem(image: UIImage(systemName: "person.circle.fill"), style: .plain, target: self, action: #selector(showLogin()))
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //passing data
        let exerciseData=exercise[indexPath.row]
        //navigate
        let exDetailsVC = ExerciseDetailsViewController()
        exDetailsVC.exerciseData=exerciseData
        navigationController?.pushViewController(exDetailsVC, animated: true)
    }
    
    
}

////dummy data
//extension ExerciseListVC{
//    func fetchData()->[Exercise]{
//        let img1=Exercise(image: Images.img1!, title: "Star Jumps")
//        let img2=Exercise (image: Images.img2!, title: "Ex2")
//
//        return[img1,img2]
//    }
//}

