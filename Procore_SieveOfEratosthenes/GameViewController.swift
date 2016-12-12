//
//  GameViewController.swift
//  Procore_SieveOfEratosthenes
//
//  Created by Xini Yang on 12/6/16.
//  Copyright © 2016 Xini Yang. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var White1: UIButton!
    
    @IBOutlet weak var White2: UIButton!
    
    @IBOutlet weak var White3: UIButton!
    
    
    @IBOutlet weak var White4: UIButton!
    
    
    @IBOutlet weak var White5: UIButton!
  
    
    @IBOutlet weak var White6: UIButton!
    
    @IBOutlet weak var White7: UIButton!
    
    @IBOutlet weak var White8: UIButton!
    @IBOutlet weak var BackHome: UIButton!
    
    @IBOutlet weak var White9: UIButton!
    
    @IBOutlet weak var White10: UIButton!
    
    @IBOutlet weak var White11: UIButton!
    
    @IBOutlet weak var White12: UIButton!
    @IBOutlet weak var White13: UIButton!
    
    @IBOutlet weak var White14: UIButton!
    @IBOutlet weak var White15: UIButton!
    
    @IBOutlet weak var Instruction: UITextView!
    @IBOutlet weak var StartGame: UIButton!
    
    @IBOutlet weak var ScoreRecord: UILabel!
    
    @IBOutlet weak var GameStop: UIButton!
    @IBOutlet weak var A0: UILabel!
    @IBOutlet weak var YourScore: UILabel!
    var max: NSInteger = NSInteger()
    var limit: NSInteger = NSInteger()
    var sieveObj: SieveAlgo!
    var sieveObj2: SieveAlgo!
    var receivedMin: Int!
    var receivedMax: Int!
    var receivedMin2: Int!
    var receivedMax2: Int!
    var sieveArray: Array<Bool>!
    var PrimeArray: Array<Int>!
    var nonPrimeArray: Array<Int>!
    var nonPrimeArray2: Array<Int>!
    var str: String = ""
    var Score = Int()
    var HighScore = Int()
    var scoreLabel = UILabel()
    var miss = Int()
    var second = 0.0
    var timer = Timer()
    var gamedone = false
    var line1click = false
    var line2click = false
    var line3click = false
    var line4click = false
    var line5click = false
    var startstop = false
    override func viewDidLoad() {
        super.viewDidLoad()
        receivedMin = limit
        receivedMax = max
        receivedMin2 = 2
        receivedMax2 = 100
        sieveObj = SieveAlgo(mini: receivedMin, maxi: receivedMax)
        sieveObj2 = SieveAlgo(mini: receivedMin2, maxi: receivedMax2)
        sieveObj2.compute()
        sieveObj.compute()
        updateAllArray()
        White1.isHidden = true
        White2.isHidden = true
        White3.isHidden = true
        White4.isHidden = true
        White5.isHidden = true
        White7.isHidden = true
        White8.isHidden = true
        White9.isHidden = true
        White10.isHidden = true
        White11.isHidden = true
        White12.isHidden = true
        White13.isHidden = true
        White14.isHidden = true
        White15.isHidden = true
        GameStop.isHidden = true
        GameStop.isHidden = true
        BackHome.isHidden = false
        Instruction.isHidden = false
        let A: UInt32 = UInt32(PrimeArray.count)
        let B: UInt32 = UInt32(nonPrimeArray.count)
        
        
        if (A==0){
            A0.text = ("Number Of Prime Number is Zero.\nCannot Start Game.\nPlease Reenter the Range")
            StartGame.isHidden = true
            GameStop.isHidden = false
            
        }else if (B==0){
            A0.text = ("Number Of Non Prime Number is Zero.\nCannot Start Game.\nPlease Reenter the Range")
            StartGame.isHidden = true
            GameStop.isHidden = false
        }
    
      
        else {
            let n1 = arc4random_uniform(B)
            White1.setTitle("\(nonPrimeArray[Int(n1)])", for: .normal)
            let n2 = arc4random_uniform(B)
            White2.setTitle("\(nonPrimeArray[Int(n2)])", for: .normal)
            let n3 = arc4random_uniform(B)
            White3.setTitle("\(nonPrimeArray[Int(n3)])", for: .normal)
            let n4 = arc4random_uniform(B)
            White4.setTitle("\(nonPrimeArray[Int(n4)])", for: .normal)
            let n5 = arc4random_uniform(B)
            White5.setTitle("\(nonPrimeArray[Int(n5)])", for: .normal)
            
            let n11 = arc4random_uniform(B)
            White11.setTitle("\(nonPrimeArray[Int(n11)])", for: .normal)
            let n12 = arc4random_uniform(B)
            White12.setTitle("\(nonPrimeArray[Int(n12)])", for: .normal)
            let n13 = arc4random_uniform(B)
            White13.setTitle("\(nonPrimeArray[Int(n13)])", for: .normal)
            let n14 = arc4random_uniform(B)
            White14.setTitle("\(nonPrimeArray[Int(n14)])", for: .normal)
            let n15 = arc4random_uniform(B)
            White15.setTitle("\(nonPrimeArray[Int(n15)])", for: .normal)
            
            
            let n6 = arc4random_uniform(A)
            White6.setTitle("\(PrimeArray[Int(n6)])", for: .normal)
            let n7 = arc4random_uniform(A)
            White7.setTitle("\(PrimeArray[Int(n7)])", for: .normal)
            let n8 = arc4random_uniform(A)
            White8.setTitle("\(PrimeArray[Int(n8)])", for: .normal)
            let n9 = arc4random_uniform(A)
            White9.setTitle("\(PrimeArray[Int(n9)])", for: .normal)
            let n10 = arc4random_uniform(A)
            White10.setTitle("\(PrimeArray[Int(n10)])", for: .normal)
            RandomPlacement6()
            RandomPlacement7()
            RandomPlacement8()
            RandomPlacement9()
            RandomPlacement10()
            let HighscoreDefaultNew = UserDefaults.standard
            if (HighscoreDefaultNew.value(forKey: "Highscore") != nil){
                HighScore = HighscoreDefaultNew.value(forKey: "Highscore") as! NSInteger
                
            }
            else {
                
                HighScore = 0
            }
            YourScore.text = "\(Score)"
            ScoreRecord.text = "\(HighScore)"
            
            
            Score = 0
        }
        
        
      
    }
    
    @IBAction func GameStart(_ sender: UIButton) {
        if (startstop == false){
            White1.isHidden = false
            White2.isHidden = false
            White3.isHidden = false
            White4.isHidden = false
            White5.isHidden = false
            White7.isHidden = false
            White8.isHidden = false
            White9.isHidden = false
            White10.isHidden = false
            White11.isHidden = false
            White12.isHidden = false
            White13.isHidden = false
            White14.isHidden = false
            White15.isHidden = false
            Instruction.isHidden = true
            BackHome.isHidden = true
            StartGame.setTitle("Stop", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
            startstop = true
            Test()
           

        }
        else{
            performSegue(withIdentifier: "GameOver", sender: nil)
            miss = 0
            timer.invalidate()
            
         
        }
        
    }
   
    func updateAllArray(){
        sieveArray = sieveObj.returnListofNums()
        PrimeArray = sieveObj.returnListofPrime()
        nonPrimeArray = sieveObj.returnListofNonePrime()
        nonPrimeArray2 = sieveObj2.returnListofNonePrime()
    }
    
    
    @IBAction func FifthDown(_ sender: Any) {
        
        if (White10.center.y == 581.0){
            line5click = true
            RecordScore()
        }
      
    }
    

    
    @IBAction func ForthDown(_ sender: Any) {
        if (White9.center.y == 581.0){
            line4click = true
            RecordScore()
        }
    }
    
    @IBAction func ThirdDown(_ sender: Any) {
        if (White8.center.y == 581.0){
            line3click = true
            RecordScore()
        }
    }
    
    @IBAction func SecondDown(_ sender: Any) {
        if (White7.center.y == 581.0){
            line2click = true
            RecordScore()
        }
    }
    
   
    @IBAction func FirstDown(_ sender: Any) {
        if (White6.center.y == 581.0){
            
            line1click = true
            RecordScore()
        }
    }
    
    
    
   
    @IBAction func PressWhite1(_ sender: UIButton) {
        if (White1.center.y == 581.0){
            line1click = true
            miss += 1
            GameOver()
        }
        
    }
    
    @IBAction func PressWhite2(_ sender: UIButton) {
        if (White2.center.y == 581.0){
            line2click = true
            miss += 1
            GameOver()
        }
    }
    
    @IBAction func PressWhite3(_ sender: UIButton) {
        if (White3.center.y == 581.0){
            line3click = true
            miss += 1
            GameOver()
        }
    }
    
    @IBAction func PressWhite4(_ sender: UIButton) {
        if (White4.center.y == 581.0){
            line4click = true
            miss += 1
            GameOver()
        }
    }
    
    
    @IBAction func PressWhite11(_ sender: UIButton) {
        if (White11.center.y == 581.0){
            line1click = true
            miss += 1
            GameOver()
        }
    }
    
    @IBAction func PressWhite12(_ sender: UIButton) {
        if (White12.center.y == 581.0){
            line2click = true
            miss += 1
            GameOver()
        }
    }
    
    @IBAction func PressWhite13(_ sender: UIButton) {
        if (White13.center.y == 581.0){
            line3click = true
            miss += 1
            GameOver()
        }
    }
    
    @IBAction func PressWhite14(_ sender: UIButton) {
        if (White14.center.y == 581.0){
            line4click = true
            miss += 1
            GameOver()
        }
    }
    
    @IBAction func PressWhite15(_ sender: UIButton) {
        if (White15.center.y == 581.0){
            line5click = true
            miss += 1
            GameOver()
        }
    }
    
    
    @IBAction func PressWhite5(_ sender: UIButton) {
       
        if (White5.center.y == 581.0){
            line5click = true
            miss += 1
            GameOver()
        }
    }
    
    func UpdateTimer(){
        Test()
        Test2()
        if (White6.center.y == 581.0){
           
            if (line1click == false){miss += 1}
            
        }
        if (White7.center.y == 581.0){
            
            if (line2click == false){miss += 1}
        }
        if (White8.center.y == 581.0){
           
            if (line3click == false){
                miss += 1
            }
        }
        if (White9.center.y == 581.0){
      
            if (line4click == false){miss += 1}
        }
        if (White10.center.y == 581.0){
           
            if (line5click == false){
   
                miss += 1
            }
        }
        MakeMove()
        GameOver()
        line1click = false
        line2click = false
        line3click = false
        line4click = false
        line5click = false
        
       
        
        
        
    }
    
    func RecordScore(){
        let HighscoreDefaultNew = UserDefaults.standard
        
        let ScoreDefault = UserDefaults.standard
        
        Score += 1
        
        ScoreDefault.setValue(Score, forKey: "TempScore")
        
        scoreLabel.text = "\(Score)"
        
        if (Score > HighScore){
            HighScore = Score
            HighscoreDefaultNew.setValue(Score,forKey:"Highscore")
        }

    }
    func Test(){
        if (White5.center.y == 581.0){
            White5.backgroundColor = UIColor.lightGray
            White10.backgroundColor = UIColor.lightGray
            White15.backgroundColor = UIColor.lightGray
        }
        
        else {
            White5.backgroundColor = UIColor.white
            White10.backgroundColor = UIColor.white
            White15.backgroundColor = UIColor.white
        }
        
    }
    func Test2(){
        if (White4.center.y == 581.0){
            White4.backgroundColor = UIColor.lightGray
            White9.backgroundColor = UIColor.lightGray
            White14.backgroundColor = UIColor.lightGray
        }
        else {
            White4.backgroundColor = UIColor.white
            White9.backgroundColor = UIColor.white
            White14.backgroundColor = UIColor.white
        }
    }
    func Test3(){
        if (White3.center.y == 581.0){
            White3.backgroundColor = UIColor.lightGray
            White8.backgroundColor = UIColor.lightGray
            White13.backgroundColor = UIColor.lightGray
        }
        else {
            White3.backgroundColor = UIColor.white
            White8.backgroundColor = UIColor.white
            White13.backgroundColor = UIColor.white
        }
    }
    func Test4(){
        if (White2.center.y == 581.0){
            White2.backgroundColor = UIColor.lightGray
            White7.backgroundColor = UIColor.lightGray
            White12.backgroundColor = UIColor.lightGray
        }
        else {
            White2.backgroundColor = UIColor.white
            White7.backgroundColor = UIColor.white
            White12.backgroundColor = UIColor.white
        }
    }
    func Test5(){
        if (White1.center.y == 581.0){
            White1.backgroundColor = UIColor.lightGray
            White6.backgroundColor = UIColor.lightGray
            White11.backgroundColor = UIColor.lightGray
        }
        else {
            White1.backgroundColor = UIColor.white
            White6.backgroundColor = UIColor.white
            White11.backgroundColor = UIColor.white
        }
    }
    func MakeMove(){
        
        
        
        White1.center.y = White1.center.y + 166
        White2.center.y = White2.center.y + 166
        White3.center.y = White3.center.y + 166
        White4.center.y = White4.center.y + 166
        White5.center.y = White5.center.y + 166
        White6.center.y = White6.center.y + 166
        White7.center.y = White7.center.y + 166
        White8.center.y = White8.center.y + 166
        White9.center.y = White9.center.y + 166
        White10.center.y = White10.center.y + 166
        White11.center.y = White11.center.y + 166
        White12.center.y = White12.center.y + 166
        White13.center.y = White13.center.y + 166
        White14.center.y = White14.center.y + 166
        White15.center.y = White15.center.y + 166
        Test()
        Test2()
        Test3()
        Test4()
        Test5()
        let A: UInt32 = UInt32(PrimeArray.count)
        let B: UInt32 = UInt32(nonPrimeArray.count)
        
        if (White10.center.y >= 747){
            
            White10.center.y = -83
            White5.center.y = -83
            White15.center.y = -83
            RandomPlacement10()
            let n10 = arc4random_uniform(A)
            White10.setTitle("\(PrimeArray[Int(n10)])", for: .normal)
            let n5 = arc4random_uniform(B)
            White5.setTitle("\(nonPrimeArray[Int(n5)])", for: .normal)
            let n15 = arc4random_uniform(B)
            White15.setTitle("\(nonPrimeArray[Int(n15)])", for: .normal)
        }
        if (White9.center.y >= 747){
            White9.center.y = -83
            White4.center.y = -83
            White14.center.y = -83
            RandomPlacement9()
            let n9 = arc4random_uniform(A)
            White9.setTitle("\(PrimeArray[Int(n9)])", for: .normal)
            let n4 = arc4random_uniform(B)
            White4.setTitle("\(nonPrimeArray[Int(n4)])", for: .normal)
            let n14 = arc4random_uniform(B)
            White14.setTitle("\(nonPrimeArray[Int(n14)])", for: .normal)
        }
        if (White8.center.y >= 747){
            White8.center.y = -83
            White3.center.y = -83
            White13.center.y = -83
            RandomPlacement8()
            let n8 = arc4random_uniform(A)
            White8.setTitle("\(PrimeArray[Int(n8)])", for: .normal)
            let n3 = arc4random_uniform(B)
            White3.setTitle("\(nonPrimeArray[Int(n3)])", for: .normal)
            let n13 = arc4random_uniform(B)
            White13.setTitle("\(nonPrimeArray[Int(n13)])", for: .normal)
        }
        if (White7.center.y >= 747){
            White7.center.y = -83
            White12.center.y = -83
            White2.center.y = -83
            RandomPlacement7()
            let n7 = arc4random_uniform(A)
            White7.setTitle("\(PrimeArray[Int(n7)])", for: .normal)
            let n2 = arc4random_uniform(B)
            White2.setTitle("\(nonPrimeArray[Int(n2)])", for: .normal)
            let n12 = arc4random_uniform(B)
            White12.setTitle("\(nonPrimeArray[Int(n12)])", for: .normal)
        }
        if (White6.center.y >= 747){
            White6.center.y = -83
            White1.center.y = -83
            White11.center.y = -83
            RandomPlacement6()
            let n6 = arc4random_uniform(A)
            White6.setTitle("\(PrimeArray[Int(n6)])", for: .normal)
            let n1 = arc4random_uniform(B)
            White1.setTitle("\(nonPrimeArray[Int(n1)])", for: .normal)
            let n11 = arc4random_uniform(B)
            White11.setTitle("\(nonPrimeArray[Int(n11)])", for: .normal)
        }
        if (White5.center.y >= 747){
            
            White5.center.y = -83
            White10.center.y = -83
            White15.center.y = -83
            RandomPlacement10()
            let n10 = arc4random_uniform(A)
            White10.setTitle("\(PrimeArray[Int(n10)])", for: .normal)
            let n5 = arc4random_uniform(B)
            White5.setTitle("\(nonPrimeArray[Int(n5)])", for: .normal)
            let n15 = arc4random_uniform(B)
            White15.setTitle("\(nonPrimeArray[Int(n15)])", for: .normal)
        }
        if (White15.center.y >= 747){
            
            White15.center.y = -83
            White10.center.y = -83
            White5.center.y = -83
            RandomPlacement10()
            let n10 = arc4random_uniform(A)
            White10.setTitle("\(PrimeArray[Int(n10)])", for: .normal)
            let n5 = arc4random_uniform(B)
            White5.setTitle("\(nonPrimeArray[Int(n5)])", for: .normal)
            let n15 = arc4random_uniform(B)
            White15.setTitle("\(nonPrimeArray[Int(n15)])", for: .normal)
        }
        if (White4.center.y >= 747){
            White4.center.y = -83
            White9.center.y = -83
            White14.center.y = -83
            RandomPlacement9()
            let n9 = arc4random_uniform(A)
            White9.setTitle("\(PrimeArray[Int(n9)])", for: .normal)
            let n4 = arc4random_uniform(B)
            White4.setTitle("\(nonPrimeArray[Int(n4)])", for: .normal)
            let n14 = arc4random_uniform(B)
            White14.setTitle("\(nonPrimeArray[Int(n14)])", for: .normal)
        }
        if (White14.center.y >= 747){
            White14.center.y = -83
            White4.center.y = -83
            White9.center.y = -83
            RandomPlacement9()
            let n9 = arc4random_uniform(A)
            White9.setTitle("\(PrimeArray[Int(n9)])", for: .normal)
            let n4 = arc4random_uniform(B)
            White4.setTitle("\(nonPrimeArray[Int(n4)])", for: .normal)
            let n14 = arc4random_uniform(B)
            White14.setTitle("\(nonPrimeArray[Int(n14)])", for: .normal)
        }
        if (White3.center.y >= 747){
            White3.center.y = -83
            White8.center.y = -83
            White13.center.y = -83
            RandomPlacement8()
            let n8 = arc4random_uniform(A)
            White8.setTitle("\(PrimeArray[Int(n8)])", for: .normal)
            let n3 = arc4random_uniform(B)
            White3.setTitle("\(nonPrimeArray[Int(n3)])", for: .normal)
            let n13 = arc4random_uniform(B)
            White13.setTitle("\(nonPrimeArray[Int(n13)])", for: .normal)
        }
        if (White13.center.y >= 747){
            White13.center.y = -83
            White8.center.y = -83
            White3.center.y = -83
            RandomPlacement8()
            let n8 = arc4random_uniform(A)
            White8.setTitle("\(PrimeArray[Int(n8)])", for: .normal)
            let n3 = arc4random_uniform(B)
            White3.setTitle("\(nonPrimeArray[Int(n3)])", for: .normal)
            let n13 = arc4random_uniform(B)
            White13.setTitle("\(nonPrimeArray[Int(n13)])", for: .normal)
        }
        if (White2.center.y >= 747){
            White2.center.y = -83
            White12.center.y = -83
            White7.center.y = -83
            RandomPlacement7()
            let n7 = arc4random_uniform(A)
            White7.setTitle("\(PrimeArray[Int(n7)])", for: .normal)
            let n2 = arc4random_uniform(B)
            White2.setTitle("\(nonPrimeArray[Int(n2)])", for: .normal)
            let n12 = arc4random_uniform(B)
            White12.setTitle("\(nonPrimeArray[Int(n12)])", for: .normal)
        }
        if (White12.center.y >= 747){
            White12.center.y = -83
            White2.center.y = -83
            White7.center.y = -83
            RandomPlacement7()
            let n7 = arc4random_uniform(A)
            White7.setTitle("\(PrimeArray[Int(n7)])", for: .normal)
            let n2 = arc4random_uniform(B)
            White2.setTitle("\(nonPrimeArray[Int(n2)])", for: .normal)
            let n12 = arc4random_uniform(B)
            White12.setTitle("\(nonPrimeArray[Int(n12)])", for: .normal)
        }
        if (White1.center.y >= 747){
            White1.center.y = -83
            White6.center.y = -83
            White11.center.y = -83
            RandomPlacement6()
            let n6 = arc4random_uniform(A)
            White6.setTitle("\(PrimeArray[Int(n6)])", for: .normal)
            let n1 = arc4random_uniform(B)
            White1.setTitle("\(nonPrimeArray[Int(n1)])", for: .normal)
            let n11 = arc4random_uniform(B)
            White11.setTitle("\(nonPrimeArray[Int(n11)])", for: .normal)
        }
        if (White11.center.y >= 747){
            White11.center.y = -83
            White6.center.y = -83
            White1.center.y = -83
            RandomPlacement6()
            let n6 = arc4random_uniform(A)
            White6.setTitle("\(PrimeArray[Int(n6)])", for: .normal)
            let n1 = arc4random_uniform(B)
            White1.setTitle("\(nonPrimeArray[Int(n1)])", for: .normal)
            let n11 = arc4random_uniform(B)
            White11.setTitle("\(nonPrimeArray[Int(n11)])", for: .normal)
        }


        

    }
    
    func RandomPlacement6(){
        let RandomNumber = arc4random() % 4
        switch (RandomNumber){
        case 0:
            White6.center.x = 62.5
            White1.center.x = 187.5
            White11.center.x = 312.5
            break
        case 1:
            White6.center.x = 187.5
            White1.center.x = 62.5
            White11.center.x = 312.5
            break
        case 2:
            White6.center.x = 312.5
            White1.center.x = 187.5
            White11.center.x = 62.5
            break
       
        default:
            break

        }
    }
    
    func RandomPlacement7(){
        let RandomNumber = arc4random() % 4
        switch (RandomNumber){
        case 0:
            White7.center.x = 62.5
            White2.center.x = 187.5
            White12.center.x = 312.5
            break
        case 1:
            White7.center.x = 187.5
            White2.center.x = 62.5
            White12.center.x = 312.5
            break
        case 2:
            White7.center.x = 312.5
            White2.center.x = 187.5
            White12.center.x = 62.5
            break
            
        default:
            break
            
        }
    }
    
    func RandomPlacement8(){
        let RandomNumber = arc4random() % 4
        switch (RandomNumber){
        case 0:
            White8.center.x = 62.5
            White3.center.x = 187.5
            White13.center.x = 312.5
            break
        case 1:
            White8.center.x = 187.5
            White3.center.x = 62.5
            White13.center.x = 312.5
            break
        case 2:
            White8.center.x = 312.5
            White3.center.x = 187.5
            White13.center.x = 62.5
            break
            
        default:
            break
            
        }
    }
    func RandomPlacement9(){
        let RandomNumber = arc4random() % 4
        switch (RandomNumber){
        case 0:
            White9.center.x = 62.5
            White4.center.x = 187.5
            White14.center.x = 312.5
            break
        case 1:
            White9.center.x = 187.5
            White4.center.x = 62.5
            White14.center.x = 312.5
            break
        case 2:
            White9.center.x = 312.5
            White4.center.x = 187.5
            White14.center.x = 62.5
            break
            
        default:
            break
            
        }
    }
    func RandomPlacement10(){
        let RandomNumber = arc4random() % 4
        switch (RandomNumber){
        case 0:
            White10.center.x = 62.5
            White5.center.x = 187.5
            White15.center.x = 312.5
            break
        case 1:
            
            White10.center.x = 187.5
            White5.center.x = 62.5
            White15.center.x = 312.5
            break
        case 2:
            White10.center.x = 312.5
            White5.center.x = 187.5
            White15.center.x = 62.5
            break
            
        default:
            break
            
        }
    }
    
    func GameOver(){
        if (miss == 5){
            //gamedone = true
            performSegue(withIdentifier: "GameOver", sender: nil)
            timer.invalidate()
            
        }
        
    }
    
    
}
