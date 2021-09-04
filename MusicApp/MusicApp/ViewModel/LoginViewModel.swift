//
//  LoginViewModel.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/4.
//

import Foundation
import SwiftUI
import Firebase


class LoginViewModel: NSObject, ObservableObject {
    
    //ItemData...
    @Published var email = ""
    @Published var visible = false
    @Published var color = Color.black.opacity(0.3)
    @Published var pass = ""
    @Published var alert = false
    @Published var error = ""
    
    
    // verify the user information
    func verify(){
        if self.email != "" && self.pass != ""{
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
        else{
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
    
    
    //reset the 
    func reset(){
        if self.email != ""{
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.error = "RESET"
                self.alert.toggle()
            }
        }
        else{
            self.error = "Email Id is empty"
            self.alert.toggle()
        }
    }
    

}
