//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 31/05/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment (\.dismiss) var dismis
    @StateObject var viewModel = EditProfileViewModel()
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom,.horizontal])
                
                VStack{
                    HStack{
                        VStack (alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Ni Wayan Nia")
                        }
                        Spacer()
                        PhotosPicker(selection: $viewModel.selectedItem){
                            if let image = viewModel.profileImage{
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }else {
                                CircularProfileImageView()
                            }
                        }
                    }
                    Divider()
                    
                    VStack  (alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio...", text: $bio , axis: .vertical)
                    }
                    Divider()
                    
                    VStack  (alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Enter your link... ", text: $link)
                    }
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle("Edit profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        dismis()
                    }, label: {
                        Text("Cancel")
                    })
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        Task{
                            try await viewModel.updateUserData()
                            dismis()
                        }
                    }, label: {
                        Text("Done")
                    })
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
