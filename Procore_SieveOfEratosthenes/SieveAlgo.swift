//
//  SieveAlgo.swift
//  Procore_SieveOfEratosthenes
//
//  Created by Xini Yang on 12/6/16.
//  Copyright © 2016 Xini Yang. All rights reserved.
//

import Foundation
import UIKit

class SieveAlgo {
   
    private var lower: Int!
    private var upper: Int!
    private var listOfNums: Array<Bool>! //True: not prime ; False: prime
    
    private var listOfPrime: Array<Int>! //List of prime nums
    private var listOfNonPrime: Array<Int>! //List of nonprime nums
    private var Total: Array<Bool>!
    private var FindPrime: Array<Int>!
    
    
    
    //Initailization
   
    
    init (mini: Int, maxi: Int){
        upper = maxi
        lower = mini
        listOfNumsGenerator(limit: upper)
        
        listOfPrime = Array<Int>()
        listOfNonPrime = Array<Int>()
        FindPrime = Array<Int>()
        
    }
    
   
    
    func ChangeLimit(newNum: Int){
        if (newNum < upper){
            let  difference = upper - newNum
            for _ in 0..<difference{
                listOfNums.removeLast()
            }
            upper = newNum
        }

        else if (newNum > upper){
            let extra = newNum - upper
            for _ in 0..<extra{
                self.listOfNums.append(true)
            }
            upper = newNum
        }
    }

    func compute(){
        for j in 2..<listOfNums.count where listOfNums[j] {
            var k = 2;
            while (k*j < listOfNums.count){
                listOfNums[k*j] = false;
                k+=1;
            }
        }
        for i in 2..<100001 {
            var n = 2;
            while (n*i < 100001){
                Total[n*i] = false;
                n+=1;
            }
        }
        
    }
    
    func SieveOfEratosthenses(newNum: Int){
        ChangeLimit(newNum: newNum)
        compute()
    }
    
    // Return Array 
    func returnListofNums() -> Array<Bool> {
        return listOfNums
    }
    
    func returnListofPrime() -> Array<Int> {
        let size: Int = listOfNums.count
        
        for i in lower..<size{
            if (listOfNums[i]){
                listOfPrime.append(i);
            }
        }
        return listOfPrime
    }
    
    func returnTotalPrime() -> Array<Int> {
        let size: Int = Total.count
        
        for i in 1..<size{
           
            if (Total[i]){
                FindPrime.append(i);
            }
        }
        return FindPrime
    }
    
  
    
    func returnListofNonePrime() -> Array<Int> {
        let size: Int = listOfNums.count
      
        for i in lower..<size{
            if (!listOfNums[i]){
                listOfNonPrime.append(i);
            }
        }
        return listOfNonPrime
    }
    
    
    
    private func listOfNumsGenerator(limit: Int){
        listOfNums = Array<Bool>(repeating: true, count: limit)
        Total = Array<Bool>(repeating: true, count: 100001)
       
        for i in 0..<2 {
            
            listOfNums[i] = false;
            Total[i] = false;
            
        }
        
    }
   
}
