//
//  UserView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/20/24.
//

import SwiftUI

struct UserView: View {
    var user: User?
    
    @State var username: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    
                } label: {
                    Text("Login")
                        .padding(.vertical)
                        .padding(.horizontal, UIScreen.screenWidth / 3)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(10)
                }
                
                HStack {
                    Text("Already have an account?")
                    
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Sign up")
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
