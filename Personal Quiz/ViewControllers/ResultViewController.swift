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
        resultLabel.text = "Вы - \(resultAnswer.rawValue)"
        textResultLable.text = resultAnswer.definition
    }
   //MARK: - Private Methods
    private func getResultAnimal (answers: [Answer]) -> AnimalType? {
        var answerCounter : [AnimalType:Int] = [.cat:0, .dog:0, .rabbit:0, .turtle:0]
        for answer in answers {
            switch answer.type {
            case .cat:
                answerCounter[.cat]! += 1
            case .dog:
                answerCounter[.dog]! += 1
            case .rabbit:
                answerCounter[.rabbit]! += 1
            case .turtle:
                answerCounter[.turtle]! += 1
            }
        } //сделал подсчет животный по полученным ответам
        let maxValue = answerCounter.values.max() //нашел максимальное число
        for (key,_) in answerCounter {
            if answerCounter[key] == maxValue{
               return key
            } // пробежавшись по словарю определил ключ, которому соответствует макс значение
        }
        return nil
    }
}
