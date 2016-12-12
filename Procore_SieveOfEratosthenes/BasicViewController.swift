//
//  ViewController.swift
//  Procore_SieveOfEratosthenes
//
//  Created by Xini Yang on 12/6/16.
//  Copyright © 2016 Xini Yang. All rights reserved.
//

import UIKit

enum SegmentedControlEnum: Int {
    case Basic_NUM_SEGMENT
    case Fancy_NUM_SEGMENT
}

class BasicViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
   
    
    
    @IBOutlet weak var NumCollection: UICollectionView!
    
    @IBOutlet weak var TotalCollection: UICollectionView!
    @IBOutlet weak var SegmentNum: UISegmentedControl!
    
    @IBOutlet weak var Cells: CollectionCell!
    
    let reusableCellIdentifier = "CollectionCell"
    @IBOutlet weak var Fancy: UIButton!
    let collectionViewPadding = CGFloat(40)
    let numCellPerRow = CGFloat(10)
    var max: NSInteger = NSInteger()
    var limit: NSInteger = NSInteger()
    var sieveObj: SieveAlgo!
    var sieveObj2: SieveAlgo!
    var receivedMin: Int!
    var receivedMax: Int!
    var receivedMin2: Int!
    var sieveArray: Array<Bool>!
    var sieveArray2: Array<Bool>!
    var primeloop: Array<Int>!
    var calcCellSize: CGFloat!
    var segmentedControlType : SegmentedControlEnum = .Basic_NUM_SEGMENT
    var timer = Timer()
    var second = 0
    var k = 2
    
    override func viewDidLoad() {
        print ("test1\n")
        super.viewDidLoad()
        receivedMax = max
        receivedMin = limit
        receivedMin2 = 2
        sieveObj = SieveAlgo(mini: receivedMin, maxi: receivedMax)
        sieveObj2 = SieveAlgo(mini: receivedMin2, maxi: receivedMax)
        sieveObj.compute()
        sieveObj2.compute()
        sieveArray = sieveObj.returnListofNums()
        sieveArray2 = sieveObj2.returnListofNums()
        primeloop = sieveObj2.returnListofPrime()
        calcCellSize = ( UIScreen.main.bounds.width - collectionViewPadding) / numCellPerRow
        TotalCollection.isHidden = true
        Fancy.isHidden = true
        
    }
   
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }

    @IBAction func Start(_ sender: UIButton) {
       
        var c = UIColor.white
        
        for prime in self.primeloop{
            let p = prime
            
            
            c = self.generateRandomColor()
            for cell in self.TotalCollection.visibleCells as! [CollectionCell] {
                let tmp  = Int(cell.cellLabel.text!)!
                if (tmp%p == 0 && tmp != p && cell.cellLabel.textColor == UIColor.white){
                    print ("\(p) : \(tmp)")
                    
                    cell.cellLabel.textColor = c
                    
                }
            }
            delay(2){ print("haha")}
            
            
            
        }
        
        
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
  
        return CGSize(width: calcCellSize, height: calcCellSize)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if (collectionView.isEqual(NumCollection)){
            return  receivedMax-receivedMin+1
        }
        return receivedMax - receivedMin2+1;
       
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableCellIdentifier, for: indexPath) as! CollectionCell
        
        
        
            cell.backgroundColor = UIColor.black
        if (collectionView.isEqual(NumCollection)){
            let cellIndex =  indexPath.item + receivedMin // Start from 1, not 0 (ignore the number 0)
            
            cell.cellLabel.text = String(cellIndex) // Set the visible cell number
            if (sieveArray[cellIndex-1]) {
                cell.backgroundColor = UIColor.black
                cell.cellLabel.textColor = UIColor.white
                cell.layer.cornerRadius = cell.frame.size.height/2
            } else {
                cell.backgroundColor = UIColor.darkGray
                cell.cellLabel.textColor = UIColor.white
                cell.layer.cornerRadius = cell.frame.size.height/5
            }
        }else if (collectionView.isEqual(TotalCollection)){
            let cellIndex =  indexPath.item + receivedMin2
            cell.cellLabel.text = String(cellIndex)
            cell.backgroundColor  = UIColor.black
            cell.cellLabel.textColor = UIColor.white
            cell.layer.cornerRadius = cell.frame.size.height/2
           
        }
        
     
        cell.layer.borderColor = UIColor.black.cgColor// Set border color to black
     
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [],animations: {cell!.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)},completion: { finished in UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseInOut,animations: {cell!.transform = CGAffineTransform(scaleX: 1, y: 1)},completion: nil)})
    }
    
    
    @IBAction func SegmentedControl(_ sender: UISegmentedControl) {
        segmentedControlType = SegmentedControlEnum(rawValue: SegmentNum.selectedSegmentIndex)!
      
        switch segmentedControlType {
        case .Basic_NUM_SEGMENT:
           
            NumCollection.isHidden = false
            TotalCollection.isHidden = true
            Fancy.isHidden = true
            
            break
        case .Fancy_NUM_SEGMENT:
            TotalCollection.isHidden = false
            NumCollection.isHidden = true
            Fancy.isHidden = false
            break
        }
    }
    
    
}

