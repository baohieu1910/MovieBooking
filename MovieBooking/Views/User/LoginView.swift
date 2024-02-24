//
//  LoginView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/21/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var userListViewModel = UserListViewModel()
    
    @State var username: String = ""
    @State var password: String = ""
    @State var loginError: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Login to your account")
                    .font(.system(size: 30, weight: .bold))
                
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.orange)
                            
                            TextField("Username", text: $username)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                            
                        }
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.orange)
                            
                            SecureField("Password", text: $password)
                                .padding(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.gray, lineWidth: 0.3)
                                )
                        }
                    }
                    .padding(.bottom)
                }
                
                
                Button {
                    if userListViewModel.checkLogin(username: username, password: password) {
                        userManager.login(username: username, password: password)
                        dismiss()
                        
                    } else {
                        loginError.toggle()
                    }
                    
                } label: {
                    Text("Login")
                        .padding(.vertical)
                        .padding(.horizontal, UIScreen.screenWidth / 3)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(10)
                }
                .alert("Incorrect username or password. Please try again.", isPresented: $loginError) {
                    Button("OK", role: .cancel) {
                        
                    }
                }
                
                HStack {
                    Text("Already have an account?")
                    
                    NavigationLink {
                        RegisterView(userListViewModel: userListViewModel)
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
