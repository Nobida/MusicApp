//
//  SignUpViewModel.swift
//  MusicApp
//
//  Created by Joseph Wang on 2021/9/4.
//

import Foundation
import SwiftUI
import Firebase


class SignUpViewModel: NSObject, ObservableObject {
    
    //ItemData...    
    @Published var color = Color.black.opacity(0.7)
    @Published var email = ""
    @Published var pass = ""
    @Published var repass = ""
    @Published var visible = false
    @Published var revisible = false
    @Published var show = false
    @Published var alert = false
    @Published var error = ""
    
    
    
    func register(){
        if self.email != ""{
            if self.pass == self.repass{
                Auth.auth().createUser(withEmail: self.email, password: self.pass) { (res, err) in
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
                self.error = "Password mismatch"
                self.alert.toggle()
            }
        }
        else{
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
}
