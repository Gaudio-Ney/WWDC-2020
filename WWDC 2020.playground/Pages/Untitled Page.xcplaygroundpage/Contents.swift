//: A SpriteKit based Playground

/*:
 # The importance of eating healthier
 **Have you ever asked to your self: am I eating well?**

 Most of the times we do this type of question when we get older, when we start to worry about our healthy habits and also start to see the consequence of doesn't care about our own health earlier.

 In line with the report made by the UN Special Rapporteur on the right to health, Anand Grover, it is worrying to see that the results of really bad alimentation habits in the world: the estimate is that "2.1 billion people worldwide are overweight or obese, and at least **2.8 million die every year** **because of their weight**". Most of the cases is related with their own habits of eating funk food, that contains high levels of sugar, salt, trans-fats and saturated fats. [Clique here](https://news.un.org/en/story/2014/06/470512) to see the entire news.

 And thinking about this hard reality I thought: **what if the younger people, especially the children, could identifier if their own alimentation habits seems to be heathy or not?**

 This first experience with the tools of Playground and Swift create a simple, but important interactions with the children, that allows them to choose the type of food their are used to eat in a normal day. And, at the and of the experience, the code based at the points the user made by choosing healthy foods shows a message to encourage the good alimentation habits or to show the red flag about the type of food the user use to eat.


 - The reference of foods and the mix of that wich could represent an example of a complete and healthy alimentation per day is base at a Brazilian government studies, that can be seen [here](https://bvsms.saude.gov.br/bvs/publicacoes/desmistificando_duvidas_sobre_alimentação_nutricao.pdf).

 This experience is a simple and very low scope, that make an effort to take the attention of the people to be more concerned about their own alimentation habits and try to show a little part of this enormous universe of health alimentation, especially to the youngest. I hope you enjoy and experience a  brief reflexion about your own habits. 😉

 **Let`s do this!**
*/
//#-hidden-code
import PlaygroundSupport
import SpriteKit

public var count:Int = 0

public let health:String = "Oh! Good! \r\nYou seems to have a healthy alimentation habits! \r\nStay consistent!"
public let goodButCanBeBetter:String = "Uhmm, not bad! \r\nBut you can improve your alimentation habits.\r\n;)\r\nTray again, change is a good way."
public let badHabits:String = "Oh, it seems you don’t like so much \r\nto eat healthy foods… \r\nEat junk food is not prohibit, \r\nbut is very important to change \r\nsome bad habits and try to eat heathy food. \r\nLet`s try again?"


public class GameScene: SKScene
{
    
    public var firt:SKLabelNode!
    public var second:SKLabelNode!
    public var click:SKLabelNode!
    
    override public func didMove(to view: SKView)
    {
        
        print("Carregou a primeira tela")
        
        let grow = SKAction.scale(by: 0.8, duration: 0.5)
        let shrink = grow.reversed()
        let sequence = SKAction.sequence([grow, shrink])
        
        let forever = SKAction.repeatForever(sequence)
        
        self.firt = self.childNode(withName: "//firtMessage") as? SKLabelNode
        self.second = self.childNode(withName: "//secondMessage") as? SKLabelNode
        self.click = self.childNode(withName: "//clickHere") as? SKLabelNode
        
        self.click.run (forever)
        self.backgroundColor = #colorLiteral(red: 0.284360641, green: 0.7497976036, blue: 0.2942350984, alpha: 1)
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let touche = touches.first
        {
            let location = touche.location(in:self)
            let touchedNode = self.nodes(at: location).first
            if touchedNode?.name == "clickHere"
            {
//                let hideFirt = SKAction.fadeOut(withDuration: 2)
//                self.firt.run(hideFirt)
//                let hideSecond = SKAction.fadeOut(withDuration: 2)
//                self.second.run(hideSecond)
                print("Chamou a função")
                newScene()
            }
        }
    }
    
    public func newScene()
    {
        if let gameScene = Scene(fileNamed: "Scene")
        {
         gameScene.scaleMode = .aspectFill
         gameScene.isUserInteractionEnabled = true
         self.view!.presentScene(gameScene)
         gameScene.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        }
    }
//    func newScene2()
//    {
//        if let scoreScene = Score(fileNamed: "Score")
//        {
//         scoreScene.scaleMode = .aspectFill
//         scoreScene.isUserInteractionEnabled = true
//         self.view!.presentScene(scoreScene)
//         scoreScene.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.2046456283, blue: 0.1788520522, alpha: 1)
//        }
//    }
}
    
public class Scene: SKScene
{
    public var instructions:SKLabelNode!
    public var hamburguerImage:SKSpriteNode!
    public var bananaImage:SKSpriteNode!
    public var orangeImage:SKSpriteNode!
    public var potatoImage:SKSpriteNode!
    public var broccoliImage:SKSpriteNode!
    public var lettuceImage:SKSpriteNode!
    public var milkshakeImage:SKSpriteNode!
    public var strawberryImage:SKSpriteNode!
    public var hotdogImage:SKSpriteNode!
    public var fishImage:SKSpriteNode!
    public var cokeImage:SKSpriteNode!
    public var milkImage:SKSpriteNode!
    public var eggImage:SKSpriteNode!
    public var meatImage:SKSpriteNode!
    public var watterImage:SKSpriteNode!
    public var wattermelonImage:SKSpriteNode!
    public var popcornImage:SKSpriteNode!
    public var beansImage:SKSpriteNode!
    public var tomattoImage:SKSpriteNode!
    public var appleImage:SKSpriteNode!
    public var riceImage:SKSpriteNode!
    public var cornImage:SKSpriteNode!
    public var frenchfriesImage:SKSpriteNode!
    public var carrotImage:SKSpriteNode!
    public var pizzaImage:SKSpriteNode!
    public var pastaImage:SKSpriteNode!
    
    let foodFall = SKAction.move(by: CGVector (dx: 0, dy: -4900) , duration: 30)
    
    public override func didMove(to view: SKView)
    {
        print("Carregou a nova tela")
        self.instructions = self.childNode(withName: "//instructions") as? SKLabelNode
        self.hamburguerImage = self.childNode(withName: "//hamburguerImage") as? SKSpriteNode
        self.bananaImage = self.childNode(withName: "//bananaImage") as? SKSpriteNode
        self.orangeImage = self.childNode(withName: "//orangeImage") as? SKSpriteNode
        self.potatoImage = self.childNode(withName: "//potatoImage") as? SKSpriteNode
        self.broccoliImage = self.childNode(withName: "//broccoliImage") as? SKSpriteNode
        self.lettuceImage = self.childNode(withName: "//lettuceImage") as? SKSpriteNode
        self.milkshakeImage = self.childNode(withName: "//milkshakeImage") as? SKSpriteNode
        self.strawberryImage = self.childNode(withName: "//strawberryImage") as? SKSpriteNode
        self.hotdogImage = self.childNode(withName: "//hotdogImage") as? SKSpriteNode
        self.fishImage = self.childNode(withName: "//fishImage") as? SKSpriteNode
        self.cornImage = self.childNode(withName: "//cornImage") as? SKSpriteNode
        self.riceImage = self.childNode(withName: "//riceImage") as? SKSpriteNode
        self.cokeImage = self.childNode(withName: "//cokeImage") as? SKSpriteNode
        self.tomattoImage = self.childNode(withName: "//tomattoImage") as? SKSpriteNode
        self.popcornImage = self.childNode(withName: "//popcornImage") as? SKSpriteNode
        self.milkImage = self.childNode(withName: "//milkImage") as? SKSpriteNode
        self.appleImage = self.childNode(withName: "//appleImage") as? SKSpriteNode
        self.frenchfriesImage = self.childNode(withName: "//frenchfriesImage") as? SKSpriteNode
        self.beansImage = self.childNode(withName: "//beansImage") as? SKSpriteNode
        self.wattermelonImage = self.childNode(withName: "//wattermelonImage") as? SKSpriteNode
        self.carrotImage = self.childNode(withName: "//carrotImage") as? SKSpriteNode
        self.eggImage = self.childNode(withName: "//eggImage") as? SKSpriteNode
        self.watterImage = self.childNode(withName: "//watterImage") as? SKSpriteNode
        self.pizzaImage = self.childNode(withName: "//pizzaImage") as? SKSpriteNode
        self.pastaImage = self.childNode(withName: "//pastaImage") as? SKSpriteNode
        
        
        self.hamburguerImage.run(foodFall)
        self.hotdogImage.run(foodFall)
        self.bananaImage.run(foodFall)
        self.orangeImage.run(foodFall)
        self.potatoImage.run(foodFall)
        self.strawberryImage.run(foodFall)
        self.milkshakeImage.run(foodFall)
        self.lettuceImage.run(foodFall)
        self.broccoliImage.run(foodFall)
        self.milkImage.run(foodFall)
        self.frenchfriesImage.run(foodFall)
        self.watterImage.run(foodFall)
        self.wattermelonImage.run(foodFall)
        self.cornImage.run(foodFall)
        self.popcornImage.run(foodFall)
        self.cokeImage.run(foodFall)
        //self.appleImage.run(foodFall)
        self.tomattoImage.run(foodFall)
        self.eggImage.run(foodFall)
        self.riceImage.run(foodFall)
        self.beansImage.run(foodFall)
        self.carrotImage.run(foodFall)
        self.pastaImage.run(foodFall)
        self.pizzaImage.run(foodFall)
        
        self.appleImage.run(foodFall) {
            self.appleImage.removeFromParent()
            print("Maçã caiu!")
            newScene2()
        }
        
        func newScene2()
        {
            if let scoreScene = Score(fileNamed: "Score")
            {
             scoreScene.scaleMode = .aspectFill
             scoreScene.isUserInteractionEnabled = true
             self.view!.presentScene(scoreScene)
             scoreScene.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.2046456283, blue: 0.1788520522, alpha: 1)
            }
        }
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let toucheFood = touches.first
        {
            let locationFood = toucheFood.location(in:self)
            let touchedNode = self.nodes(at: locationFood).first
            switch touchedNode?.name {
            case "hamburguerImage":
                count += 25
                let hide = SKAction.hide()
                self.hamburguerImage.run(hide)
                print(count)
            case "potatoImage":
                count += 100
                let hide = SKAction.hide()
                self.potatoImage.run(hide)
                print(count)
            
            case "hotdogImage":
            count += 25
            let hide = SKAction.hide()
            self.hotdogImage.run(hide)
            print(count)
                
            case "milkshakeImage":
            count += 25
            let hide = SKAction.hide()
            self.milkshakeImage.run(hide)
            print(count)
                
            case "lettuceImage":
            count += 100
            let hide = SKAction.hide()
            self.lettuceImage.run(hide)
            print(count)
                
            case "broccoliImage":
            count += 100
            let hide = SKAction.hide()
            self.broccoliImage.run(hide)
            print(count)
                
            case "strawberryImage":
            count += 100
            let hide = SKAction.hide()
            self.strawberryImage.run(hide)
            print(count)
                
            case "orangeImage":
            count += 100
            let hide = SKAction.hide()
            self.orangeImage.run(hide)
            print(count)
                
            case "bananaImage":
            count += 100
            let hide = SKAction.hide()
            self.bananaImage.run(hide)
            print(count)
                
            case "watterImage":
            count += 100
            let hide = SKAction.hide()
            self.watterImage.run(hide)
            print(count)
                
            case "wattermelonImage":
            count += 100
            let hide = SKAction.hide()
            self.wattermelonImage.run(hide)
            print(count)
                
            case "cokeImage":
            count += 25
            let hide = SKAction.hide()
            self.cokeImage.run(hide)
            print(count)
                
            case "frenchfriesImage":
            count += 25
            let hide = SKAction.hide()
            self.frenchfriesImage.run(hide)
            print(count)
                
            case "meatImage":
            count += 100
            let hide = SKAction.hide()
            self.meatImage.run(hide)
            print(count)
        
            case "eggImage":
            count += 100
            let hide = SKAction.hide()
            self.eggImage.run(hide)
            print(count)
                
            case "fishImage":
            count += 100
            let hide = SKAction.hide()
            self.fishImage.run(hide)
            print(count)
                
            case "cornImage":
            count += 100
            let hide = SKAction.hide()
            self.cornImage.run(hide)
            print(count)
                
            case "popcornImage":
            count += 50
            let hide = SKAction.hide()
            self.popcornImage.run(hide)
            print(count)
                
            case "milkImage":
            count += 100
            let hide = SKAction.hide()
            self.milkImage.run(hide)
            print(count)
                
            case "tomattoImage":
            count += 100
            let hide = SKAction.hide()
            self.tomattoImage.run(hide)
            print(count)
                
            case "beansImage":
            count += 100
            let hide = SKAction.hide()
            self.beansImage.run(hide)
            print(count)
                
            case "riceImage":
            count += 100
            let hide = SKAction.hide()
            self.riceImage.run(hide)
            print(count)
                
            case "carrotImage":
            count += 100
            let hide = SKAction.hide()
            self.carrotImage.run(hide)
            print(count)
                
            case "appleImage":
            count += 100
            let hide = SKAction.hide()
            self.appleImage.run(hide)
            print(count)
            
            case "pizzaImage":
            count += 25
            let hide = SKAction.hide()
            self.pizzaImage.run(hide)
            print(count)
                
            case "pastaImage":
            count += 50
            let hide = SKAction.hide()
            self.pastaImage.run(hide)
            print(count)

            default:
                print("Clique fora da comida")
            }

        }
    }
    
}

//Class Score

class Score:SKScene
{
    private var message:SKLabelNode?
    private var score:SKLabelNode!
    private var points:SKLabelNode!
    
    override func didMove(to view: SKView)
    {
        self.message = self.childNode(withName: "//message") as? SKLabelNode
        self.points = self.childNode(withName: "//points") as? SKLabelNode
        if count>=1100
        {
            self.message?.text = health
        }
        else if count<=500
        {
            self.message?.text = badHabits
            
        }
        else
        {
            self.message?.text = goodButCanBeBetter
        }
        
        self.points.text = String(count)
        
        self.message?.numberOfLines = 0
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
//#-end-hidden-code

