import SpriteKit
import GameplayKit


class highScores: SKScene {
    var top: SKLabelNode!
    var mid: SKLabelNode!
    var bot: SKLabelNode!
    let backArrow = SKShapeNode()
    
    
    override func didMove(to view: SKView) {
        
        top = SKLabelNode(text: "Your High Scores")
        top.fontSize = 32
        top.fontColor = .black
        top.position = CGPoint(x: frame.midX, y: frame.midY+200)
        addChild(top)
        mid = SKLabelNode(text: "Time Trials: \(SharedVariables.high1)")
        mid.fontSize = 32
        mid.fontColor = .black
        mid.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(mid)
        bot = SKLabelNode(text: "Reaction Time Average: \(SharedVariables.high2)")
        bot.fontSize = 32
        bot.fontColor = .black
        bot.position = CGPoint(x: frame.midX, y: frame.midY-200)
        addChild(bot)
        

                backArrow.lineWidth = 2.0
                backArrow.strokeColor = .white
                
                let arrowPath = UIBezierPath()
                arrowPath.move(to: CGPoint(x: 0, y: 0))
                arrowPath.addLine(to: CGPoint(x: -15, y: 15))
                arrowPath.addLine(to: CGPoint(x: -15, y: 5))
                arrowPath.addLine(to: CGPoint(x: -60, y: 5))
                arrowPath.addLine(to: CGPoint(x: -60, y: -5))
                arrowPath.addLine(to: CGPoint(x: -15, y: -5))
                arrowPath.addLine(to: CGPoint(x: -15, y: -15))
                arrowPath.close()
                
                backArrow.path = arrowPath.cgPath
                backArrow.position = CGPoint(x: -300, y: 430) // Adjust the position as needed
                addChild(backArrow)
                
        backArrow.zRotation = .pi
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if backArrow.contains(location){
                if let view = self.view{
                    if let scene = SKScene(fileNamed: "Start"){
                        
                        scene.scaleMode = .aspectFill
                        view.presentScene(scene)
                    }
                }
            }
        }
        
    }

    override func update(_ currentTime: TimeInterval) {
        
    }
}

