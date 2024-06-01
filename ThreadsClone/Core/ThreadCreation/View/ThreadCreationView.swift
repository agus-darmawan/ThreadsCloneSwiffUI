//
//  ThreadCreationView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct ThreadCreationView: View {
    @StateObject var viewModal = ThreadCreateViewModel()
    @State public var caption = ""
    @Environment (\.dismiss) var dismis
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    var body: some View {
        NavigationStack {
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView(user: user, size: .small)
                    VStack(alignment:.leading, spacing: 4){
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Start a thread", text: $caption, axis: .vertical)
                        
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty{
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel") {
                        dismis()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Post") {
                        Task{try await viewModal.uploadThread(caption: caption)
                            dismis()
                        }
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                }
            }
        }
    }
}


#Preview {
    ThreadCreationView ()
}

