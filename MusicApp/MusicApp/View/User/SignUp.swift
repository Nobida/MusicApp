//
//  SignUp.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/4.
//

import SwiftUI

struct SignUp : View {
    
    @StateObject var signUpViewModel = SignUpViewModel()
    @Binding var show : Bool
    
    var body: some View{
        
        ZStack{
            ZStack(alignment: .topLeading) {
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        Image("logo")
                        
                        Text("Log in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(signUpViewModel.color)
                            .padding(.top, 35)
                        
                        TextField("Email", text: $signUpViewModel.email)
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(signUpViewModel.email != "" ? Color("Color") : signUpViewModel.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            
                            VStack{
                                
                                if signUpViewModel.visible{
                                    
                                    TextField("Password", text: $signUpViewModel.pass)
                                    .autocapitalization(.none)
                                }
                                else{
                                    
                                    SecureField("Password", text: $signUpViewModel.pass)
                                    .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                
                                
                                
                            }) {
                                
                                Image(systemName: signUpViewModel.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(signUpViewModel.color)
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(signUpViewModel.pass != "" ? Color("Color") : signUpViewModel.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack(spacing: 15){
                            
                            VStack{
                                
                                if signUpViewModel.revisible{
                                    
                                    TextField("Re-enter", text: $signUpViewModel.repass)
                                    .autocapitalization(.none)
                                }
                                else{
                                    
                                    SecureField("Re-enter", text: $signUpViewModel.repass)
                                    .autocapitalization(.none)
                                }
                            }
                            
                            Button(action: {
                                
                                signUpViewModel.revisible.toggle()
                                
                            }) {
                                
                                Image(systemName: signUpViewModel.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(signUpViewModel.color)
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(signUpViewModel.repass != "" ? Color("Color") : signUpViewModel.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        Button(action: {
                            
                            signUpViewModel.register()
                        }) {
                            
                            Text("Register")
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                                .foregroundColor(.black)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                        
                    }
                    .padding(.horizontal, 25)
                }
                
                Button(action: {
                    
                    signUpViewModel.show.toggle()
                    
                }) {
                    
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            
            if signUpViewModel.alert{
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
  
}
