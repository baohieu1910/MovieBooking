//
//  UserView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/20/24.
//

import SwiftUI

struct UserView: View {
    @ObservedObject var viewModel = UsersViewModel()
    @ObservedObject var userManager = UserManager.shared
    
//    @State var user: User?
    @State var user = User(username: "123", password: "123")
    
    @State var username: String = ""
    @State var password: String = ""
    @State var loginError: Bool = false
    
    var body: some View {
        NavigationView {
//            if let user = user {
            if let user = userManager.currentUser {
                VStack {
                    VStack {
                        HStack {
                            Image(systemName: "person")
                                .font(.system(size: 50))
                                .frame(width: UIScreen.screenWidth / 5, height: UIScreen.screenWidth / 5)
                                .background(Color("LightGray"))
                                .cornerRadius(90)
                                .padding()
                            
                            VStack {
                                Text("\(user.username)")
                                    .font(.title)
                                
                                
                            }
                            
                            Spacer()
                        }
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "clock.arrow.circlepath")
                                
                                Text("History")
                            }
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                        }
                        
                        Divider()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Total Spending")
                            .font(.system(size: 18, weight: .bold))
                        
                        Divider()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Button {
                        userManager.logout()
                    } label: {
                        Text("Log Out")
                            .padding(.vertical)
                            .padding(.horizontal, UIScreen.screenWidth / 3)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .background(.orange)
                            .cornerRadius(10)
                    }
                }
                .padding()
            } else {
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
                        if viewModel.checkLogin(username: username, password: password) {
                            userManager.login(username: username, password: password)
                            
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
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
