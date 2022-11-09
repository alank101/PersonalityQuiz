//
//  InstrumentQuestionsViewController.swift
//  PersonalityQuiz
//
//  Created by Alan Barry on 11/8/22.
//

import UIKit

class InstrumentQuestionsViewController: UIViewController {
    
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
    
    
    @IBSegueAction func showInstrumentResults(_ coder: NSCoder) -> InstrumentResultsViewController? {
        return InstrumentResultsViewController(coder: coder, responses: answersChosen)
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
            performSegue(withIdentifier: "instrumentResults", sender: nil)
        }
    }
    
    var questionIndex = 0
    
    var answersChosen: [InstrumentAnswer] = []
    
    var questions: [InstrumentQuestion] = [
        InstrumentQuestion(
            text: "Which activities do you enjoy?",
            type: .multiple,
            answers: [
                InstrumentAnswer(text: "Eating", type: .saxophone),
                InstrumentAnswer(text: "Swimming", type: .violin),
                InstrumentAnswer(text: "Sleeping", type: .piano),
                InstrumentAnswer(text: "Practicing", type: .trumpet)
            ].shuffled()
        ),
        InstrumentQuestion (
            text: "Which food group do you like most?",
            type: .single,
            answers: [
                InstrumentAnswer(text: "Meats", type: .saxophone),
                InstrumentAnswer(text: "Fruits", type: .violin),
                InstrumentAnswer(text: "Bread", type: .trumpet),
                InstrumentAnswer(text: "Sweets", type: .piano)
            ].shuffled()
        ),
        InstrumentQuestion(
            text: "How much do you enjoy car rides?",
            type: .ranged,
            answers: [
                InstrumentAnswer(text: "I dislike them", type: .trumpet),
                InstrumentAnswer(text: "I get a little nervous", type: .violin),
                InstrumentAnswer(text: "I barely notice them", type: .piano),
                InstrumentAnswer(text: "I love them", type: .saxophone)
            ]
        ),
        InstrumentQuestion(
            text: "What is your favorite toy?",
            type: .single,
            answers: [
                InstrumentAnswer(text: "Valves", type: .trumpet),
                InstrumentAnswer(text: "Strings", type: .violin),
                InstrumentAnswer(text: "Keys", type: .piano),
                InstrumentAnswer(text: "Buttons", type: .saxophone)
            ].shuffled()
        ),
        InstrumentQuestion(
            text: "How much do you like playing outside?",
            type: .ranged,
            answers: [
                InstrumentAnswer(text: "I hate it", type: .piano),
                InstrumentAnswer(text: "Not really my thing", type: .violin),
                InstrumentAnswer(text: "I enjoy the outdoors", type: .saxophone),
                InstrumentAnswer(text: "It's the best!", type: .trumpet)
            ]
        ),
        InstrumentQuestion(
            text: "Do you make friends easily?",
            type: .ranged,
            answers: [
                InstrumentAnswer(text: "No", type: .saxophone),
                InstrumentAnswer(text: "Not usually", type: .piano),
                InstrumentAnswer(text: "Sometimes", type: .violin),
                InstrumentAnswer(text: "Yes!", type: .trumpet)
            ]
        ),
        InstrumentQuestion(
            text: "What words describe you?",
            type: .multiple,
            answers: [
                InstrumentAnswer(text: "Boisterous", type: .trumpet),
                InstrumentAnswer(text: "Reserved", type: .piano),
                InstrumentAnswer(text: "Dextrous", type: .violin),
                InstrumentAnswer(text: "Loud", type: .saxophone)
            ].shuffled()
        ),
        InstrumentQuestion(
            text: "Where would you want to live?",
            type: .single,
            answers: [
                InstrumentAnswer(text: "Lake", type: .trumpet),
                InstrumentAnswer(text: "Woods", type: .piano),
                InstrumentAnswer(text: "Jungle", type: .violin),
                InstrumentAnswer(text: "Prairie", type: .saxophone)
            ].shuffled()
        ),
        InstrumentQuestion(
            text: "What settings do you enjoy?",
            type: .multiple,
            answers: [
                InstrumentAnswer(text: "In the woods", type: .piano),
                InstrumentAnswer(text: "With my family", type: .violin),
                InstrumentAnswer(text: "With everyone", type: .trumpet),
                InstrumentAnswer(text: "It depends", type: .saxophone)
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
    
    func updateSingleStack(using answers: [InstrumentAnswer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [InstrumentAnswer]) {
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
    
    func updateRangedStack(using answers: [InstrumentAnswer]) {
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
