//
//  GameScene.swift
//  Reaction
//
//  Created by Nathan Gendler on 5/19/23.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    let square = SKSpriteNode()
    let label = SKLabelNode()
    var timerLabel: SKLabelNode!
    var countdownValue = 20
    var countdownTimer: Timer?
    public var score = 0
    {
        didSet{
            scoreNode.text = "Current Score: \(score)"
        }
    }
    private let scoreNode : SKLabelNode = SKLabelNode(fontNamed: "Copperplate-Bold")
    

    override func didMove(to view: SKView) {
        square.size = CGSize(width: 50, height: 50)
        square.position = CGPoint(x: 100, y: 100)
        square.color = .red
        
        addChild(square)
        
        scoreNode.zPosition = 2
        scoreNode.position.x = 0
        scoreNode.position.y = 490
        addChild(scoreNode)
        score = 0
        
        timerLabel = SKLabelNode(fontNamed: "Helvetica")
        timerLabel.fontSize = 48
        timerLabel.position = CGPoint(x: frame.midX, y: -520)
        addChild(timerLabel)
        startCountdownTimer()
    }
    
    func startCountdownTimer() {

           countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
       }
       
       @objc func updateCountdown() {

           countdownValue -= 1

           timerLabel.text = "\(countdownValue)"

           if countdownValue <= 0 {
               endCountdown()
           }
       }
       
       func endCountdown() {

           countdownTimer?.invalidate()
           countdownTimer = nil

       }
    
    
    
    func touchDown(atPoint pos : CGPoint){
        
    }
    
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch in touches{
            let location = touch.location(in: self)
            if location.x >= (square.position.x-25) && location.x <= (square.position.x+25) && location.y >= (square.position.y-25) && location.y <= (square.position.y+25){
                square.position.x = CGFloat(Int.random(in:(-250)...(250)))
                square.position.y = CGFloat(Int.random(in:(-550)...(500)))
                score += 1
            }
            
        }
            
    }

    override func update(_ currentTime: TimeInterval) {
            if countdownValue == 0{
                if let view = self.view{
                    if let scene = SKScene(fileNamed: "Time_Trial_Game_Over"){
                        SharedVariables.score = Double(score)
                        scene.scaleMode = .aspectFill
                        view.presentScene(scene)
                    }
                }
            }
        }
}

