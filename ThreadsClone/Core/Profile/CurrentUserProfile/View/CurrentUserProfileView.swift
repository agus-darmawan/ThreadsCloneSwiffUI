//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State var showEditProfile = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false) {
                VStack(spacing:20) {
                    ProfileHeaderView(user: currentUser)
            
                    Button(action: {
                        showEditProfile.toggle()
                    }, label: {
                        Text("Edit profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay{
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4),lineWidth: 1)
                            }
                        
                    })
                    UserContentListView()
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                EditProfileView()
                    .environmentObject(viewModel)
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        AuthService.shared.signOut()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
