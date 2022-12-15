//
//  CardSelectionVC.swift
//  CardWorkoutNew
//
//  Created by Maciej Michalik on 15/12/2022.
//
import UIKit

class CardSelectionVC: UIViewController {

    let cardImagView   = UIImageView()
    let stopButton     = CWButton(Color: .systemRed, title: "Stop!", systemImageName: "stop.circle")
    let rulesButton    = CWButton(Color: .systemBlue, title: "Rules", systemImageName: "list.bullet")
    let resetButton    = CWButton(Color: .systemGreen, title: "Reset", systemImageName: "repeat.circle" )
    
    var cards = CardDeck.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
   
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    @objc func stopTimer(){
        timer.invalidate()
    }
    @objc func restartTimer(){
        stopTimer()
        startTimer()
    }
    
    @objc func showRandomCard() {
        cardImagView.image = cards.randomElement()
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureResetButton()
        configureRulesButton()
    
    }
   
    func configureCardImageView() {
        view.addSubview(cardImagView)
        cardImagView.translatesAutoresizingMaskIntoConstraints = false
        cardImagView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImagView.widthAnchor.constraint(equalToConstant: 250),
            cardImagView.heightAnchor.constraint(equalToConstant: 350),
            cardImagView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImagView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
        
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImagView.bottomAnchor, constant: 30)
        ])
        
    }
    
    func configureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            
        ])
        
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesVC() {
            present(rulesVC(), animated: true)
    }
}
   
