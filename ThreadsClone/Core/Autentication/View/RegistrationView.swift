//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("threads-app-icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                VStack {
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .modifier(ThreadsTextViewModifier())
                    SecureField("Enter your password", text: $password)
                        .modifier(ThreadsTextViewModifier())
                    TextField("Enter your fullname", text: $fullname)
                        .modifier(ThreadsTextViewModifier())
                    TextField("Enter your username", text: $username)
                        .modifier(ThreadsTextViewModifier())
                }
                Button {
                } label: {
                    Text("Register")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                .padding(.vertical)
                
                Spacer()
                
                Divider()
                NavigationLink {
                    LoginView()  // Navigate to LoginView
                } label: {
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
