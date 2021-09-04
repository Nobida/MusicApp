//
//  User.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/4.
//


import SwiftUI


struct User : View {
    
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View{
        
        
            
            VStack{
                    NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                        
                        Text("")
                    }
                    .hidden()
                    
                    Login(show: self.$show)

        }
    }
}
