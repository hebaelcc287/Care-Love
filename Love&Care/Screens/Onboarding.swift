//
//  Onboarding.swift
//  Love&Care
//
//  Created by Shimaa Elcc on 18.4.2023.
//

import SwiftUI

struct Onboarding: View {
    
    //Properties
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    @State var isAnimating : Bool = false
    @State  var imageOffset : CGSize = CGSize(width: 0.0, height: 0.0)
    @State var buttonOffSet : CGFloat = 0.0
    @State var buttonWidth : Double = UIScreen.main.bounds.width - 80
    
    
    
    //Body
    var body: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea(.all)
            
            VStack{
                //MARK: - Header
                
                VStack{
                    Text(abs(imageOffset.width) > 0 ? "Care." : "Love.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    
                    Text("life doesn't come wyth a manua , it comes with a mother")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal , 10)
                    
                }//:Vstack
                .offset(y : isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                Spacer()
                
                
                //MARK: - Center
                ZStack{
                    CircleGroupView(circleGroupColor: .white)
                        .offset(x : imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width) / 5 , opaque: false)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .offset( x : imageOffset.width, y :0 )
                        .rotationEffect(.degrees(imageOffset.width / 15))
                        .scaleEffect(isAnimating ? 1: 0.8)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .shadow(color: Color(red: 0, green: 0, blue: 0 , opacity: 0.5), radius: 8 ,x : 3 , y : 30)
                        .overlay(
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.system(size: 40 , weight: .ultraLight, design: .rounded))
                                .foregroundColor(.white)
                                .opacity(abs(imageOffset.width)>0 ? 0 : 1)
                            ,alignment: .bottom
                            
                        )
                        .frame(width: 300,alignment: .center)
                    
                }//ZStack
                .gesture(DragGesture()
                    .onChanged({ gesture in
                      
                        if abs(gesture.translation.width) <= 150{
                            imageOffset =  gesture.translation
                        }
                    })
                        .onEnded({ _ in
                            withAnimation(.easeOut(duration: 0.5)){
                                imageOffset = .zero
                            }
                        })
                )
                
                Spacer()
                
                //MARK: - Footer
                
                ZStack{
                    //1. Background
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    //2.Text
                    Text("Start")
                        .font(.system(size: 30 , design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    
                    //3. Capsule Dynamic
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                        .frame(width: 80 + buttonOffSet)
                        Spacer()
                    }
                    //4.Dragable Circle
                    HStack {
                        ZStack{

                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 25 , weight: .bold , design: .rounded))
                                .foregroundColor(.white)
                        }//zstack (end of Dragable Circle)
                        .frame(width: 80 , alignment: .center)
                        .offset(x : buttonOffSet)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 0.0 && buttonOffSet <= buttonWidth - 80 {
                                    buttonOffSet = gesture.translation.width

                                }

                            })
                                .onEnded({ _ in
                                    withAnimation(.easeOut(duration: 0.5)){
                                        if buttonOffSet >= buttonWidth / 2 {
                                            isOnboarding = false
                                            playsound(soundFile: "chimeup", soundType: "mp3")
                                        }else{
                                            buttonOffSet = 0
                                        }
                                    }
                                   
                                })
                        )
                        Spacer()
                        
                    }//HStack
                }//:ZStack
                .frame(height: 80 , alignment: .center)
                .padding(.horizontal , 40)
                .offset(y : isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }//:VStack
            
            
        }//:ZStack
        .onAppear{
            isAnimating.toggle()
        }
        
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
