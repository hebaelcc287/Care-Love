//
//  ContentView.swift
//  Love&Care
//
//  Created by Shimaa Elcc on 18.4.2023.
//

import SwiftUI

struct ContentView: View {
    //Properties
    @AppStorage("isOnboarding") var isOnboarding  : Bool = true //important
    
    
    //Body
    var body: some View {
       
        if isOnboarding {
            Onboarding()
        } else {
            Home()
        }
         
    }
}


//Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
