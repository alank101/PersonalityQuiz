//
//  AnimalQuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Alan Barry on 11/7/22.
//

import UIKit

class AnimalQuestionsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        navigationItem.hidesBackButton = true
    }
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    @IBOutlet var quizProgressBar: UIProgressView!
    
    
    @IBSegueAction func showAnimalResults(_ coder: NSCoder) -> AnimalResultsViewController? {
        return AnimalResultsViewController(coder: coder, responses: answersChosen)
    }
    
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextquestion()
    }
    
    @IBAction func rangedAnswersButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextquestion()
    }
    
    
    @IBAction func multipleAnswersButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextquestion()
    }
    
    func nextquestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "animalResults", sender: nil)
        }
    }
    
    var questionIndex = 0
    
    var answersChosen: [AnimalAnswer] = []
    
    var questions: [AnimalQuestion] = [
        AnimalQuestion(
            text: "Which activities do you enjoy?",
            type: .multiple,
            answers: [
                AnimalAnswer(text: "Swimming", type: .turtle),
                AnimalAnswer(text: "Sleeping", type: .cat),
                AnimalAnswer(text: "Cuddling", type: .rabbit),
                AnimalAnswer(text: "Eating", type: .dog)
            ].shuffled()
        ),
        AnimalQuestion (
            text: "Which food do you like most?",
            type: .single,
            answers: [
                AnimalAnswer(text: "Steak", type: .dog),
                AnimalAnswer(text: "Fish", type: .cat),
                AnimalAnswer(text: "Carrots", type: .rabbit),
                AnimalAnswer(text: "Corn", type: .turtle)
            ].shuffled()
        ),
        AnimalQuestion(
            text: "How much do you enjoy car rides?",
            type: .ranged,
            answers: [
                AnimalAnswer(text: "I dislike them", type: .cat),
                AnimalAnswer(text: "I get a little nervous", type: .rabbit),
                AnimalAnswer(text: "I barely notice them", type: .turtle),
                AnimalAnswer(text: "I love them", type: .dog)
            ]
        ),
        AnimalQuestion(
            text: "What is your favorite toy?",
            type: .single,
            answers: [
                AnimalAnswer(text: "Mouse", type: .cat),
                AnimalAnswer(text: "Ball", type: .dog),
                AnimalAnswer(text: "Shells", type: .turtle),
                AnimalAnswer(text: "Straw", type: .rabbit)
            ].shuffled()
        ),
        AnimalQuestion(
            text: "How much do you like playing outside?",
            type: .ranged,
            answers: [
                AnimalAnswer(text: "I hate it", type: .cat),
                AnimalAnswer(text: "Not really my thing", type: .turtle),
                AnimalAnswer(text: "I enjoy the outdoors", type: .rabbit),
                AnimalAnswer(text: "It's the best!", type: .dog)
            ]
        ),
        AnimalQuestion(
            text: "Do you make friends easily?",
            type: .ranged,
            answers: [
                AnimalAnswer(text: "No", type: .cat),
                AnimalAnswer(text: "Not usually", type: .turtle),
                AnimalAnswer(text: "Sometimes", type: .rabbit),
                AnimalAnswer(text: "Yes!", type: .dog)
            ]
        ),
        AnimalQuestion(
            text: "What words describe you?",
            type: .multiple,
            answers: [
                AnimalAnswer(text: "Loyal", type: .dog),
                AnimalAnswer(text: "Mischevious", type: .cat),
                AnimalAnswer(text: "Cuddly", type: .rabbit),
                AnimalAnswer(text: "Protective", type: .turtle)
            ].shuffled()
        ),
        AnimalQuestion(
            text: "Where would you want to live?",
            type: .single,
            answers: [
                AnimalAnswer(text: "Lake", type: .turtle),
                AnimalAnswer(text: "Woods", type: .dog),
                AnimalAnswer(text: "Jungle", type: .cat),
                AnimalAnswer(text: "Prairie", type: .rabbit)
            ].shuffled()
        ),
        AnimalQuestion(
            text: "What settings do you enjoy?",
            type: .multiple,
            answers: [
                AnimalAnswer(text: "In the woods", type: .turtle),
                AnimalAnswer(text: "With my family", type: .rabbit),
                AnimalAnswer(text: "With everyone", type: .dog),
                AnimalAnswer(text: "It depends", type: .cat)
            ].shuffled()
        )
    ].shuffled()
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float (questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        quizProgressBar.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [AnimalAnswer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [AnimalAnswer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [AnimalAnswer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
