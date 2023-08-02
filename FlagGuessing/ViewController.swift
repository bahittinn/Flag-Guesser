//
//  ViewController.swift
//  FlagGuessing
//
//  Created by Bahittin on 1.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var labelAnswer: UILabel!
    
    var answeredQuestions = 0
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    override func viewDidLoad() {
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        labelAnswer.text = "Answered Question: 0"
        
        askQuestion()
    }
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased() + " = \(score)"
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        answeredQuestions += 1
        labelAnswer.text = "Answered Question: \(answeredQuestions)"
        
        if answeredQuestions == 10 {
            let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "End", style: .default, handler: nil))
            present(ac, animated: true)
            return
        }
        
        if sender.tag == correctAnswer {
            print("correct")
            score += 1
        }else {
            print("false")
            if score != 0 {
                score -= 1
            }
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

