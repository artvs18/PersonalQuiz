//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultSublabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        resultLabel.text = "Вы - \(getResult().rawValue)"
        resultSublabel.text = getResult().definition
        
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getResult() ->  Animal{
        let answers = answersChosen.map { $0.animal }
        let answersCount = answers.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        let sortedAnswers = answersCount.sorted(by: { $0.value > $1.value })
        let result = sortedAnswers.first?.key ?? Animal.dog
        return result
    }
}

