//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import SwiftUI
import PlaygroundSupport

struct FirstView:View{
    
    let backgroundColor1 : Color = Color(red: 20/255, green: 33/255, blue: 61/255)
    
    var body: some View {
        ZStack{
            backgroundColor1
            CardText1()
            EmojisEmotionsBackground()
        }
    }
}

struct CardText1:View{
    
    @State private var pulsate: Bool = false
    
    let backgroundColor1 : Color = Color(red: 20/255, green: 33/255, blue: 61/255)
    
    let backgroundColor2 : Color = Color(red: 252/255, green: 163/255, blue: 17/255)
    
    let backgroundColor3 : Color = Color(red: 229/255, green: 229/255, blue: 229/255)
    
    var body: some View {
        VStack{
            Text("Welcome to ABC of Emotions!")
                .font(.title)
                .foregroundColor(backgroundColor1)
                .bold()
            Text("By Gáudio Uchôa.")
                .font(.footnote)
                .foregroundColor(backgroundColor1)
                .padding()
            ZStack {
                Text("This Playground experience will guide you to identify a problem that you are facing today and recognize what kind of emotions it causes on you. Let`s go?")
                    .font(.body)
                    .foregroundColor(backgroundColor1)
                    .padding()
            }
            .frame(height: 150)
            .background(backgroundColor3)
            .mask(RoundedRectangle(cornerRadius: 40))
            .padding()
            ZStack {
                Text("Tap Next Page on the left to continue.")
                    .bold()
                    .foregroundColor(backgroundColor3)
                    .padding()
            }
            .background(backgroundColor1)
            .mask(RoundedRectangle(cornerRadius: 40))
        }
        .padding()
        .frame(width: 600, height: 400)
        .background(backgroundColor2)
        .mask(RoundedRectangle(cornerRadius: 40))
    }
}

struct EmojisEmotionsBackground: View {
    
    @State private var pulsate: Bool = false
    
    @State var size: CGFloat = 1.0
    
    var repeatingAnimation: Animation {
            Animation
                .linear(duration: 2)
                .repeatForever()
        }
    
    var body: some View {
        
        VStack {
            
            HStack {
                Image("Excited")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(size)
                    .frame(width: 120, height: 120)
                    .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
                    .padding()
                    .onAppear{
                        withAnimation(self.repeatingAnimation) { self.size = 1.3 }
                        //self.pulsate.toggle()
                    }
                Spacer()
                
                Image("Angry")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(pulsate ? 1.4 : 1.0)
                    .frame(width: 50, height: 50)
                    .animation(Animation.easeInOut(duration: 1.6).repeatForever(autoreverses: true))
                    .padding()
                    .onAppear{
                            self.pulsate.toggle()
                    }
            }
            .padding()
            Spacer()
            HStack {
                Image("Worried")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(pulsate ? 1.3 : 1.0)
                    .frame(width: 80, height: 80)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                    .padding()
                    .onAppear{
                        self.pulsate.toggle()
                    }
                Spacer()
                Image("Love")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(pulsate ? 1.2 : 1.0)
                    .frame(width: 100, height: 100)
                    .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                    .padding()
                    .onAppear{
                        self.pulsate.toggle()
                    }
            }
        }
        .padding()
        .frame(width: 640, height: 880)
    }
}

PlaygroundPage.current.setLiveView(FirstView())
