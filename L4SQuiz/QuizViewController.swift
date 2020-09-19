//
//  QuizViewController.swift
//  L4SQuiz
//
//  Created by 竹村明日香 on 2020/09/19.
//  Copyright © 2020 Takemura assan. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnser: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        quizArray.append(["フロアボールはどこ考案？", "シンガポール","スウェーデン","スイス",2])
        quizArray.append(["女子の代表、全体大会の順位は？", "13位","10位","8位",1])
        quizArray.append(["男子の代表、全体大会の順位は？", "16位","12位","15位",3])
        quizArray.append(["女子学生チームは全部で何チーム？", "10チーム","8チーム","6チーム",3])
        quizArray.append(["男子学生チームは全部で何チーム？", "7チーム","9チーム","8チーム",2])
        
        quizArray.shuffle()
        
        choiceQuiz()
        
        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz(){
        let tmpArray = quizArray[0] as! [Any]
        
        quizTextView.text = tmpArray[0] as? String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    
    @IBAction func choiceAnswer(sender: UIButton){
       let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            correctAnser = correctAnser + 1
        }
        
        quizArray.remove(at: 0)
        
        if quizArray.count == 0{
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnser
        }
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
