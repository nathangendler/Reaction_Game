//
//  GameScene.swift
//  Reaction
//
//  Created by Nathan Gendler on 5/19/23.
//

import SpriteKit
import GameplayKit


class Time_Trial_Game_Over: SKScene {
    
    private var score_label: SKLabelNode!
    private var tap_anywhere: SKLabelNode!

    override func didMove(to view: SKView) {

//            self.score_label = (self.childNode(withName: "score_label") as? SKLabelNode)
        if let label = (self.childNode(withName: "score_label") as? SKLabelNode){

            label.text = "Your Score: \(SharedVariables.score)"
        }
    }
    
    func touchDown(atPoint pos : CGPoint){
        
    }
    
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("1")
        if let view = self.view {
            print("2")
              if let scene = SKScene(fileNamed: "Start") {
                  print("3")
                  scene.scaleMode = .aspectFill
                  view.presentScene(scene)
              }
          }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}

