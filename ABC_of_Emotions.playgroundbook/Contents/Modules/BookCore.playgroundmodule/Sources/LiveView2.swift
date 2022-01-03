//
//  LiveView2.swift
//  BookCore
//
//  Created by Eduarda Mello on 12/04/21.
//
import SwiftUI
import UIKit
import PlaygroundSupport

struct TestString: Identifiable{
    var id = UUID()
    var title:String
}

struct SecondView: View {
    var mainText: String
    
    //= "The situation that you are dealing with today will be shown here as soon as you complete it on the left, ok?"
    
    @State var scaleValue:CGFloat = 1
    
    let backgroundColor : Color = Color(red: 20/255, green: 32/255, blue: 61/255)
    
    let backgroundColor2 : Color = Color(red: 252/255, green: 163/255, blue: 17/255)
    
    let backgroundColor3 : Color = Color(red: 229/255, green: 229/255, blue: 229/255)
    
    var meMoji : [String] = ["image1","image2", "image3", "image6"]
    
    var emotions: [TestString] = [TestString(title: "Bored"), TestString(title: "Relaxed"), TestString(title: "Brave"), TestString(title: "Excited"), TestString(title: "Angry"), TestString(title: "Cheerful"), TestString(title: "Pround"), TestString(title: "Worried"), TestString(title: "Patient")]
    
    static public var emotionsState: [String: Bool] = ["Bored": false, "Relaxed": false, "Brave": false, "Excited": false, "Angry": false, "Cheerful": false, "Pround": false, "Worried": false, "Patient": false]
    
    var selectedEmotions:Int {
        return SecondView.emotionsState.filter{$0.value}.count
    }
    
    
    var body: some View {
        
        
        VStack(alignment: .center) {
            
            ZStack {
                
                Text("Please, write on your left a situation that you are dealing with today (Ex: broke up with someone or doing bad at work), run the code and than choose at least 3 emotions relataded whith it bellow:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(backgroundColor)
                    .padding()
            }
            .frame(height: 150)
            .background(backgroundColor3)
            .mask(RoundedRectangle(cornerRadius: 40))
            .padding()
            
            ZStack {
                
                Text("\(mainText)")
                    .font(.headline)
                    .padding()
                    .foregroundColor(backgroundColor)
            }
            .frame(height: 65)
            .background(backgroundColor2)
            .mask(RoundedRectangle(cornerRadius: 40))
            .padding()
            
            HStack {
                
                Text("This circle is the representation of your problem:")
                    .aspectRatio(contentMode: .fit)
                    .font(.body)
                    .padding()
                    .foregroundColor(backgroundColor3)
                Spacer()
            }
            
            HStack{
                
                Circle()
                    .frame(width: 300, height: 300, alignment: .center)
                    .foregroundColor(.red)
                    .scaleEffect(scaleValue)
                    .animation(.easeIn)
                    .padding()
                
                ZStack{
                    
                    Circle()
                        .frame(width: 200, height: 200)
                    
                    Image(changeImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            
            Spacer()
            
            HStack {
                
                Text("Choose at least 3 emotions bellow relataded whith the situation that you discrebed:")
                    .font(.body)
                    .foregroundColor(backgroundColor3)
                    .padding()
                Spacer()
            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false){
                creatEmotions()
            }
            .frame(width: 600, height: 20)
            .padding()
            Spacer()
        }
        .frame(width: 640, height: 880)
        .background(backgroundColor)
        .onChange(of: selectedEmotions){ value in
            if selectedEmotions == 3 {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Nice! You just selected the 3 principal emotions that you are feeling when you think about this problem above. Les`s [celebrate!](@next)")
            }
        }
    }
    
    func changeImage() -> String {
        
        var imageSelected : String = "image1"
        
        if selectedEmotions == 2 {
            imageSelected = meMoji[2]
        }
        if selectedEmotions >= 3 {
            imageSelected = meMoji[3]
        }
        if selectedEmotions == 1 {
            imageSelected = meMoji[1]
        }
        if selectedEmotions == 0 {
            imageSelected = meMoji[0]
        }
        return imageSelected
    }
    
    func changeScale() {
        
        let max:CGFloat = 1
        
        let min:CGFloat = 0.1
        
        let step = (max-min) / CGFloat(emotions.count)
        
        print(step)
        
        scaleValue = max - (step*CGFloat(selectedEmotions))
        
        print(scaleValue)
    }
    
    func creatEmotions() -> some View{
        
        return
        
            HStack {
                EmotionsView(title: emotions[0].title,  onChanged: { changeScale() })
                EmotionsView(title: emotions[1].title,  onChanged: { changeScale() })
                EmotionsView(title: emotions[2].title,  onChanged: { changeScale() })
                EmotionsView(title: emotions[3].title,  onChanged: { changeScale() })
                EmotionsView(title: emotions[4].title,  onChanged: { changeScale() })
                EmotionsView(title: emotions[5].title,  onChanged: { changeScale() })
                EmotionsView(title: emotions[6].title,  onChanged: { changeScale() })
                EmotionsView(title: emotions[7].title,  onChanged: { changeScale() })
                EmotionsView(title: emotions[8].title,  onChanged: { changeScale() })
            }
    }
    //    public func changeMainText(text:String){
    //        self.mainText = text
    //    }
}

struct EmotionsView:View {
    
    var uuid = UUID()
    
    var title:String
    
    var onChanged: ()->Void
    
    @State var activate:Bool = false
    
    public var body: some View {
        
        HStack {
        
            Button(action: {
            
                self.activate.toggle()
                SecondView.emotionsState[title] = activate
                onChanged()
            }){
                
                HStack {
                
                    Image("\(title)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("\(title)")
                        .foregroundColor(activate ? Color(.black):.white)
                }
                .frame(minWidth: 100, maxWidth: .infinity, alignment: .center)
                .padding()
                .background(activate ? Color(.white):Color(.black))
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            }
        }
    }
}

public class TestVC: LiveViewController {
    
    let swiftUiView = UIHostingController(rootView: SecondView(mainText: "The situation that you are dealing with today will be shown here as soon as you complete it on the left, ok?"))
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(swiftUiView)
        self.view.addSubview(swiftUiView.view)
        setUpConstraints()
    }
    
    fileprivate func setUpConstraints() {
        
        swiftUiView.view.translatesAutoresizingMaskIntoConstraints = false
        swiftUiView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        swiftUiView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        swiftUiView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        swiftUiView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    override public func receive(_ message: PlaygroundValue) {
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
        if case let .string(problem) = message {
            swiftUiView.rootView = SecondView(mainText: problem)
        }
    }
}

//public extension UIViewController {
//
//    /// Add a SwiftUI View as a child of the input UIView.
//    /// - Parameters:
//    ///   - swiftUIView: The SwiftUI View to add as a child.
//    ///   - view: The UIView instance to which the view should be added.
//    public func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView) -> Content where Content : View {
//        /// Add as a child of the current view controller.
//        addChild(hostingController)
//
//        /// Add the SwiftUI view to the view controller view hierarchy.
//        view.addSubview(hostingController.view)
//
//        /// Setup the contraints to update the SwiftUI view boundaries.
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        let constraints = [
//            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
//            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
//            view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
//            view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
//        ]
//
//        NSLayoutConstraint.activate(constraints)
//
//        /// Notify the hosting controller that it has been moved to the current view controller.
//        hostingController.didMove(toParent: self)
//
//        return hostingController.rootView
//    }
//}

