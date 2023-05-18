//
//  ExerciseDetailsViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-17.
//

import UIKit

class ExerciseDetailsViewController: UIViewController {
    
        private var countdownTimer: Timer?
        private var remainingSeconds = 10

        let navBar = UINavigationBar()
        
        let videoBtn:UIButton={
            let button=UIButton()
            button.translatesAutoresizingMaskIntoConstraints=false
            button.backgroundColor = .orange
            button.setTitle("How to Video", for: .normal)
            button.titleLabel?.font=UIFont.systemFont(ofSize: 18, weight: .bold)
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius=5
            return button
                
        }()
    
    let timerBtn:UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .center
        button.setTitle("Start ", for: .normal)
        button.titleLabel?.font=UIFont.systemFont(ofSize: 15, weight: .bold)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius=10
        return button
            
    }()
    
    let countdownLabel:UILabel={
        let label=UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .orange
        label.adjustsFontSizeToFitWidth=true
        label.text = String(format: "%02d:%02d", 00, 00)
        return label
            
    }()
    
    let pauseBtn:UIButton={
        let button=UIButton()
        button.translatesAutoresizingMaskIntoConstraints=false
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = .center
        button.setTitle("Pause ", for: .normal)
        button.titleLabel?.font=UIFont.systemFont(ofSize: 15, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius=10
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
    
    let hstack:UIStackView={
        let stack=UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints=false
        stack.axis = .horizontal
        stack.spacing=2
        stack.distribution = .fillProportionally
        stack.isLayoutMarginsRelativeArrangement = true
        stack.backgroundColor = .black
        return stack
            
    }()
         
        let headImage:UIImageView={
            let image=UIImageView()
            image.translatesAutoresizingMaskIntoConstraints=false
            image.contentMode = .scaleAspectFit
            image.clipsToBounds=true
            image.image = .init(named: "stareff")
            return image
            }()
        
    let titleLabel:UILabel={
        let label=UILabel()
        label.text="Star Jumps"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .orange
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let repsLabel:UILabel={
        let label=UILabel()
        label.text="Reps : 10"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 20, weight: .thin)
        label.textColor = .orange
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let setsLabel:UILabel={
        let label=UILabel()
        label.text="Sets : 2"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 20, weight: .thin)
        label.textColor = .orange
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let weightLabel:UILabel={
        let label=UILabel()
        label.text="Weight : 2kg"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 20, weight: .thin)
        label.textColor = .orange
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
    let durationLabel:UILabel={
        let label=UILabel()
        label.text="Time : 10 seconds"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textAlignment = .center
        label.font=UIFont.systemFont(ofSize: 20, weight: .thin)
        label.textColor = .orange
        label.adjustsFontSizeToFitWidth=true
        return label
            
    }()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            configureNavBar()
            addComponents()
            addConstraints()
            
            videoBtn.addTarget(self, action: #selector(playButtonClicked), for: .touchUpInside)
            
            timerBtn.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
            pauseBtn.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)

        }
    
        /////////////////////////////////////////////////////////////new codes///////////////////////////////////////////////////////////////////////////
        
    @objc func playButtonClicked() {
        guard let videoURL = URL(string: "https://youtu.be/lTbQQmpMZv4") else {
            // Handle invalid URL
            print("invalid url")
            return
        }

        let youtubePlayerViewController = YouTubePlayerViewController(videoURL: videoURL)
        youtubePlayerViewController.modalPresentationStyle = .overFullScreen
        present(youtubePlayerViewController, animated: true, completion: nil)
    }
    
    @objc private func startTimer() {
        startCountdown()
        hstack.addArrangedSubview(pauseBtn)
        pauseBtn.leadingAnchor.constraint(equalTo: countdownLabel.trailingAnchor).isActive=true
        pauseBtn.trailingAnchor.constraint(equalTo: hstack.trailingAnchor, constant: -50).isActive=true
        
        }
    
    private func startCountdown() {
            countdownTimer?.invalidate()
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
        }
    
    @objc private func updateCountdown() {
            remainingSeconds -= 1
            
            if remainingSeconds <= 0 {
                countdownTimer?.invalidate()
                countdownTimer = nil
                showAlert()
                updateUI()
                remainingSeconds=10
                hstack.removeArrangedSubview(pauseBtn)
            } else {
                updateUI()
            }
        }
    
    private func updateUI() {
        let minutes = remainingSeconds / 60
            let seconds = remainingSeconds % 60
            let timeString = String(format: "%02d:%02d", minutes, seconds)
            countdownLabel.text = timeString
        
    }
    
    private func showAlert() {
            let alertController = UIAlertController(title: "Countdown Finished", message: "The countdown timer has reached zero.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    
    @objc private func pauseButtonTapped() {
        if countdownTimer?.isValid == true {
            countdownTimer?.invalidate()
            countdownTimer = nil
            pauseBtn.setTitle("Resume", for: .normal)
        } else {
            countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
            pauseBtn.setTitle("Pause", for: .normal)
        }
    }

        
        func addComponents(){
            vstack2.addArrangedSubview(videoBtn)
            vstack2.addArrangedSubview(repsLabel)
            vstack2.addArrangedSubview(setsLabel)
            vstack2.addArrangedSubview(weightLabel)
            vstack2.addArrangedSubview(durationLabel)
            vstack2.addArrangedSubview(timerBtn)
            
            hstack.addArrangedSubview(countdownLabel)
//            hstack.addArrangedSubview(pauseBtn)
            
            vstack2.addArrangedSubview(hstack)
        
            view.addSubview(titleLabel)
            view.addSubview(headImage)
            view.addSubview(vstack2)
            
        }
        
        func addConstraints(){
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive=true
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
            
            
            videoBtn.heightAnchor.constraint(equalToConstant: 45).isActive=true
            videoBtn.leadingAnchor.constraint(equalTo: vstack2.leadingAnchor,constant: 70).isActive=true
            videoBtn.trailingAnchor.constraint(equalTo: vstack2.trailingAnchor,constant: -70).isActive=true
            
            timerBtn.heightAnchor.constraint(equalToConstant: 45).isActive=true
            timerBtn.leadingAnchor.constraint(equalTo: vstack2.leadingAnchor,constant: 150).isActive=true
            timerBtn.trailingAnchor.constraint(equalTo: vstack2.trailingAnchor,constant: -150).isActive=true
            
            countdownLabel.heightAnchor.constraint(equalToConstant: 45).isActive=true
            countdownLabel.leadingAnchor.constraint(equalTo: hstack.leadingAnchor,constant: 2).isActive=true
            
            repsLabel.topAnchor.constraint(equalTo: videoBtn.bottomAnchor, constant: 40).isActive=true
            setsLabel.topAnchor.constraint(equalTo: repsLabel.bottomAnchor, constant: 20).isActive=true
            weightLabel.topAnchor.constraint(equalTo: setsLabel.bottomAnchor, constant: 20).isActive=true
            durationLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20).isActive=true
            timerBtn.topAnchor.constraint(equalTo: durationLabel.bottomAnchor, constant: 40).isActive=true
            
            headImage.heightAnchor.constraint(equalToConstant: view.bounds.size.height/3).isActive=true
            headImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive=true
            headImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
            headImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
            
            vstack2.topAnchor.constraint(equalTo: headImage.bottomAnchor, constant: 20).isActive=true
            vstack2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive=true
            vstack2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive=true
            
            hstack.topAnchor.constraint(equalTo: timerBtn.bottomAnchor, constant: 15).isActive=true
            hstack.leadingAnchor.constraint(equalTo: vstack2.leadingAnchor, constant: 50).isActive=true
            hstack.trailingAnchor.constraint(equalTo: vstack2.trailingAnchor, constant: -50).isActive=true
    
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


