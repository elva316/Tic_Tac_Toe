//
//  ViewController.swift
//  stack views
//
//  Created by elva wang on 11/1/17.
//  Copyright © 2017 elva wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var player = 1 // red
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0,1,2,],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameActive = true
    @IBOutlet weak var winnerLabel: UILabel!
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameActive = true
        player = 1
        winnerLabel.text = ""
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.backgroundColor = UIColor.gray
        }
    }
    
    @IBAction func action(_ sender: UIButton) {
        if gameState[sender.tag-1] == 0 && gameActive == true{
            if player == 1 {
                gameState[sender.tag-1] = player
                sender.backgroundColor = UIColor.red
//                sender.isEnabled = false
                player = 2
            } else {
                gameState[sender.tag-1] = player
                sender.backgroundColor = UIColor.blue
//                sender.isEnabled = false
                player = 1
            }
            for win in winningCombinations {
                if gameState[win[0]] != 0 && gameState[win[0]] == gameState[win[1]] && gameState[win[1]] == gameState[win[2]] {
                    gameActive = false
                    if gameState[win[0]] == 1 {
                        winnerLabel.text = "Red won!"
                    }else{
                        winnerLabel.text = "Blue won!"
                    }
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.text = ""
    }
    

}

