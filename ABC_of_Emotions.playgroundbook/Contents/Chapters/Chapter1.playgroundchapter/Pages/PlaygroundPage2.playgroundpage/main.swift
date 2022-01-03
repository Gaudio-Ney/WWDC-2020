/*:
 ![Banner](Banner.png)
 
 Hi, I am Gáudio! And today I will guide you to identify a bad situation that you are having. I know that talk about it can be hard sometimes, but I am here to help you, ok?

 For this experience I need your help to **write below a problem that you are coming through nowadays** ✍️:
 
 */

//#-hidden-code

import PlaygroundSupport
class MessageHandler: PlaygroundRemoteLiveViewProxyDelegate {

    func remoteLiveViewProxy(
        _ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy,
        received message: PlaygroundValue
    ) {
        print("Received a message from the always-on live view", message)
    }

    func remoteLiveViewProxyConnectionClosed(_ remoteLiveViewProxy: PlaygroundRemoteLiveViewProxy) {}
}

guard let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else {
    fatalError("Always-on live view not configured in this page's LiveView.swift.")
}

let handler = MessageHandler()

remoteView.delegate = handler

var problem: String = ""

//#-end-hidden-code

problem = /*#-editable-code*/"Tap here the biggest problem that you are facing today, please."/*#-end-editable-code*/

//#-hidden-code

remoteView.send(.string(problem))

//#-end-hidden-code

/*:

 Now, you can **run the code** and **choose 3 emotions** that this situation causes on you.


 **The red circle represents the problem that you shared with me. As you identify what you are feeling, you start to be able to see the problem from a different perspective, see? It can become more distant or even decrease.**


 Great job! 🤩
 

 👉 When you’re done, go to [next page](@next)!
 
*/


