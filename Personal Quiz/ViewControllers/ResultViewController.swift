//
//  ResultViewController.swift
//  Personal Quiz
//
//  Created by 18992227 on 31.05.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textResultLable: UILabel!
    var answers: [Answer] = [] //собранные ответы
    
  //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true) //спрятали кнопку back
        guard let resultAnswer = getResultAnimal(answers: answers) else { return}
        updateUI(resultAnswer: resultAnswer)
    }
   //MARK: - Private Methods
    private func getResultAnimal (answers: [Answer]) -> AnimalType? {
        var answerCounter : [AnimalType:Int] = [:]
        let animals = answers.map {$0.type}
        
        for animal in animals {
            if let animalValue = answerCounter[animal] {
                answerCounter.updateValue(animalValue + 1, forKey: animal) } else { answerCounter[animal] = 1}
            }
        return answerCounter.sorted {$0.value > $1.value}.first?.key ?? nil
       
    }
    func updateUI (resultAnswer: AnimalType) {
        resultLabel.text = "Вы - \(resultAnswer.rawValue)"
        textResultLable.text = resultAnswer.definition
    }
}
