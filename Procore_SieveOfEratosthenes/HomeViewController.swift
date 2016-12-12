//
//  ViewController.swift
//  Procore_SieveOfEratosthenes
//
//  Created by Xini Yang on 12/6/16.
//  Copyright © 2016 Xini Yang. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController{

    
    
    @IBOutlet weak var UserInput: UITextField!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var Choice: UISegmentedControl!
   
    @IBOutlet weak var Scroll: UIScrollView!

    @IBOutlet weak var Display: UITextView!

    @IBOutlet weak var ShowPrime: UIButton!
    
    @IBOutlet weak var FindNth: UITextField!
    @IBOutlet weak var Anwers: UILabel!
 
    @IBOutlet weak var FindIt: UIButton!
    @IBOutlet weak var CheckNum: UITextField!
  
    
    @IBOutlet weak var CheckButton: UIButton!
    @IBOutlet weak var Indicator: UILabel!
    @IBOutlet weak var Maxi: UITextField!
    var sieveObj: SieveAlgo!
    var recievedNumMax: Int!
    var recievedNumMin: Int!
    var sieveArray: Array<Bool>!
    var primeArray: Array<Int>!
    var FindPrime: Array<Int>!
    var gradient = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.UserInput.text = nil
        self.Maxi.text = nil
        self.FindNth.text = nil
        self.CheckNum.text = nil
        self.Display.text = nil
        self.start.isHidden = true
        self.ShowPrime.isHidden = true
        self.FindIt.isHidden = true
        self.Maxi.isHidden = true
        self.Anwers.text = "More stuff to explore!Enter the limit to find out "
        self.FindNth.isHidden = true
        self.CheckButton.isEnabled = false
        Choice.selectedSegmentIndex = 1
        _ = isValid()
        _ = isValid4()
       
        
        
    }
    
    
    
  
    @IBAction func Check(_ sender: UIButton) {
       
        sieveObj = SieveAlgo(mini: 0, maxi: 100000)
        sieveObj.compute()
        updateAllArray()
        if (FindPrime.contains(Int(CheckNum.text!)!)){
            self.Indicator.text = "is PrimeNumber!!"
        }
        else {
            self.Indicator.text = "is NOT prime number"
        }
    }
    
    @IBAction func CheckFlag(_ sender: UITextField) {
        if (isValid4()){
            self.Indicator.text = "is prime number?"
            CheckButton.isEnabled = true
        }
        else {
            CheckButton.isEnabled = false;
            //CheckButton.isHidden = true
        }
        
    }
 
    var flag = false;
    @IBAction func InputChange(_ sender: UITextField) {
        if (isValid3() == true){
            self.Display.text = nil
            self.Maxi.isHidden = false
            self.message.text = "Please enter Range"
            
        }
        else {
            
            self.Maxi.isHidden = true
        }
    }
    
    
    @IBAction func MaxValue(_ sender: UITextField) {
        if (isValid() == true ) {
            if (Int(self.Maxi.text!)! < Int(self.UserInput.text!)!){
                self.message.text = "Reenter Numbers. First Number has to be smaller than Second"

            
            }else{
                self.Display.text = nil
                self.start.isHidden = false
                self.ShowPrime.isHidden = false
                self.FindIt.isHidden = false
                self.Anwers.text = "Find nth Prime between your choice and 100000 Number!"
                self.FindNth.isHidden = false
            }
        } else {
            
            self.start.isHidden = true
            self.ShowPrime.isHidden = true
            self.FindIt.isHidden = true
            self.Anwers.text = "More stuff is coming!Enter the limit to find out "
            self.FindNth.isHidden = true
            
        }
        
    }
    
    var str: String = ""

    @IBAction func Print(_ sender: UIButton) {
        
        recievedNumMax = Int(self.Maxi.text!)!+1
        recievedNumMin = Int(self.UserInput.text!)!
        sieveObj = SieveAlgo(mini: recievedNumMin, maxi: recievedNumMax)
        sieveObj.compute()
        updateAllArray()
      
        for j in 0..<primeArray.count - 1 {
            str += "\(primeArray[j]), "
        }
        str += "\(primeArray[primeArray.count-1])"
        Display.text = str
        str = ""
    }
    
    func updateAllArray(){
        sieveArray = sieveObj.returnListofNums()
        primeArray = sieveObj.returnListofPrime()
        FindPrime = sieveObj.returnTotalPrime()
    }
   


    @IBAction func Start(_ sender: UIButton) {
        if self.Choice.selectedSegmentIndex == 0 {
            performSegue(withIdentifier: "Basic", sender: nil)
        } else if self.Choice.selectedSegmentIndex == 1 {
            performSegue(withIdentifier: "Game", sender: nil)
        }

    }
    
 
    @IBAction func FindNthPrime(_ sender: UIButton) {
      
        recievedNumMax = Int(self.Maxi.text!)!+1
        recievedNumMin = Int(self.UserInput.text!)!
        sieveObj = SieveAlgo(mini: recievedNumMin, maxi: recievedNumMax)
        sieveObj.compute()
        updateAllArray()
 
        self.Anwers.text = "th Prime Number between \(recievedNumMin!) and \(recievedNumMax!-1)  is \(primeArray[Int(FindNth.text!)!-1])"
    
    
        

    }
    
    func isValid3() -> Bool{
        var isValid3 = true;
        if let text = self.UserInput.text, !text.isEmpty{
            
            if (Int(text) == nil ){
                self.message.text = "Please enter a nonnegative integer"
                isValid3 = false;
            }
            else if (Int(text)!>100000){
                self.message.text = "oops,the number is too big. Please enter a number less than 100000"
                isValid3 = false;
            }
            else if (Int(text)!>10000){
                self.message.text = "Big number costs long wait time"
            }
            else if (Int(text)! < 1){
                self.message.text = "Please enter a number larger than 1";
                isValid3 = false;
            }
                
            else {self.message.text = "Valid number."}
        }
        else {
            self.message.text = "Please enter a lower bound"
            isValid3 = false;
        }
        return isValid3
    }
    
    func isValid() -> Bool{
        var isValid = true;
        if let text = self.Maxi.text, !text.isEmpty{
    
            if (Int(text) == nil ){
                self.message.text = "Please enter a nonnegative integer"
                isValid = false;
            }
            else if (Int(text)!>100000){
                self.message.text = "oops,the number is too big. Please enter a number less than 100000"
                isValid = false;
            }
            else if (Int(text)!>10000){
                self.message.text = "Big number costs long wait time"
            }
            else if (Int(text)! < 1){
                self.message.text = "Please enter a number larger than 1";
                isValid = false;
            }
                
            else {self.message.text = "Valid number. Let's start"
            }
            
        }
        else {
            self.message.text = "Please enter Range"
            isValid = false;
        }
        return isValid
    }
    
    
    @IBAction func CheckPrime(_ sender: UITextField) {
        if (isValid2() == true){
            FindIt.isEnabled = true
            print("why it doesnt work")
        }
        else {
            FindIt.isEnabled = false
             print("why it doesnt worka!!!")
        }
        
    }
    
    func isValid2() -> Bool{
        recievedNumMax = Int(self.Maxi.text!)!+1
        recievedNumMin = Int(self.UserInput.text!)!
        sieveObj = SieveAlgo(mini: recievedNumMin, maxi: recievedNumMax)
        sieveObj.compute()
        updateAllArray()
        var isValid2 = true;
        if let text2 = self.FindNth.text, !text2.isEmpty{
            print("why it doesnt work")
            if (Int(text2) == nil ){
                print("why it doesnt work1")

                self.Anwers.text = "Please enter a nonnegative integer"
                isValid2 = false;
            }
            else if (Int(text2)!>primeArray.count){
                print("why it doesnt work2")

                self.Anwers.text = "oops,the number is too big. Out of Range"
                isValid2 = false;
            }
            else if (Int(text2)!>10000){
               

                self.Anwers.text = "Big number costs long wait time"
            }
            else if (Int(text2)! < 1){
                print("why it doesnt work3")

                self.Anwers.text = "Please enter a number equal ot larger than 1";
                isValid2 = false;
            }
                
                
            else {
                print("why it doesnt work5")

                self.Anwers.text = "Valid number. Let's find it "
            }
            
            
            
            
            
        }
        else {
            self.message.text = "the prime number is ?"
            isValid2 = false;
        }
        return isValid2
    }
    
    func isValid4() -> Bool{
        var isValid = true;
        if let text = self.CheckNum.text, !text.isEmpty{
            
            if (Int(text) == nil ){
                self.Indicator.text = "Please enter a nonnegative integer"
                isValid = false;
            }
            else if (Int(text)!>100000){
                self.Indicator.text = "oops,the number is too big. Please enter a number less than 100000"
                isValid = false;
            }
            else if (Int(text)!>10000){
                self.Indicator.text = "Big number costs long wait time"
            }
            else if (Int(text)! < 1){
                self.Indicator.text = "Please enter a number larger than 1";
                isValid = false;
            }
                
            else {self.Indicator.text = "Valid number. Let's start"
            }
            
        }
        else {
            self.Indicator.text = "is prime number??"
            isValid = false;
        }
        return isValid
    }
    
    
    @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
       
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Basic" || identifier == "Game" {
            return false
        }
        return true
    }
    
  
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Basic" {
            let destination = segue.destination as! BasicViewController
            destination.limit = NSInteger(Int(self.UserInput.text!)!)
            destination.max = NSInteger(Int(self.Maxi.text!)!+1)
        }
        if segue.identifier == "Game"{
            let destination = segue.destination as! GameViewController
            destination.limit = NSInteger(Int(self.UserInput.text!)!)
            destination.max = NSInteger(Int(self.Maxi.text!)!+1)
        }
    }


}

