//
//  GameScene.swift
//  Reaction
//
//  Created by Nathan Gendler on 5/19/23.
//

import SpriteKit
import GameplayKit


class Reaction: SKScene {
    
    let square = SKSpriteNode()
    var yes = false
    var countdownValue = Double.random(in: 2.4..<6)
    var countupValue = 0.00
    var countdownTest = 5
    var countdownTimer: Timer?
    var countupTimer: Timer?
    var timerLabel: SKLabelNode!
    var startTime: TimeInterval = -0.1
    var isTimerRunning = false
    var all: [Double] = []
    var elapsedTime = -0.1
    var stop = false
    var times = 1
    var first = true
    
    override func didMove(to view: SKView) {
        print("before first touch")
        square.size = CGSize(width: 150, height: 150)
        square.position = CGPoint(x:0, y: 0)
        square.color = .red
        backgroundColor = .black
        addChild(square)
        startCountdownTimer()
        timerLabel = SKLabelNode(text: "0.0")
        timerLabel.fontSize = 32
        timerLabel.fontColor = .black
        timerLabel.position = CGPoint(x: frame.midX, y: frame.midY-200)
        addChild(timerLabel)
    }
    
    
    func updateTimerLabel() {
        let currentTime = CACurrentMediaTime()
        elapsedTime = currentTime - startTime
        let formattedTime = String(format: "%.1f", elapsedTime)
        timerLabel.text = formattedTime
    }
    
    func touchDown(atPoint pos : CGPoint){
        
    }
    
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
                
        let touchLocation = touch.location(in: self)
        
        if first == true{
            print("first touch detected")
            first = false
            
            isTimerRunning = true
            startTime = CACurrentMediaTime()
                    
            // Update the timer label
            let updateAction = SKAction.run { [weak self] in
                self?.updateTimerLabel()
            }
            let waitAction = SKAction.wait(forDuration: 0.1)
            let sequenceAction = SKAction.sequence([updateAction, waitAction])
            let repeatAction = SKAction.repeatForever(sequenceAction)
            timerLabel.run(repeatAction)
            stop = true
        }
        
        if stop == true && square.contains(touchLocation) && square.color == .green{
            isTimerRunning = false
            all.append(elapsedTime)
            print(all[0])
            timerLabel.removeAllActions()
            times += 1
            if let label = (self.childNode(withName: "score_label") as? SKLabelNode){
                label.text = ("Tap anywhere for attempt \(times) out of 5")
                
                print("thing")
            }
            
        }
        if stop == true && isTimerRunning == false{
            
        }
        if stop == false{
            countdownValue = Double.random(in: 2.4..<6)
            stop = true
            square.color = .red
            
            if !isTimerRunning {
                // Start the timer
                isTimerRunning = true
                startTime = CACurrentMediaTime() + countdownValue
                        
                // Update the timer label
                let updateAction = SKAction.run { [weak self] in
                    self?.updateTimerLabel()
                }
                let waitAction = SKAction.wait(forDuration: 0.1)
                let sequenceAction = SKAction.sequence([updateAction, waitAction])
                let repeatAction = SKAction.repeatForever(sequenceAction)
                timerLabel.run(repeatAction)
            } else {
                // Stop the timer
                isTimerRunning = false
                timerLabel.removeAllActions()
            }
            
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if countdownValue <= 0 {
            square.color = .green
            timerLabel.fontColor = .white
            yes = true
        }
        if times == 5{
            var x = 0.0
            for i in all{
                x += all[Int(i)]
            }
            print(x)
            x = x/Double(times)
            print(x)
            if let view = self.view{
                if let scene = SKScene(fileNamed: "Reaction_Game_Over"){
                    SharedVariables.score = x
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene)
                }
            }
        }
    }
    

    func startCountdownTimer() {

        countdownTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
       }
       
    @objc func updateCountdown() {
        countdownValue -= 0.01
        if countdownValue <= 0 {
               endCountdown()
                countdownValue = 0
        }
        if elapsedTime == 0.0{
            stop = true
            square.color = .green
        }
    }
    
    
       
    func endCountdown() {

        countdownTimer?.invalidate()
        countdownTimer = nil

    }
    
}
