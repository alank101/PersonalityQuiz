//
//  QuizViewController.swift
//  PersonalityQuiz
//
//  Created by DPI Student 32 on 11/8/22.
//

import UIKit

class AppOpenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var animalQuizButton: UIButton!
    
    @IBOutlet var instrumentQuizButton: UIButton!
    
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
        
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
