//
//  Home.swift
//  Love&Care
//
//  Created by Shimaa Elcc on 18.4.2023.
//

import SwiftUI

struct Home: View {
    
    //Properties
    
    @AppStorage ("isOnboarding") var isOnboarding : Bool = false
    @State var isAnimation : Bool = false
    
    
    //Body
    var body: some View {
        VStack{
            //MARK : - Header
            Spacer()

            ZStack{
                CircleGroupView(circleGroupColor: .gray)
                Image("baby-boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300 , alignment: .center)
                    .offset(y : isAnimation ? 30 : -30 )
                    .animation(.easeOut(duration: 2.5).repeatForever(autoreverses : true) , value: isAnimation)
            }//:ZStack
            Spacer()
            //MARK: - Center

            Text("Having children just puts the whole world into perspective. Evrything else just disappears.")
                .font(.title3)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            //MARK: - Footer

            Button {
                isOnboarding.toggle()
                playsound(soundFile: "success", soundType: "m4a")
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(size: 25 , design: .rounded))
                    .fontWeight(.bold)
                
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            Spacer()


        }//VStack
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+2 ) {
                isAnimation.toggle()
            }
        } 
      
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
