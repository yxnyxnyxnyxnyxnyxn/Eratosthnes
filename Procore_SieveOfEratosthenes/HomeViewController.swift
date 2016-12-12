//
//  ViewController.swift
//  Procore_SieveOfEratosthenes
//
//  Created by Xini Yang on 12/6/16.
//  Copyright © 2016 Xini Yang. All rights reserved.
//

import UIKit

class TestController: UIViewController {

    
    
    @IBOutlet weak var UserInput: UITextField!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var Choice: UISegmentedControl!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.UserInput.text = nil
        self.start.isHidden = true
        Choice.selectedSegmentIndex = 1
        _ = isValid()
        
        
    }
    @IBAction func InputChange(_ sender: UITextField) {
        if (isValid() == true) {
            self.start.isHidden = false
        } else {
            self.start.isHidden = true
        }
    }


  
    
    
    /*func updateArrays(){
        sieveArray = sieveObj.returnListofNums()
        primeArray = sieveObj.returnListofPrime()
    }*/
    @IBAction func Start(_ sender: UIButton) {
        if self.Choice.selectedSegmentIndex == 0 {
            performSegue(withIdentifier: "Simple", sender: nil)
        } else if self.Choice.selectedSegmentIndex == 1 {
            performSegue(withIdentifier: "Creative", sender: nil)
        }

    }
    
    func isValid() -> Bool{
        var isValid = true;
        if let text = self.UserInput.text, !text.isEmpty{
            if (Int(text) == nil){
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
            self.message.text = "Please enter a number"
            isValid = false;
        }
        return isValid
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "Basic" || identifier == "Game" {
            return false
        }
        return true
    }
    
    /*let reusableCellIdentifier = "Reusable"
    let minCellSpacing = CGFloat(0)
    let munCellPerRow = CGFloat(10)
    let minNumCellPerRow = CGFloat(5)
    let collectionViewPadding = CGFloat(40)
    let partitionMax = 100000
    
    
    //Variable
  
    var sieveObj: SieveAlgo!
    var receivedNum: Int!
    var sieveArray: Array<Bool>!
    var primeArray: Array<Int>!
    var collectionViewWidth: CGFloat!
    var calCellSize: CGFloat!
    var numPartitionSet: Int = 1*/
    
    
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Simple" {
            let destination = segue.destination as! BasicViewController
            destination.limit = NSInteger(Int(self.limit.text!)!)
        } else if segue.identifier == "Creative" {
            let destination = segue.destination as! CreativeViewController
            destination.limit = NSInteger(Int(self.limit.text!)!)
        }
    }*/


}

