//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 01/06/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView (showsIndicators: false) {
                VStack(spacing:20) {
                    ProfileHeaderView(user: currentUser)
            
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    })
                    UserContentListView()
                }
            }
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
