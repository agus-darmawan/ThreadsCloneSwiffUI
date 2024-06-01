//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModal = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120,height: 120)
                .padding()
            VStack{
                TextField("Enter your email",text: $viewModal.email)
                    .modifier(ThreadsTextViewModifier())
                SecureField("Enter your password", text: $viewModal.password)
                    .modifier(ThreadsTextViewModifier())
                TextField("Enter your fullname",text: $viewModal.fullname)
                    .modifier(ThreadsTextViewModifier())
                TextField("Enter your username", text: $viewModal.username)
                    .modifier(ThreadsTextViewModifier())
            }
            Button{
                Task {try await viewModal.createUser()}
            }label: {
                Text("Sign Up")
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

            Button{
                dismiss()
            } label : {
                HStack(spacing : 4) {
                    Text("Allredy have an account?")
                     Text ("Sign In")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical,16)
        }
    }
}

#Preview {
    RegistrationView()
}
