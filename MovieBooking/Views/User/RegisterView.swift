//
//  RegisterView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/20/24.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var userListViewModel: UserListViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State var username: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.orange)
                        
                        TextField("Username", text: $username)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(checkUserName() ? Color.red : Color.gray, lineWidth: 0.3)
                            )
                        
                    }
                    if checkUserName() {
                        Text("Username too short.")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .italic()
                        
                    } else {
                        if userListViewModel.checkUsername(username: username) {
                            Text("Username has already been taken.")
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .italic()
                        } else {
                            Text("A minimum of 4 characters.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .italic()
                        }
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
                                    .stroke(checkPassword() ? Color.red : Color.gray, lineWidth: 0.3)
                            )
                    }
                    
                    if checkPassword() {
                        Text("Password too short.")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .italic()
                    } else {
                        Text("A minimum of 6 characters.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .italic()
                    }
                }
                .padding(.bottom)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.orange)
                        
                        SecureField("Confirm password", text: $confirmPassword)
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(checkConfirmPassword() ? Color.red : Color.gray, lineWidth: 0.3)
                            )
                    }
                    
                    if checkConfirmPassword() {
                        Text("Wrong password.")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .italic()
                        
                    } else {
                        Text("Your confirm password should be the same as password.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .italic()
                    }
                }
                .padding(.bottom)
            }
            .padding(.vertical)
            
            if !checkUserName() && !checkPassword() && !checkConfirmPassword() && checkEmpty() && !userListViewModel.checkUsername(username: username) {
                Button {
                    userListViewModel.addUser(username: username, password: password)
                    
                    dismiss()
                } label: {
                    Text("Register")
                        .padding(.vertical, 10)
                        .padding(.horizontal, UIScreen.screenWidth / 3)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(10)
                }
            } else {
                Text("Register")
                    .padding(.vertical, 10)
                    .padding(.horizontal, UIScreen.screenWidth / 3)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .background(.gray)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
    
    func checkEmpty() -> Bool {
        return username != "" && password != "" && confirmPassword != ""
    }
    
    func checkUserName() -> Bool {
        return username != "" && username.count < 4
    }
    
    func checkPassword() -> Bool {
        return password != "" && password.count < 6
    }
    
    func checkConfirmPassword() -> Bool {
        return password != confirmPassword && password != ""
    }
    
    
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(userListViewModel: UserListViewModel())
    }
}
