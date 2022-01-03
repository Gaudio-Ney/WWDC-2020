//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import PlaygroundSupport
import BookCore
import SwiftUI

struct ThirdView: View {
    
    @State var mostraBolinha: Bool = false
    
    let backgroundColor3 : Color = Color(red: 229/255, green: 229/255, blue: 229/255)
    
    var body: some View {
        
        ZStack {
            
            backgroundColor3
            if mostraBolinha {
                CelebrateBackground()
            }
            CardText2(mostraBolinha:$mostraBolinha)
            
        }
    }
}

struct CardText2: View {
    
    @State private var pulsate: Bool = false
    
    @Binding var mostraBolinha: Bool
    
    let backgroundColor1 : Color = Color(red: 20/255, green: 33/255, blue: 61/255)
    
    let backgroundColor2 : Color = Color(red: 252/255, green: 163/255, blue: 17/255)
    
    let backgroundColor3 : Color = Color(red: 229/255, green: 229/255, blue: 229/255)
    
    var body: some View {
        
        VStack {
            
            Text("Hey! You did very well! I am proud of your courage to talk about your emotions!")
                .font(.title)
                .foregroundColor(backgroundColor1)
                .bold()
                .padding()
            
            Image(changeImage())
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .padding()
            
            ZStack {
                
                Text("This is only the first step - but a good start- to learn more about what are you feeling and deal better with different situations in your life. \n \nThis exercise has the intention to show how can you get some distance from the problem that you are facing when you are capable to recognize what are you feeling and give a name to that.\n \nI hope that you have enjoyed this experience and have others chances to learn more about the RULER method.\n \nKeep being more self-aware about your emotions. Thanks!")
                    .font(.body)
                    .foregroundColor(backgroundColor1)
                    .padding()
                    .mask(RoundedRectangle(cornerRadius: 40, style:.continuous))
            }
            .frame(height: 300)
            .background(backgroundColor3)
            .mask(RoundedRectangle(cornerRadius: 40))
            .padding()
            
            Button(action: {mostraBolinha = true}){
                
                HStack {
                    Text("Celebrate by clicking here!")
                        .foregroundColor(mostraBolinha ? backgroundColor3:backgroundColor1)
                }
                .frame(alignment: .center)
                .padding()
                .background(mostraBolinha ? backgroundColor1:backgroundColor3)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            }
        }
        .padding()
        .frame(width: 600, height: 768, alignment: .leading)
        .background(backgroundColor2)
        .mask(RoundedRectangle(cornerRadius: 40, style: .continuous))
    }
    func changeImage() -> String {
        
        var imageSelected : String = "goodjob"
        
        if mostraBolinha {
            imageSelected = "celebrate"
        }
        return imageSelected
    }
}

public struct CelebrateBackground: View {
    
    @State public var pulsate: Bool = false
        
    public var body: some View {
        
        VStack {
                HStack {
                    Circle()
                        .foregroundColor(.red)
                        .scaleEffect(pulsate ? 1.9 : 1.1)
                        .frame(width: 120, height: 120)
                        .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
                                        .onAppear{
                                            self.pulsate.toggle()
                                        }
                    Spacer()
                    Circle()
                        .foregroundColor(.yellow)
                        .scaleEffect(pulsate ? 1.9 : 1.1)
                        .frame(width: 80, height: 80)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                        .padding()
                                        .onAppear{
                                            self.pulsate.toggle()
                                        }
                    Spacer()
                    Circle()
                        .foregroundColor(.blue)
                        .scaleEffect(pulsate ? 1.9 : 1.1)
                        .frame(width: 50, height: 50)
                        .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true))
                                        .onAppear{
                                            self.pulsate.toggle()
                                        }
                }
                .padding()
                Spacer()
                HStack {
                    Circle()
                        .foregroundColor(.blue)
                        .scaleEffect(pulsate ? 1.9 : 1.1)
                        .frame(width: 80, height: 80)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                                        .onAppear{
                                            self.pulsate.toggle()
                                        }
                    Spacer()
                    Circle()
                        .foregroundColor(.green)
                        .scaleEffect(pulsate ? 1.6 : 1.1)
                        .frame(width: 120, height: 120)
                        .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
                        .padding()
                                        .onAppear{
                                            self.pulsate.toggle()
                                        }
                    Spacer()
                    Circle()
                        .foregroundColor(.blue)
                        .scaleEffect(pulsate ? 1.6 : 1.1)
                        .frame(width: 100, height: 100)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                                        .onAppear{
                                            self.pulsate.toggle()
                                        }
                }
                Spacer()
                HStack {
                    Circle()
                        .foregroundColor(.yellow)
                        .scaleEffect(pulsate ? 1.6 : 1.1)
                        .frame(width: 80, height: 80)
                        .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                                        .onAppear{
                                            self.pulsate.toggle()
                                        }
                    Spacer()
                    Circle()
                        .foregroundColor(.red)
                        .scaleEffect(pulsate ? 1.9 : 1.1)
                        .frame(width: 120, height: 120)
                        .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
                        .padding()
                                        .onAppear{
                                            self.pulsate.toggle()
                                        }
                    Spacer()
                    Circle()
                        .foregroundColor(.green)
                        .scaleEffect(pulsate ? 1.9 : 1.1)
                        .frame(width: 100, height: 100)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                                        .onAppear{
                                            self.pulsate.toggle()
                                        }
                }
        }
        .padding()
        .frame(width: 640, height: 880)
    }
}

PlaygroundPage.current.setLiveView(ThirdView())
