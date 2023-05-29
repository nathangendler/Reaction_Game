//
//  GameScene.swift
//  Reaction
//
//  Created by Nathan Gendler on 5/19/23.
//

import SpriteKit
import GameplayKit


class Start: SKScene {

    private var button : SKLabelNode?
 
    override func didMove(to view: SKView) {

    }
    
    func touchDown(atPoint pos : CGPoint){
        
        
    }
        func touchMoved(toPoint pos : CGPoint) {
            
        }
        
        func touchUp(atPoint pos : CGPoint) {
            
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                let location = touch.location(in: self)
                let touchedNode = atPoint(location)
                if touchedNode.name == "time_trial"{
                    if let view = self.view {
                        if let scene = SKScene(fileNamed: "GameScene") {
                            scene.scaleMode = .aspectFill
                            view.presentScene(scene)
                            
                        }
                        
                    }
                }
                if touchedNode.name == "reaction"
                {
                    if let view = self.view {
                        if let scene = SKScene(fileNamed: "Reaction") {
                            scene.scaleMode = .aspectFill
                            view.presentScene(scene)
                            
                        }
                        
                    }
                }
                if touchedNode.name == "highScores"
                {
                    if let view = self.view {
                        if let scene = SKScene(fileNamed: "highScores") {
                            scene.scaleMode = .aspectFill
                            view.presentScene(scene)
                            
                        }
        
                    }
                }
            }
        }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
 
    }
}
