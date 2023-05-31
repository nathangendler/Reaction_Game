import SpriteKit
import GameplayKit


class GameScene_Before: SKScene {
    var top: SKLabelNode!
    var mid: SKLabelNode!
    let customFont = UIFont(name: "Avenir-Medium", size: 24)
    
    
    override func didMove(to view: SKView) {
        
        top = SKLabelNode(text: "Click as many squares as you can before the time runs out")
        top.fontName = customFont?.fontName
        top.fontSize = 24
        top.fontColor = .white
        top.position = CGPoint(x: frame.midX, y: frame.midY+100)
        addChild(top)
        mid = SKLabelNode(text: "Tap anywhere to start")
        mid.fontName = customFont?.fontName
        mid.fontSize = 24
        mid.fontColor = .white
        mid.position = CGPoint(x: frame.midX, y: frame.midY-100)
        addChild(mid)
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
                if let view = self.view{
                    if let scene = SKScene(fileNamed: "GameScene"){
                        
                        scene.scaleMode = .aspectFill
                        view.presentScene(scene)
                    }
                }
           
        
        
    }

    override func update(_ currentTime: TimeInterval) {
        
    }
}

