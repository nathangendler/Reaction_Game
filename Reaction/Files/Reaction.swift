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
    
    var isTimerRunning = false
    var times: [Double] = []
    var elapsedTime = -0.1
    var stop = 0

    var first = true
    var startTime: TimeInterval = 0
    var timerRunning = false
    var a = 1
    let customFont = UIFont(name: "Avenir-Medium", size: 24)
    
    
    
    override func didMove(to view: SKView) {
        if let label = (self.childNode(withName: "score_label") as? SKLabelNode){
            label.text = ("Tap anywhere to start")
            
            label.fontName = customFont?.fontName
        }
        
        print("before first touch")
        square.size = CGSize(width: 150, height: 150)
        square.position = CGPoint(x:0, y: 0)
        square.color = .red
        backgroundColor = .black
        addChild(square)

        timerLabel = SKLabelNode(text: "0.0")
        timerLabel.fontName = customFont?.fontName
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
        timerLabel.fontName = customFont?.fontName
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
                    let location = touch.location(in: self)
                    if !timerRunning {
                        // Start the timer
                        if let label = (self.childNode(withName: "score_label") as? SKLabelNode){
                            label.text = ("Tap the square when green")
                        }
                        countdownValue = Double.random(in: 2.4..<6)
                        startTime = CACurrentMediaTime() + countdownValue
                        timerRunning = true
                        updateTimerLabel()
                    } else if timerRunning && square.contains(location) && elapsedTime >= 0{
                        // Stop the timer
                        a += 1
                        if let label = (self.childNode(withName: "score_label") as? SKLabelNode){
                            label.text = ("Tap anywhere for attempt \(a) out of 5")
                        }
                        times.append(elapsedTime)
                        timerRunning = false

                    } else if !timerRunning && square.contains(location) {
                        // Reset the timer and start again
                        if let label = (self.childNode(withName: "score_label") as? SKLabelNode){
                            label.text = ("Tap the square when green")
                        }
                        countdownValue = Double.random(in: 2.4..<6)
                        startTime = CACurrentMediaTime() + countdownValue
                        timerRunning = true
                        updateTimerLabel()
                    }
                }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if elapsedTime >= 0{
            timerLabel.fontColor = .white
        }
        else{
            timerLabel.fontColor = .black
        }
        
        if timerRunning {
            updateTimerLabel()
        }

        if elapsedTime >= 0{
            square.color = .green
        }
        else{
            square.color = .red
        }
        
        if countdownValue <= 0 {
            square.color = .green
            timerLabel.fontColor = .white
            yes = true
        }
        if a == 6{
            var x = 0.0
            print(times[0])
            print(times[1])
            print(times[2])
            print(times[3])
            print(times[4])
          
            x += times[0]
            x += times[1]
            x += times[2]
            x += times[3]
            x += times[4]
            print(x)
            x = x/Double(a-1)
            print(x)
            let gh = x.rounded(toPlaces: 4)
            SharedVariables.score = gh
            
            if let view = self.view{
                if SharedVariables.score > SharedVariables.high2{
                    SharedVariables.high2 = SharedVariables.score
                }
                if let scene = SKScene(fileNamed: "Reaction_Game_Over"){
                    
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene)
                }
            }
        }
    }
    
}
