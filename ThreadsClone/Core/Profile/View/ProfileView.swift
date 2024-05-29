//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Agus Darmawan on 28/05/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView (showsIndicators: false) {
            VStack(spacing:20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 12) {
                        VStack (alignment: .leading) {
                            Text("Agus Darmawan")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("agusdarmwn")
                                .font(.subheadline)
                        }
                        Text("Lorem ipsum dolor sit amet, consectetur")
                            .font(.footnote)
                        Text("1K follower")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    CircularProfileImageView()
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                })
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
