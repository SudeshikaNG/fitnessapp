//
//  ExerciseCellTableViewCell.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-16.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    let ExerciseImage:UIImageView={
        let image=UIImageView()
        image.translatesAutoresizingMaskIntoConstraints=false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds=true
        image.image = .init(named: "headImg3")
        image.layer.cornerRadius=5
        return image
        }()
    
    let exeriseName:UILabel={
        let label=UILabel()
        label.text="Star Jumps"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .left
        label.font=UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let setsCount:UILabel={
        let label=UILabel()
        label.text="2 sets"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 15, weight: .thin)
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let repsCount:UILabel={
        let label=UILabel()
        label.text="10 reps"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 15, weight: .thin)
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let weight:UILabel={
        let label=UILabel()
        label.text="20 kg"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 15, weight: .thin)
        label.textColor = .gray
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let exerciseBtn:UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .clear
        button.setTitle("View", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font=UIFont.systemFont(ofSize: 12, weight: .bold)
        return button

    }()
    
    let hstackMain:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing=5
        stack.distribution = .fillProportionally
//        stack.layoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
//        stack.isLayoutMarginsRelativeArrangement = true
        return stack
            
    }()
    
    let hstack1:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing=2
        stack.distribution = .fillEqually
        return stack
            
    }()
    
    let vstack:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .vertical
        stack.spacing=50
        stack.distribution = .equalSpacing
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
            
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        super.backgroundColor = UIColor(red: 0.13, green: 0.13, blue: 0.12, alpha: 1.00)
        addComponents()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set (exercise:Exercise){
        ExerciseImage.image=exercise.image
        exeriseName.text=exercise.title
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
            // Do not call the super.setSelected() method
        }
    
    func addComponents(){
        
        hstack1.addArrangedSubview(setsCount)
        hstack1.addArrangedSubview(repsCount)
        hstack1.addArrangedSubview(weight)
        
        vstack.addArrangedSubview(exeriseName)
        vstack.addArrangedSubview(hstack1)
        
        hstackMain.addArrangedSubview(ExerciseImage)
        hstackMain.addArrangedSubview(vstack)
        hstackMain.addArrangedSubview(exerciseBtn)
        
        addSubview(hstackMain)
        
    }
    
    func addConstraints(){
        ExerciseImage.leadingAnchor.constraint(equalTo: hstackMain.leadingAnchor).isActive=true
        ExerciseImage.heightAnchor.constraint(equalToConstant: 80).isActive=true
        ExerciseImage.widthAnchor.constraint(equalToConstant: 50*16/9).isActive=true
//        ExerciseImage.leadingAnchor.constraint(equalTo: hstackMain.leadingAnchor, constant: 50).isActive=true
        
        hstackMain.centerYAnchor.constraint(equalTo: centerYAnchor).isActive=true
        hstackMain.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive=true
        hstackMain.trailingAnchor.constraint(equalTo: trailingAnchor).isActive=true
        
        exeriseName.topAnchor.constraint(equalTo: vstack.topAnchor, constant: 75).isActive=true
        exeriseName.leadingAnchor.constraint(equalTo: vstack.leadingAnchor, constant: 20).isActive=true
        
        hstack1.topAnchor.constraint(equalTo: exeriseName.bottomAnchor, constant: 15).isActive=true
        hstack1.bottomAnchor.constraint(equalTo: vstack.bottomAnchor, constant: -50).isActive=true
        hstack1.leadingAnchor.constraint(equalTo: ExerciseImage.trailingAnchor, constant: 2).isActive=true
        
        exerciseBtn.widthAnchor.constraint(equalToConstant: 50).isActive=true
        exerciseBtn.heightAnchor.constraint(equalToConstant: 25).isActive=true
        exerciseBtn.leadingAnchor.constraint(equalTo: hstack1.trailingAnchor).isActive=true
        exerciseBtn.trailingAnchor.constraint(equalTo: hstackMain.trailingAnchor, constant: 50).isActive=true
        
    }
    
}

