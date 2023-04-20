//
//  CircleGroupView.swift
//  Love&Care
//
//  Created by Shimaa Elcc on 18.4.2023.
//

import SwiftUI

struct CircleGroupView: View {
    //properties
    var circleGroupColor : Color = .red
    @State var isAnimation : Bool = false
    
    
    //body
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleGroupColor.opacity(0.2) , lineWidth: 40)
                .frame(width: 260,height: 260 , alignment: .center)
            
            Circle()
                .stroke(circleGroupColor.opacity(0.2)  , lineWidth: 80)
                .frame(width: 260,height: 260 , alignment: .center)
        }//:Zstak
        .scaleEffect(isAnimation ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimation)
        .onAppear{
            isAnimation.toggle()
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView()
    }
}
