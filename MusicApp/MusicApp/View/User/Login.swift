//
//  User.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/3.
//

import SwiftUI



struct Login : View {
    


    @StateObject var loginViewModel = LoginViewModel()
    @Binding var show : Bool


    
    var body: some View{
        
        ZStack() {
            
            VStack {
                Image("logo")
                Text("Log in to your account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black.opacity(0.7))
                    .padding(.top, 35)
                
                TextField("Email", text: $loginViewModel.email)
                .autocapitalization(.none)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(loginViewModel.email != "" ? Color("Color") : loginViewModel.color,lineWidth: 2))
                .padding(.top, 25)
                
                HStack(spacing: 15){
                    VStack{
                        
                        if loginViewModel.visible{
                            TextField("Password", text: $loginViewModel.pass)
                            .autocapitalization(.none)
                        }
                        else{
                            SecureField("Password", text: $loginViewModel.pass)
                            .autocapitalization(.none)
                        }
                    }
                    
                    Button(action: {
                        loginViewModel.verify()
                        
                    }) {
                        
                        Image(systemName: loginViewModel.visible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(loginViewModel.color)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(loginViewModel.pass != "" ? Color("Color") : loginViewModel.color,lineWidth: 2))
                .padding(.top, 25)
                
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {
                        //loginViewModel.show.toggle()
                    }) {
                        
                        Text("Forget password")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color"))
                    }
                    
                    Button(action: {
                        loginViewModel.verify()
                        print("asdasd")
                        
                        
                    }) {
                        Text("Log in")
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("Color"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                    
                }
                .padding(.horizontal, 25)
            }
            
            Button(action: {
                
            }) {
                
                Text("Register")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
                    
            }
            .padding()

        }
    }
}



