//
//  File.swift
//  Procore_SieveOfEratosthenes
//
//  Created by Xini Yang on 12/9/16.
//  Copyright © 2016 Xini Yang. All rights reserved.
//

import Foundation
import UIKit

class GameOver: UIViewController {
    
    @IBOutlet weak var HighestScore: UILabel!
    
    @IBOutlet weak var CurrentScore: UILabel!
    override func viewDidLoad() {
       
        
        
        _ = UserDefaults.standard
        let ScoreDefaultNew = UserDefaults.standard
        
        let Score = ScoreDefaultNew.value(forKey: "TempScore") as! NSInteger
        let Highscore = ScoreDefaultNew.value(forKey: "Highscore") as! NSInteger
        
     
        HighestScore.text = "\(Highscore)"
        CurrentScore.text = "\(Score)"
        
        
      
    }
}
